import 'dart:async';
import 'dart:io';

import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/domain/model/response/chat_model.dart';
import 'package:ayursh/domain/model/response/internal_consultation_model.dart';
import 'package:ayursh/domain/repository/onboarding_repository.dart';
import 'package:ayursh/domain/util/preference_util.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:video_compress/video_compress.dart';

part 'chat_bloc.freezed.dart';
part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final FirebaseApp firebaseApp;
  final PreferenceUtil preferenceUtil;
  final OnboardingRepository onboardingRepository;
  late StreamSubscription<DatabaseEvent> addSubscription;
  late StreamSubscription<DatabaseEvent> updateSubscription;
  late Reference firebaseReference;

  ChatBloc(
      {required this.firebaseApp,
        required this.preferenceUtil,
        required this.onboardingRepository})
      : super(ChatState.initialize());

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    yield* event.map(initialize: (e) async* {
      var userId = await preferenceUtil.getUserId();
      firebaseReference = FirebaseStorage.instance.ref(userId);
      yield state.copyWith(
          loadingState: LoadingState.isInitial, userId: userId);
      var database = FirebaseDatabase(app: firebaseApp);
      var messageRef =
      database.reference().child('channels').child(e.consultation.id);
      var dataSnapshot = await messageRef.get();
      Map<dynamic, dynamic>? values = dataSnapshot.value as Map?;
      if (values == null || values.values.isEmpty) {
        yield state.copyWith(
            consultation: e.consultation,
            messagesRef: messageRef,
            messages: [],
            totalMessages: 0);
        return;
      }
      var messages = values.values
          .map((value) => ChatModel.fromJson(Map<String, dynamic>.from(value)))
          .toList();
      var totalMessages = messages.length;
      yield state.copyWith(
          consultation: e.consultation,
          messagesRef: messageRef,
          messages: [],
          totalMessages: totalMessages);

      addSubscription = messageRef.onChildAdded.listen((event) {
        var chatModel = ChatModel.fromJson(
            Map<String, dynamic>.from(event.snapshot.value as Map));
        final isMedia = chatModel.type == 'media-image' ||
            chatModel.type == 'media-video' ||
            chatModel.type == 'media-file' ||
            chatModel.type == 'media-audio';
        if (!isMedia || chatModel.message.isNotEmpty) {
          add(ChatEvent.newChat(chatModel));
        }
      });
      updateSubscription = messageRef.onChildChanged.listen((event) {
        var chatModel = ChatModel.fromJson(
            Map<String, dynamic>.from(event.snapshot.value as Map));
        add(ChatEvent.newChat(chatModel));
      });

    }, sendMessage: (e) async* {
      var toUid = state.consultation!.doctorId;
      var fromUid = state.userId;
      var sendAt = DateTime.now().millisecondsSinceEpoch;
      var messageModel =
      ChatModel(false, toUid, sendAt, e.message, 'text', fromUid);
      await state.messagesRef!.push().set(messageModel.toJson());
      onboardingRepository.pushDoctorChatNotification(
          state.consultation!.doctorFcmToken ?? '',
          state.consultation!.patientName ?? '',
          state.consultation!.doctorBookingId);

    }, newChat: (e) async* {
      var messages = <ChatModel>[]
        ..addAll(state.messages!)
        ..add(e.chat);
      yield state.copyWith(messages: messages, totalMessages: messages.length);

    }, newImageChat: (e) async* {
      yield* _uploadMedia(file: e.file, type: 'media-image');
    }, newVideoChat: (e) async* {
      yield* _uploadMedia(file: e.file, type: 'media-video');
    }, newFileChat: (e) async* {
      yield* _uploadMedia(file: e.file, type: 'media-file');
    }, newAudioChat: (e) async* {
      yield* _uploadMedia(file: e.file, type: 'media-audio');
    });
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Upload — compress then putFile (stream, memory safe)
  // ─────────────────────────────────────────────────────────────────────────
  Stream<ChatState> _uploadMedia(
      {required XFile file, required String type}) async* {
    final toUid = state.consultation!.doctorId;
    final fromUid = state.userId;
    final sendAt = DateTime.now().millisecondsSinceEpoch;

    // Push DB placeholder immediately — optimistic already shown on screen
    final mediaRef = state.messagesRef!.push();
    final placeholder = ChatModel(false, toUid, sendAt, '', type, fromUid);
    mediaRef.set(placeholder.toJson()); // fire-and-forget, don't await

    // Notification fire-and-forget
    onboardingRepository.pushDoctorChatNotification(
        state.consultation!.doctorFcmToken ?? '',
        state.consultation!.patientName ?? '',
        state.consultation!.doctorBookingId);

    // Compress based on type
    File uploadFile;
    String fileName;

    switch (type) {
      case 'media-image':
        final compressed = await _compressImage(file);
        uploadFile = compressed;
        fileName = p.basename(compressed.path);
        break;

      case 'media-video':
        final compressed = await _compressVideo(file);
        uploadFile = compressed;
        fileName = p.basename(compressed.path);
        break;

      case 'media-audio':
      // Audio already recorded at low bitrate (aac 64kbps via flutter_sound)
      // No further compress needed — just use file directly
        uploadFile = File(file.path);
        fileName = file.name;
        break;

      default:
        uploadFile = File(file.path);
        fileName = file.name;
    }

    // putFile = stream upload — no full memory load
    final storageRef = firebaseReference
        .child(mediaRef.key ?? '')
        .child(fileName);

    storageRef.putFile(
      uploadFile,
      SettableMetadata(contentType: _contentType(type, fileName)),
    ).whenComplete(() async {
      try {
        final url = await storageRef.getDownloadURL();
        final updated = ChatModel(false, toUid, sendAt, url, type, fromUid);
        await mediaRef.update(updated.toJson());
      } catch (e) {
        debugPrint('Upload finalize error: $e');
      }
    });
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Image compress — quality 72, max 1080px, background isolate
  // ─────────────────────────────────────────────────────────────────────────
  Future<File> _compressImage(XFile file) async {
    try {
      final dir = await getTemporaryDirectory();
      final ext = p.extension(file.path).toLowerCase();
      final isHeic = ext == '.heic' || ext == '.heif';
      final outExt = isHeic ? 'jpg' : ext.replaceAll('.', '');
      final outPath =
          '${dir.path}/${p.basenameWithoutExtension(file.path)}_c.$outExt';

      final result = await FlutterImageCompress.compressAndGetFile(
        file.path,
        outPath,
        quality: 72,
        minWidth: 1080,
        minHeight: 1080,
        format: (ext == '.png') ? CompressFormat.png : CompressFormat.jpeg,
        keepExif: false, // strip EXIF = smaller file
      );
      if (result != null) {
        debugPrint(
            'Image compressed: ${(await File(file.path).length()) ~/ 1024}KB → ${(await File(result.path).length()) ~/ 1024}KB');
        return File(result.path);
      }
    } catch (e) {
      debugPrint('Image compress error: $e');
    }
    return File(file.path);
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Video compress — medium quality, H.264, much smaller file
  // ─────────────────────────────────────────────────────────────────────────
  Future<File> _compressVideo(XFile file) async {
    try {
      final info = await VideoCompress.compressVideo(
        file.path,
        quality: VideoQuality.MediumQuality, // 720p, good balance
        deleteOrigin: false,
        includeAudio: true,
        frameRate: 30,
      );
      if (info != null && info.file != null) {
        debugPrint(
            'Video compressed: ${(await File(file.path).length()) ~/ 1024}KB → ${(await File(info.file!.path).length()) ~/ 1024}KB');
        return info.file!;
      }
    } catch (e) {
      debugPrint('Video compress error: $e');
    }
    return File(file.path);
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Content-Type header for Firebase Storage
  // ─────────────────────────────────────────────────────────────────────────
  String _contentType(String type, String fileName) {
    final ext = p.extension(fileName).toLowerCase();
    switch (type) {
      case 'media-image':
        return ext == '.png' ? 'image/png' : 'image/jpeg';
      case 'media-video':
        return 'video/mp4';
      case 'media-audio':
        return 'audio/aac';
      default:
        return 'application/octet-stream';
    }
  }
}