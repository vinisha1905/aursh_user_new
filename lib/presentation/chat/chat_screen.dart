import 'dart:async';
import 'dart:io';

import 'package:ayursh/application/chat/chat_bloc.dart';
import 'package:ayursh/domain/model/response/chat_model.dart';
import 'package:ayursh/domain/model/response/internal_consultation_model.dart';
import 'package:ayursh/presentation/chat/video_player_screen.dart';
import 'package:ayursh/presentation/photo_view/photo_view_screen.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/route_wrapper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart' as ja;
import 'package:path/path.dart' as p;
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:open_filex/open_filex.dart';
import 'package:url_launcher/url_launcher.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Global notifier — only one audio plays at a time across all bubbles
// ─────────────────────────────────────────────────────────────────────────────
final ValueNotifier<String?> _currentlyPlayingId = ValueNotifier(null);

// ─────────────────────────────────────────────────────────────────────────────
// Audio Bubble — self-contained player per message
// ─────────────────────────────────────────────────────────────────────────────
class AudioBubble extends StatefulWidget {
  final String audioId;
  final String? url;
  final String? localPath;
  final bool isUser;
  final Color bgColor;

  const AudioBubble({
    Key? key,
    required this.audioId,
    this.url,
    this.localPath,
    required this.isUser,
    required this.bgColor,
  }) : super(key: key);

  @override
  State<AudioBubble> createState() => _AudioBubbleState();
}

class _AudioBubbleState extends State<AudioBubble> {
  final ja.AudioPlayer _player = ja.AudioPlayer();
  bool _loading = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  late StreamSubscription _posSub;
  late StreamSubscription _durSub;
  late StreamSubscription _stateSub;

  @override
  void initState() {
    super.initState();
    _posSub = _player.positionStream.listen((p) {
      if (mounted) setState(() => _position = p);
    });
    _durSub = _player.durationStream.listen((d) {
      if (mounted && d != null) setState(() => _duration = d);
    });
    _stateSub = _player.playerStateStream.listen((s) {
      if (s.processingState == ja.ProcessingState.completed) {
        _player.seek(Duration.zero);
        _player.pause();
        if (_currentlyPlayingId.value == widget.audioId) {
          _currentlyPlayingId.value = null;
        }
      }
      if (mounted) setState(() {});
    });
    _currentlyPlayingId.addListener(_onGlobalChanged);
  }

  void _onGlobalChanged() {
    if (_currentlyPlayingId.value != widget.audioId && _player.playing) {
      _player.pause();
    }
  }

  bool _loaded = false;

  Future<void> _toggle() async {
    if (_player.playing) {
      await _player.pause();
      _currentlyPlayingId.value = null;
      return;
    }
    if (mounted) setState(() => _loading = true);
    try {
      if (!_loaded) {
        if (widget.localPath != null && widget.localPath!.isNotEmpty) {
          await _player.setFilePath(widget.localPath!);
        } else if (widget.url != null && widget.url!.isNotEmpty) {
          await _player.setAudioSource(
            ja.AudioSource.uri(Uri.parse(widget.url!)),
          );
        }
        _loaded = true;
      }
      _currentlyPlayingId.value = widget.audioId;
      await _player.play();
    } catch (e) {
      debugPrint('AudioBubble play error: $e');
    }
    if (mounted) setState(() => _loading = false);
  }

  String _fmt(Duration d) {
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  void dispose() {
    _currentlyPlayingId.removeListener(_onGlobalChanged);
    _posSub.cancel();
    _durSub.cancel();
    _stateSub.cancel();
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ic = widget.isUser ? Colors.white : AppColors.darkBlue;
    final isPlaying = _player.playing;
    final progress = _duration.inMilliseconds > 0
        ? (_position.inMilliseconds / _duration.inMilliseconds).clamp(0.0, 1.0)
        : 0.0;
    final timeLabel = (_position > Duration.zero || isPlaying)
        ? _fmt(_position)
        : _fmt(_duration);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      color: widget.bgColor,
      width: 200,
      child: Row(children: [
        GestureDetector(
          onTap: _toggle,
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
                color: ic.withOpacity(0.15), shape: BoxShape.circle),
            child: _loading
                ? Padding(
                padding: EdgeInsets.all(8),
                child: CircularProgressIndicator(color: ic, strokeWidth: 2))
                : Icon(isPlaying ? Icons.pause : Icons.play_arrow,
                color: ic, size: 22),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: ic.withOpacity(0.2),
                  valueColor: AlwaysStoppedAnimation(ic),
                  minHeight: 3,
                ),
              ),
              SizedBox(height: 4),
              Text(timeLabel, style: TextStyle(color: ic, fontSize: 10)),
            ],
          ),
        ),
      ]),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Chat Arguments
// ─────────────────────────────────────────────────────────────────────────────
class ChatArguments {
  final InternalConsultationModel consultation;

  const ChatArguments({required this.consultation});
}

// ─────────────────────────────────────────────────────────────────────────────
// Optimistic item
// ─────────────────────────────────────────────────────────────────────────────
class _OptimisticItem {
  final String key;
  final XFile? localFile;
  final String? localText;
  final String fromUid;
  final int sendAt;
  final String type;

  _OptimisticItem.text({
    required this.key,
    required String text,
    required this.fromUid,
  })  : localText = text,
        localFile = null,
        sendAt = DateTime.now().millisecondsSinceEpoch,
        type = 'text';

  _OptimisticItem.media({
    required this.key,
    required XFile file,
    required this.fromUid,
    required this.type,
  })  : localFile = file,
        localText = null,
        sendAt = DateTime.now().millisecondsSinceEpoch;
}

// ─────────────────────────────────────────────────────────────────────────────
// ChatScreen
// ─────────────────────────────────────────────────────────────────────────────
class ChatScreen extends StatefulWidget with RouteWrapper {
  static final String routName = '/chat';
  final ChatArguments arguments;

  ChatScreen({Key? key, required this.arguments}) : super(key: key);

  @override
  ChatScreenState createState() => ChatScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<ChatBloc>()
        ..add(ChatEvent.initialize(arguments.consultation)),
      child: this,
    );
  }
}

class ChatScreenState extends State<ChatScreen> {
  final DateFormat _dateFormat = DateFormat('dd,MMM hh:mm aa');
  late TextEditingController _messageController;
  final ImagePicker _picker = ImagePicker();

  int _optimisticKeyCounter = 0;
  final List<_OptimisticItem> _optimisticItems = [];

  String get _nextKey => 'opt_${_optimisticKeyCounter++}';

  // Recording state
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  bool _recorderReady = false;
  bool _isRecording = false;
  Timer? _recordTimer;
  int _recordSeconds = 0;
  String? _recordingPath;

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
    _openRecorder();
    // Clear stale optimistic items when returning to screen
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _clearStaleOptimistics());
  }

  void _clearStaleOptimistics() {
    if (!mounted) return;
    final messages = context.read<ChatBloc>().state.messages;
    if (messages == null || messages.isEmpty) return;
    setState(() {
      final serverTexts = messages.map((m) => m.message).toSet();
      _optimisticItems.removeWhere((item) =>
      item.type == 'text' && serverTexts.contains(item.localText));
      _optimisticItems.removeWhere((item) {
        if (item.type == 'text') return false;
        return messages.any((m) =>
        m.type == item.type &&
            m.fromUid == item.fromUid &&
            m.message.isNotEmpty &&
            (m.sendAt - item.sendAt).abs() < 300000);
      });
    });
  }

  Future<void> _openRecorder() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) return;
    await _recorder.openRecorder();
    setState(() => _recorderReady = true);
  }

  @override
  void dispose() {
    _messageController.dispose();
    _recorder.closeRecorder();
    _recordTimer?.cancel();
    super.dispose();
  }

  String _typeFromFile(XFile file) {
    final ext = p.extension(file.path).toLowerCase();
    const videoExts = ['.mp4', '.mov', '.avi', '.mkv', '.wmv', '.3gp', '.webm'];
    const imageExts = ['.jpg', '.jpeg', '.png', '.gif', '.webp', '.heic'];
    const audioExts = [
      '.mp3',
      '.aac',
      '.m4a',
      '.wav',
      '.ogg',
      '.opus',
      '.flac'
    ];
    if (videoExts.contains(ext)) return 'media-video';
    if (imageExts.contains(ext)) return 'media-image';
    if (audioExts.contains(ext)) return 'media-audio';
    return 'media-file';
  }

  // ── Recording ─────────────────────────────────────────────────────────────
  Future<void> _startRecording() async {
    if (_isRecording || !_recorderReady) return;
    final dir = await getTemporaryDirectory();
    final path =
        '${dir.path}/audio_${DateTime.now().millisecondsSinceEpoch}.aac';
    await _recorder.startRecorder(
      toFile: path,
      codec: Codec.aacADTS,
      bitRate: 32000,    // 32 kbps — voice quality, ~4KB/s
      sampleRate: 16000, // 16 kHz — sufficient for voice
      numChannels: 1,    // mono — half the size of stereo
    );
    setState(() {
      _isRecording = true;
      _recordSeconds = 0;
      _recordingPath = path;
    });
    _recordTimer = Timer.periodic(
        Duration(seconds: 1), (_) => setState(() => _recordSeconds++));
  }

  Future<void> _stopAndSend(BuildContext context) async {
    _recordTimer?.cancel();
    await _recorder.stopRecorder();
    final path = _recordingPath;
    setState(() {
      _isRecording = false;
      _recordingPath = null;
    });
    if (path == null) return;
    final file = XFile(path);
    final uid = context.read<ChatBloc>().state.userId;
    setState(() {
      _optimisticItems.add(_OptimisticItem.media(
          key: _nextKey, file: file, fromUid: uid, type: 'media-audio'));
    });
    context.read<ChatBloc>().add(ChatEvent.newAudioChat(file));
  }

  Future<void> _cancelRecording() async {
    _recordTimer?.cancel();
    await _recorder.stopRecorder();
    setState(() {
      _isRecording = false;
      _recordSeconds = 0;
      _recordingPath = null;
    });
  }

  String _fmtRecordTime(int s) =>
      '${(s ~/ 60).toString().padLeft(2, '0')}:${(s % 60).toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            // ── Header ───────────────────────────────────────────────────
            Card(
              margin: EdgeInsets.zero,
              child: Row(children: [
                IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.arrow_back_rounded,
                        color: AppColors.darkGray)),
                SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.only(top: 6, bottom: 6),
                  child: ClipOval(
                      child: Container(
                        width: 42,
                        height: 42,
                        child: AspectRatio(
                            aspectRatio: 1,
                            child: CachedNetworkImage(
                              imageUrl: widget.arguments.consultation.displayImage,
                              width: 42,
                              height: 42,
                              fit: BoxFit.fill,
                              errorWidget: (ctx, a, b) =>
                                  Container(color: AppColors.grayLight),
                            )),
                      )),
                ),
                SizedBox(width: 12),
                Expanded(
                    child: Text(
                      widget.arguments.consultation.displayName,
                      style: TextStyle(
                          color: AppColors.darkBlue,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    )),
              ]),
            ),
            // ── Chat body ─────────────────────────────────────────────────
            Expanded(
                child: BlocConsumer<ChatBloc, ChatState>(
                  listener: (ctx, state) {
                    if (state.messages == null || state.messages!.isEmpty) return;
                    setState(() {
                      final serverTexts =
                      state.messages!.map((m) => m.message).toSet();
                      _optimisticItems.removeWhere((item) =>
                      item.type == 'text' &&
                          serverTexts.contains(item.localText));

                      // For media: match by type + fromUid + sendAt proximity (within 5 min)
                      // Each optimistic item is removed only when server has a confirmed
                      // (non-empty URL) message with same type, same sender, and sendAt
                      // within 5 minutes of the optimistic item's sendAt.
                      _optimisticItems.removeWhere((item) {
                        if (item.type == 'text') return false;
                        return state.messages!.any((m) =>
                        m.type == item.type &&
                            m.fromUid == item.fromUid &&
                            m.message.isNotEmpty &&
                            (m.sendAt - item.sendAt).abs() <
                                300000); // 5 min window
                      });
                    });
                  },
                  builder: (ctx, state) {
                    if (state.messages == null) {
                      return Column(children: [
                        Expanded(
                            child: Center(
                                child: CircularProgressIndicator(
                                    color: AppColors.darkBlue))),
                        _textInputWidget(context),
                      ]);
                    }
                    final allReversed = [
                      ..._optimisticItems.reversed
                          .map((o) => _buildOptimisticRow(o)),
                      ...state.messages!.reversed.map((m) => _buildServerRow(m)),
                    ];
                    return Column(children: [
                      Expanded(
                        child: ListView.builder(
                          reverse: true,
                          addRepaintBoundaries: false,
                          itemCount: allReversed.length,
                          itemBuilder: (ctx, i) => allReversed[i],
                        ),
                      ),
                      _textInputWidget(context),
                    ]);
                  },
                )),
          ],
        ),
      ),
    );
  }

  // ── Server row/bubble ────────────────────────────────────────────────────
  Widget _buildServerRow(ChatModel message) {
    final isUser = message.fromUid != widget.arguments.consultation.doctorId;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        if (isUser) Expanded(flex: 1, child: Container()),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment:
            isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              _buildServerBubble(message),
              SizedBox(height: 6),
              Text(
                _dateFormat.format(
                    DateTime.fromMillisecondsSinceEpoch(message.sendAt)),
                style: TextStyle(fontSize: 12, color: AppColors.darkGray),
              ),
            ],
          ),
        ),
        if (!isUser) Expanded(flex: 1, child: Container()),
      ]),
    );
  }

  Widget _buildServerBubble(ChatModel message) {
    final isUser = message.fromUid != widget.arguments.consultation.doctorId;
    final textColor = isUser ? Colors.white : Colors.black;
    final bgColor = isUser ? AppColors.darkBlue : AppColors.doctorChat;
    final radius = _bubbleBorderRadius(isUser);
    Widget child;

    switch (message.type) {
      case 'text':
        child = Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 13),
          color: bgColor,
          child: Text(message.message,
              style: TextStyle(color: textColor, height: 1.3)),
        );
        break;

      case 'media-image':
        child = message.message.isEmpty
            ? _mediaUploadingPlaceholder(bgColor, Icons.image_outlined, isUser)
            : GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(
              PhotoViewScreen.routName,
              arguments: PhotoViewArguments(message.message)),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
            color: bgColor,
            child: CachedNetworkImage(
              width: 100,
              height: 80,
              imageUrl: message.message,
              fadeInDuration: Duration.zero,
              fadeOutDuration: Duration.zero,
              fit: BoxFit.cover,
              placeholder: (ctx, url) => Container(
                width: 100,
                height: 80,
                color: bgColor,
                child: Center(
                    child: CircularProgressIndicator(
                        color: isUser ? Colors.white : AppColors.darkBlue,
                        strokeWidth: 2)),
              ),
              errorWidget: (ctx, a, b) => Container(
                  color: AppColors.grayLight,
                  width: 100,
                  height: 80,
                  child: Icon(Icons.broken_image_outlined,
                      color: Colors.grey, size: 32)),
            ),
          ),
        );
        break;

      case 'media-video':
        child = message.message.isEmpty
            ? _mediaUploadingPlaceholder(
            bgColor, Icons.videocam_outlined, isUser)
            : GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(
              VideoPlayerScreen.routName,
              arguments: VideoPlayerArguments(url: message.message)),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
            color: bgColor,
            child: Stack(alignment: Alignment.center, children: [
              Container(
                  width: 100,
                  height: 80,
                  color: Colors.black54,
                  child: Icon(Icons.movie_outlined,
                      color: Colors.white54, size: 32)),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black45, shape: BoxShape.circle),
                padding: EdgeInsets.all(10),
                child:
                Icon(Icons.play_arrow, color: Colors.white, size: 28),
              ),
            ]),
          ),
        );
        break;

      case 'media-audio':
        child = message.message.isEmpty
            ? _audioUploadingPlaceholder(bgColor, isUser)
            : AudioBubble(
          audioId: 'server_${message.sendAt}_${message.fromUid}',
          url: message.message,
          isUser: isUser,
          bgColor: bgColor,
        );
        break;

      case 'media-file':
        if (message.message.isEmpty) {
          child = _mediaUploadingPlaceholder(
              bgColor, Icons.insert_drive_file_outlined, isUser);
        } else {
          final rawName = Uri.decodeComponent(
              message.message.split('/').last.split('?').first);
          final fileName = rawName.isNotEmpty ? rawName : 'Document';
          final ext = p
              .extension(fileName)
              .toLowerCase()
              .replaceAll('.', '')
              .toUpperCase();
          final extColor = _extColor(ext);
          child = GestureDetector(
            onTap: () async {
              final uri = Uri.tryParse(message.message);
              if (uri != null && uri.hasAuthority && await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              }
            },
            child: Container(
              width: 220,
              padding: EdgeInsets.all(10),
              color: bgColor,
              child: Row(children: [
                // File type icon box
                Container(
                  width: 42,
                  height: 48,
                  decoration: BoxDecoration(
                    color: extColor.withOpacity(isUser ? 0.25 : 0.12),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(_extIcon(ext),
                          color: isUser ? Colors.white : extColor, size: 20),
                      if (ext.isNotEmpty)
                        Text(ext.length > 4 ? ext.substring(0, 4) : ext,
                            style: TextStyle(
                                color: isUser ? Colors.white70 : extColor,
                                fontSize: 8,
                                fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fileName,
                        style: TextStyle(
                            color: textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Row(children: [
                        Icon(Icons.download_outlined,
                            color: textColor.withOpacity(0.6), size: 12),
                        SizedBox(width: 3),
                        Text('Tap to open',
                            style: TextStyle(
                                color: textColor.withOpacity(0.6),
                                fontSize: 10)),
                      ]),
                    ],
                  ),
                ),
              ]),
            ),
          );
        }
        break;

      default:
        child = Container();
    }
    return ClipRRect(borderRadius: radius, child: child);
  }

  // ── Optimistic row/bubble ─────────────────────────────────────────────────
  Widget _buildOptimisticRow(_OptimisticItem item) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        Expanded(flex: 1, child: Container()),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildOptimisticBubble(item),
              SizedBox(height: 6),
              Text(
                _dateFormat
                    .format(DateTime.fromMillisecondsSinceEpoch(item.sendAt)),
                style: TextStyle(fontSize: 12, color: AppColors.darkGray),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget _buildOptimisticBubble(_OptimisticItem item) {
    final bgColor = AppColors.darkBlue;
    final radius  = _bubbleBorderRadius(true);
    Widget child;

    switch (item.type) {
    // ── Text ────────────────────────────────────────────────────────────
      case 'text':
        child = Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 13),
          color: bgColor,
          child: Text(item.localText ?? '',
              style: TextStyle(color: Colors.white, height: 1.3)),
        );
        break;

    // ── Image — show local file, tap opens full screen ──────────────────
      case 'media-image':
        child = GestureDetector(
          onTap: () {
            // Open local image full screen immediately
            Navigator.of(context).pushNamed(
              PhotoViewScreen.routName,
              arguments: PhotoViewArguments(item.localFile!.path, isLocal: true),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
            color: bgColor,
            child: Image.file(
              File(item.localFile!.path),
              width: 100,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        );
        break;

    // ── Video — local thumbnail, tap plays local file ───────────────────
      case 'media-video':
        child = GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              VideoPlayerScreen.routName,
              arguments: VideoPlayerArguments(
                localPath: item.localFile!.path,
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
            color: bgColor,
            child: Stack(alignment: Alignment.center, children: [
              // Thumbnail from local file
              ClipRRect(
                child: Image.file(
                  File(item.localFile!.path),
                  width: 100,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 100,
                    height: 80,
                    color: Colors.black54,
                    child: Icon(Icons.movie_outlined,
                        color: Colors.white54, size: 32),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black45, shape: BoxShape.circle),
                padding: EdgeInsets.all(10),
                child: Icon(Icons.play_arrow, color: Colors.white, size: 28),
              ),
            ]),
          ),
        );
        break;

    // ── Audio — playable immediately from local recorded file ───────────
      case 'media-audio':
        child = AudioBubble(
          audioId: item.key,
          localPath: item.localFile!.path,
          isUser: true,
          bgColor: bgColor,
        );
        break;

    // ── File — show name, tap opens local file ──────────────────────────
      case 'media-file':
        final fileName = p.basename(item.localFile!.path);
        final ext = p.extension(fileName)
            .toLowerCase()
            .replaceAll('.', '')
            .toUpperCase();
        final extColor = _extColor(ext);
        child = GestureDetector(
          onTap: () async {
            // OpenFile handles content:// and file:// paths correctly
            await OpenFilex.open(item.localFile!.path);
          },
          child: Container(
            width: 220,
            padding: EdgeInsets.all(10),
            color: bgColor,
            child: Row(children: [
              Container(
                width: 42,
                height: 48,
                decoration: BoxDecoration(
                  color: extColor.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(_extIcon(ext), color: Colors.white, size: 20),
                    if (ext.isNotEmpty)
                      Text(
                        ext.length > 4 ? ext.substring(0, 4) : ext,
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 8,
                            fontWeight: FontWeight.bold),
                      ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(fileName,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                    SizedBox(height: 4),
                    Text('Tap to open',
                        style: TextStyle(
                            color: Colors.white60, fontSize: 10)),
                  ],
                ),
              ),
            ]),
          ),
        );
        break;

      default:
        child = Container();
    }
    return ClipRRect(borderRadius: radius, child: child);
  }

  // ── Helpers ────────────────────────────────────────────────────────────

  // Generic media uploading placeholder — shows icon + uploading label
  Widget _mediaUploadingPlaceholder(Color bgColor, IconData icon, bool isUser) {
    final ic = isUser ? Colors.white : AppColors.darkBlue;
    return Container(
      width: 120,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      color: bgColor,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, color: ic.withOpacity(0.5), size: 28),
        SizedBox(height: 8),
        SizedBox(
          width: 18,
          height: 18,
          child: CircularProgressIndicator(color: ic, strokeWidth: 2),
        ),
        SizedBox(height: 6),
        Text('Uploading...',
            style: TextStyle(color: ic.withOpacity(0.7), fontSize: 10)),
      ]),
    );
  }

  // Audio-specific uploading placeholder — looks like disabled AudioBubble
  Widget _audioUploadingPlaceholder(Color bgColor, bool isUser) {
    final ic = isUser ? Colors.white : AppColors.darkBlue;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      color: bgColor,
      width: 200,
      child: Row(children: [
        Container(
          width: 36,
          height: 36,
          decoration:
          BoxDecoration(color: ic.withOpacity(0.1), shape: BoxShape.circle),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: CircularProgressIndicator(color: ic, strokeWidth: 2),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: null, // indeterminate
                backgroundColor: ic.withOpacity(0.15),
                valueColor: AlwaysStoppedAnimation(ic.withOpacity(0.4)),
                minHeight: 3,
              ),
            ),
            SizedBox(height: 4),
            Text('Uploading...',
                style: TextStyle(color: ic.withOpacity(0.6), fontSize: 10)),
          ]),
        ),
      ]),
    );
  }

  Widget _uploadingPlaceholder(Color bgColor) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      color: bgColor,
      child: Container(
        width: 100,
        height: 80,
        color: AppColors.grayLight,
        child: Center(
            child: CircularProgressIndicator(
                color: AppColors.darkBlue, strokeWidth: 2)),
      ),
    );
  }

  Widget _uploadingOverlay() {
    return Positioned.fill(
      child: Container(
        color: Colors.black26,
        child: Center(
          child: SizedBox(
              width: 22,
              height: 22,
              child: CircularProgressIndicator(
                  color: Colors.white, strokeWidth: 2)),
        ),
      ),
    );
  }

  BorderRadius _bubbleBorderRadius(bool isUser) {
    return BorderRadius.only(
      topLeft: isUser ? Radius.circular(12) : Radius.zero,
      topRight: Radius.circular(12),
      bottomLeft: Radius.circular(12),
      bottomRight: isUser ? Radius.zero : Radius.circular(12),
    );
  }

  // ── File extension helpers ─────────────────────────────────────────────
  Color _extColor(String ext) {
    switch (ext) {
      case 'PDF':
        return Colors.red;
      case 'DOC':
      case 'DOCX':
        return Colors.blue;
      case 'XLS':
      case 'XLSX':
        return Colors.green;
      case 'PPT':
      case 'PPTX':
        return Colors.orange;
      case 'ZIP':
      case 'RAR':
        return Colors.purple;
      case 'TXT':
        return Colors.blueGrey;
      default:
        return Colors.teal;
    }
  }

  IconData _extIcon(String ext) {
    switch (ext) {
      case 'PDF':
        return Icons.picture_as_pdf_outlined;
      case 'DOC':
      case 'DOCX':
        return Icons.article_outlined;
      case 'XLS':
      case 'XLSX':
        return Icons.table_chart_outlined;
      case 'PPT':
      case 'PPTX':
        return Icons.slideshow_outlined;
      case 'ZIP':
      case 'RAR':
        return Icons.folder_zip_outlined;
      case 'TXT':
        return Icons.text_snippet_outlined;
      default:
        return Icons.insert_drive_file_outlined;
    }
  }

  void _sendMedia(BuildContext context, XFile file) {
    final type = _typeFromFile(file);
    final uid = context.read<ChatBloc>().state.userId;
    setState(() {
      _optimisticItems.add(_OptimisticItem.media(
          key: _nextKey, file: file, fromUid: uid, type: type));
    });
    switch (type) {
      case 'media-image':
        context.read<ChatBloc>().add(ChatEvent.newImageChat(file));
        break;
      case 'media-video':
        context.read<ChatBloc>().add(ChatEvent.newVideoChat(file));
        break;
      case 'media-audio':
        context.read<ChatBloc>().add(ChatEvent.newAudioChat(file));
        break;
      case 'media-file':
        context.read<ChatBloc>().add(ChatEvent.newFileChat(file));
        break;
    }
  }

  void _showAttachmentSheet(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (_) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _attachOption(
                icon: Icons.image_outlined,
                label: 'Image',
                color: Colors.purple,
                onTap: () async {
                  Navigator.pop(ctx);
                  final f =
                  await _picker.pickImage(source: ImageSource.gallery);
                  if (f == null) return;
                  _sendMedia(ctx, f);
                },
              ),
              _attachOption(
                icon: Icons.videocam_outlined,
                label: 'Video',
                color: Colors.red,
                onTap: () async {
                  Navigator.pop(ctx);
                  final f =
                  await _picker.pickVideo(source: ImageSource.gallery);
                  if (f == null) return;
                  _sendMedia(ctx, f);
                },
              ),
              _attachOption(
                icon: Icons.insert_drive_file_outlined,
                label: 'File',
                color: Colors.blue,
                onTap: () async {
                  Navigator.pop(ctx);
                  final result = await FilePicker.platform.pickFiles();
                  if (result == null || result.files.isEmpty) return;
                  final path = result.files.single.path;
                  if (path == null) return;
                  _sendMedia(ctx, XFile(path));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _attachOption({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: color.withOpacity(0.12),
          child: Icon(icon, color: color, size: 26),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 12, color: AppColors.darkGray)),
      ]),
    );
  }

  // ── Input bar ───────────────────────────────────────────────────────────
  Widget _textInputWidget(BuildContext context) {
    // Recording mode — replaces normal bar
    if (_isRecording) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        color: Colors.red.shade50,
        child: Row(children: [
          // Cancel
          IconButton(
            onPressed: _cancelRecording,
            icon: Icon(Icons.delete_outline, color: Colors.red),
            tooltip: 'Cancel',
          ),
          // Timer
          Expanded(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.fiber_manual_record, color: Colors.red, size: 12),
              SizedBox(width: 6),
              Text(
                _fmtRecordTime(_recordSeconds),
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ]),
          ),
          // Send recording
          IconButton(
            onPressed: () => _stopAndSend(context),
            icon: Icon(Icons.send, color: AppColors.darkBlue),
            tooltip: 'Send',
          ),
        ]),
      );
    }

    // Normal mode
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(children: [
        IconButton(
          padding: EdgeInsets.all(0),
          constraints: BoxConstraints(),
          onPressed: () => _showAttachmentSheet(context),
          icon: Icon(Icons.attach_file_rounded, color: AppColors.darkBlue),
        ),
        SizedBox(width: 4),
        IconButton(
          padding: EdgeInsets.all(0),
          constraints: BoxConstraints(),
          onPressed: () async {
            final f = await _picker.pickImage(source: ImageSource.camera);
            if (f == null) return;
            _sendMedia(context, f);
          },
          icon: Icon(Icons.camera_alt_outlined, color: AppColors.darkBlue),
        ),
        SizedBox(width: 8),
        Expanded(
          child: TextField(
            controller: _messageController,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 9),
              hintText: 'Send Message',
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.darkBlue)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.darkBlue)),
            ),
          ),
        ),
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: _messageController,
          builder: (ctx, value, _) {
            final hasText = value.text.trim().isNotEmpty;
            if (hasText) {
              return IconButton(
                onPressed: () {
                  final text = _messageController.text.trim();
                  if (text.isEmpty) return;
                  final uid = context.read<ChatBloc>().state.userId;
                  setState(() {
                    _optimisticItems.add(_OptimisticItem.text(
                        key: _nextKey, text: text, fromUid: uid));
                  });
                  context.read<ChatBloc>().add(ChatEvent.sendMessage(text));
                  _messageController.clear();
                },
                icon: Icon(Icons.send, color: AppColors.darkBlue),
              );
            }
            // Mic button — tap = start recording
            return IconButton(
              onPressed: _startRecording,
              icon: Icon(Icons.mic_outlined, color: AppColors.darkBlue),
            );
          },
        ),
      ]),
    );
  }
}