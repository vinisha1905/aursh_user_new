// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InternalConsultationModel consultation)
        initialize,
    required TResult Function(String message) sendMessage,
    required TResult Function(ChatModel chat) newChat,
    required TResult Function(XFile file) newImageChat,
    required TResult Function(XFile file) newVideoChat,
    required TResult Function(XFile file) newFileChat,
    required TResult Function(XFile file) newAudioChat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InternalConsultationModel consultation)? initialize,
    TResult? Function(String message)? sendMessage,
    TResult? Function(ChatModel chat)? newChat,
    TResult? Function(XFile file)? newImageChat,
    TResult? Function(XFile file)? newVideoChat,
    TResult? Function(XFile file)? newFileChat,
    TResult? Function(XFile file)? newAudioChat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InternalConsultationModel consultation)? initialize,
    TResult Function(String message)? sendMessage,
    TResult Function(ChatModel chat)? newChat,
    TResult Function(XFile file)? newImageChat,
    TResult Function(XFile file)? newVideoChat,
    TResult Function(XFile file)? newFileChat,
    TResult Function(XFile file)? newAudioChat,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_NewChat value) newChat,
    required TResult Function(_NewImageChat value) newImageChat,
    required TResult Function(_NewVideoChat value) newVideoChat,
    required TResult Function(_NewFileChat value) newFileChat,
    required TResult Function(_NewAudioChat value) newAudioChat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_NewChat value)? newChat,
    TResult? Function(_NewImageChat value)? newImageChat,
    TResult? Function(_NewVideoChat value)? newVideoChat,
    TResult? Function(_NewFileChat value)? newFileChat,
    TResult? Function(_NewAudioChat value)? newAudioChat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_NewChat value)? newChat,
    TResult Function(_NewImageChat value)? newImageChat,
    TResult Function(_NewVideoChat value)? newVideoChat,
    TResult Function(_NewFileChat value)? newFileChat,
    TResult Function(_NewAudioChat value)? newAudioChat,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatEventCopyWith<$Res> {
  factory $ChatEventCopyWith(ChatEvent value, $Res Function(ChatEvent) then) =
      _$ChatEventCopyWithImpl<$Res, ChatEvent>;
}

/// @nodoc
class _$ChatEventCopyWithImpl<$Res, $Val extends ChatEvent>
    implements $ChatEventCopyWith<$Res> {
  _$ChatEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({InternalConsultationModel consultation});
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consultation = null,
  }) {
    return _then(_$InitializeImpl(
      null == consultation
          ? _value.consultation
          : consultation // ignore: cast_nullable_to_non_nullable
              as InternalConsultationModel,
    ));
  }
}

/// @nodoc

class _$InitializeImpl with DiagnosticableTreeMixin implements _Initialize {
  const _$InitializeImpl(this.consultation);

  @override
  final InternalConsultationModel consultation;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatEvent.initialize(consultation: $consultation)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatEvent.initialize'))
      ..add(DiagnosticsProperty('consultation', consultation));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.consultation, consultation) ||
                other.consultation == consultation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, consultation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InternalConsultationModel consultation)
        initialize,
    required TResult Function(String message) sendMessage,
    required TResult Function(ChatModel chat) newChat,
    required TResult Function(XFile file) newImageChat,
    required TResult Function(XFile file) newVideoChat,
    required TResult Function(XFile file) newFileChat,
    required TResult Function(XFile file) newAudioChat,
  }) {
    return initialize(consultation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InternalConsultationModel consultation)? initialize,
    TResult? Function(String message)? sendMessage,
    TResult? Function(ChatModel chat)? newChat,
    TResult? Function(XFile file)? newImageChat,
    TResult? Function(XFile file)? newVideoChat,
    TResult? Function(XFile file)? newFileChat,
    TResult? Function(XFile file)? newAudioChat,
  }) {
    return initialize?.call(consultation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InternalConsultationModel consultation)? initialize,
    TResult Function(String message)? sendMessage,
    TResult Function(ChatModel chat)? newChat,
    TResult Function(XFile file)? newImageChat,
    TResult Function(XFile file)? newVideoChat,
    TResult Function(XFile file)? newFileChat,
    TResult Function(XFile file)? newAudioChat,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(consultation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_NewChat value) newChat,
    required TResult Function(_NewImageChat value) newImageChat,
    required TResult Function(_NewVideoChat value) newVideoChat,
    required TResult Function(_NewFileChat value) newFileChat,
    required TResult Function(_NewAudioChat value) newAudioChat,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_NewChat value)? newChat,
    TResult? Function(_NewImageChat value)? newImageChat,
    TResult? Function(_NewVideoChat value)? newVideoChat,
    TResult? Function(_NewFileChat value)? newFileChat,
    TResult? Function(_NewAudioChat value)? newAudioChat,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_NewChat value)? newChat,
    TResult Function(_NewImageChat value)? newImageChat,
    TResult Function(_NewVideoChat value)? newVideoChat,
    TResult Function(_NewFileChat value)? newFileChat,
    TResult Function(_NewAudioChat value)? newAudioChat,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements ChatEvent {
  const factory _Initialize(final InternalConsultationModel consultation) =
      _$InitializeImpl;

  InternalConsultationModel get consultation;
  @JsonKey(ignore: true)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendMessageImplCopyWith<$Res> {
  factory _$$SendMessageImplCopyWith(
          _$SendMessageImpl value, $Res Function(_$SendMessageImpl) then) =
      __$$SendMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SendMessageImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$SendMessageImpl>
    implements _$$SendMessageImplCopyWith<$Res> {
  __$$SendMessageImplCopyWithImpl(
      _$SendMessageImpl _value, $Res Function(_$SendMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SendMessageImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendMessageImpl with DiagnosticableTreeMixin implements _SendMessage {
  const _$SendMessageImpl(this.message);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatEvent.sendMessage(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatEvent.sendMessage'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMessageImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMessageImplCopyWith<_$SendMessageImpl> get copyWith =>
      __$$SendMessageImplCopyWithImpl<_$SendMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InternalConsultationModel consultation)
        initialize,
    required TResult Function(String message) sendMessage,
    required TResult Function(ChatModel chat) newChat,
    required TResult Function(XFile file) newImageChat,
    required TResult Function(XFile file) newVideoChat,
    required TResult Function(XFile file) newFileChat,
    required TResult Function(XFile file) newAudioChat,
  }) {
    return sendMessage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InternalConsultationModel consultation)? initialize,
    TResult? Function(String message)? sendMessage,
    TResult? Function(ChatModel chat)? newChat,
    TResult? Function(XFile file)? newImageChat,
    TResult? Function(XFile file)? newVideoChat,
    TResult? Function(XFile file)? newFileChat,
    TResult? Function(XFile file)? newAudioChat,
  }) {
    return sendMessage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InternalConsultationModel consultation)? initialize,
    TResult Function(String message)? sendMessage,
    TResult Function(ChatModel chat)? newChat,
    TResult Function(XFile file)? newImageChat,
    TResult Function(XFile file)? newVideoChat,
    TResult Function(XFile file)? newFileChat,
    TResult Function(XFile file)? newAudioChat,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_NewChat value) newChat,
    required TResult Function(_NewImageChat value) newImageChat,
    required TResult Function(_NewVideoChat value) newVideoChat,
    required TResult Function(_NewFileChat value) newFileChat,
    required TResult Function(_NewAudioChat value) newAudioChat,
  }) {
    return sendMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_NewChat value)? newChat,
    TResult? Function(_NewImageChat value)? newImageChat,
    TResult? Function(_NewVideoChat value)? newVideoChat,
    TResult? Function(_NewFileChat value)? newFileChat,
    TResult? Function(_NewAudioChat value)? newAudioChat,
  }) {
    return sendMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_NewChat value)? newChat,
    TResult Function(_NewImageChat value)? newImageChat,
    TResult Function(_NewVideoChat value)? newVideoChat,
    TResult Function(_NewFileChat value)? newFileChat,
    TResult Function(_NewAudioChat value)? newAudioChat,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(this);
    }
    return orElse();
  }
}

abstract class _SendMessage implements ChatEvent {
  const factory _SendMessage(final String message) = _$SendMessageImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$SendMessageImplCopyWith<_$SendMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NewChatImplCopyWith<$Res> {
  factory _$$NewChatImplCopyWith(
          _$NewChatImpl value, $Res Function(_$NewChatImpl) then) =
      __$$NewChatImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChatModel chat});
}

/// @nodoc
class __$$NewChatImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$NewChatImpl>
    implements _$$NewChatImplCopyWith<$Res> {
  __$$NewChatImplCopyWithImpl(
      _$NewChatImpl _value, $Res Function(_$NewChatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chat = null,
  }) {
    return _then(_$NewChatImpl(
      null == chat
          ? _value.chat
          : chat // ignore: cast_nullable_to_non_nullable
              as ChatModel,
    ));
  }
}

/// @nodoc

class _$NewChatImpl with DiagnosticableTreeMixin implements _NewChat {
  const _$NewChatImpl(this.chat);

  @override
  final ChatModel chat;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatEvent.newChat(chat: $chat)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatEvent.newChat'))
      ..add(DiagnosticsProperty('chat', chat));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewChatImpl &&
            (identical(other.chat, chat) || other.chat == chat));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewChatImplCopyWith<_$NewChatImpl> get copyWith =>
      __$$NewChatImplCopyWithImpl<_$NewChatImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InternalConsultationModel consultation)
        initialize,
    required TResult Function(String message) sendMessage,
    required TResult Function(ChatModel chat) newChat,
    required TResult Function(XFile file) newImageChat,
    required TResult Function(XFile file) newVideoChat,
    required TResult Function(XFile file) newFileChat,
    required TResult Function(XFile file) newAudioChat,
  }) {
    return newChat(chat);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InternalConsultationModel consultation)? initialize,
    TResult? Function(String message)? sendMessage,
    TResult? Function(ChatModel chat)? newChat,
    TResult? Function(XFile file)? newImageChat,
    TResult? Function(XFile file)? newVideoChat,
    TResult? Function(XFile file)? newFileChat,
    TResult? Function(XFile file)? newAudioChat,
  }) {
    return newChat?.call(chat);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InternalConsultationModel consultation)? initialize,
    TResult Function(String message)? sendMessage,
    TResult Function(ChatModel chat)? newChat,
    TResult Function(XFile file)? newImageChat,
    TResult Function(XFile file)? newVideoChat,
    TResult Function(XFile file)? newFileChat,
    TResult Function(XFile file)? newAudioChat,
    required TResult orElse(),
  }) {
    if (newChat != null) {
      return newChat(chat);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_NewChat value) newChat,
    required TResult Function(_NewImageChat value) newImageChat,
    required TResult Function(_NewVideoChat value) newVideoChat,
    required TResult Function(_NewFileChat value) newFileChat,
    required TResult Function(_NewAudioChat value) newAudioChat,
  }) {
    return newChat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_NewChat value)? newChat,
    TResult? Function(_NewImageChat value)? newImageChat,
    TResult? Function(_NewVideoChat value)? newVideoChat,
    TResult? Function(_NewFileChat value)? newFileChat,
    TResult? Function(_NewAudioChat value)? newAudioChat,
  }) {
    return newChat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_NewChat value)? newChat,
    TResult Function(_NewImageChat value)? newImageChat,
    TResult Function(_NewVideoChat value)? newVideoChat,
    TResult Function(_NewFileChat value)? newFileChat,
    TResult Function(_NewAudioChat value)? newAudioChat,
    required TResult orElse(),
  }) {
    if (newChat != null) {
      return newChat(this);
    }
    return orElse();
  }
}

abstract class _NewChat implements ChatEvent {
  const factory _NewChat(final ChatModel chat) = _$NewChatImpl;

  ChatModel get chat;
  @JsonKey(ignore: true)
  _$$NewChatImplCopyWith<_$NewChatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NewImageChatImplCopyWith<$Res> {
  factory _$$NewImageChatImplCopyWith(
          _$NewImageChatImpl value, $Res Function(_$NewImageChatImpl) then) =
      __$$NewImageChatImplCopyWithImpl<$Res>;
  @useResult
  $Res call({XFile file});
}

/// @nodoc
class __$$NewImageChatImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$NewImageChatImpl>
    implements _$$NewImageChatImplCopyWith<$Res> {
  __$$NewImageChatImplCopyWithImpl(
      _$NewImageChatImpl _value, $Res Function(_$NewImageChatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
  }) {
    return _then(_$NewImageChatImpl(
      null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as XFile,
    ));
  }
}

/// @nodoc

class _$NewImageChatImpl with DiagnosticableTreeMixin implements _NewImageChat {
  const _$NewImageChatImpl(this.file);

  @override
  final XFile file;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatEvent.newImageChat(file: $file)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatEvent.newImageChat'))
      ..add(DiagnosticsProperty('file', file));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewImageChatImpl &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewImageChatImplCopyWith<_$NewImageChatImpl> get copyWith =>
      __$$NewImageChatImplCopyWithImpl<_$NewImageChatImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InternalConsultationModel consultation)
        initialize,
    required TResult Function(String message) sendMessage,
    required TResult Function(ChatModel chat) newChat,
    required TResult Function(XFile file) newImageChat,
    required TResult Function(XFile file) newVideoChat,
    required TResult Function(XFile file) newFileChat,
    required TResult Function(XFile file) newAudioChat,
  }) {
    return newImageChat(file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InternalConsultationModel consultation)? initialize,
    TResult? Function(String message)? sendMessage,
    TResult? Function(ChatModel chat)? newChat,
    TResult? Function(XFile file)? newImageChat,
    TResult? Function(XFile file)? newVideoChat,
    TResult? Function(XFile file)? newFileChat,
    TResult? Function(XFile file)? newAudioChat,
  }) {
    return newImageChat?.call(file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InternalConsultationModel consultation)? initialize,
    TResult Function(String message)? sendMessage,
    TResult Function(ChatModel chat)? newChat,
    TResult Function(XFile file)? newImageChat,
    TResult Function(XFile file)? newVideoChat,
    TResult Function(XFile file)? newFileChat,
    TResult Function(XFile file)? newAudioChat,
    required TResult orElse(),
  }) {
    if (newImageChat != null) {
      return newImageChat(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_NewChat value) newChat,
    required TResult Function(_NewImageChat value) newImageChat,
    required TResult Function(_NewVideoChat value) newVideoChat,
    required TResult Function(_NewFileChat value) newFileChat,
    required TResult Function(_NewAudioChat value) newAudioChat,
  }) {
    return newImageChat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_NewChat value)? newChat,
    TResult? Function(_NewImageChat value)? newImageChat,
    TResult? Function(_NewVideoChat value)? newVideoChat,
    TResult? Function(_NewFileChat value)? newFileChat,
    TResult? Function(_NewAudioChat value)? newAudioChat,
  }) {
    return newImageChat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_NewChat value)? newChat,
    TResult Function(_NewImageChat value)? newImageChat,
    TResult Function(_NewVideoChat value)? newVideoChat,
    TResult Function(_NewFileChat value)? newFileChat,
    TResult Function(_NewAudioChat value)? newAudioChat,
    required TResult orElse(),
  }) {
    if (newImageChat != null) {
      return newImageChat(this);
    }
    return orElse();
  }
}

abstract class _NewImageChat implements ChatEvent {
  const factory _NewImageChat(final XFile file) = _$NewImageChatImpl;

  XFile get file;
  @JsonKey(ignore: true)
  _$$NewImageChatImplCopyWith<_$NewImageChatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NewVideoChatImplCopyWith<$Res> {
  factory _$$NewVideoChatImplCopyWith(
          _$NewVideoChatImpl value, $Res Function(_$NewVideoChatImpl) then) =
      __$$NewVideoChatImplCopyWithImpl<$Res>;
  @useResult
  $Res call({XFile file});
}

/// @nodoc
class __$$NewVideoChatImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$NewVideoChatImpl>
    implements _$$NewVideoChatImplCopyWith<$Res> {
  __$$NewVideoChatImplCopyWithImpl(
      _$NewVideoChatImpl _value, $Res Function(_$NewVideoChatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
  }) {
    return _then(_$NewVideoChatImpl(
      null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as XFile,
    ));
  }
}

/// @nodoc

class _$NewVideoChatImpl with DiagnosticableTreeMixin implements _NewVideoChat {
  const _$NewVideoChatImpl(this.file);

  @override
  final XFile file;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatEvent.newVideoChat(file: $file)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatEvent.newVideoChat'))
      ..add(DiagnosticsProperty('file', file));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewVideoChatImpl &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewVideoChatImplCopyWith<_$NewVideoChatImpl> get copyWith =>
      __$$NewVideoChatImplCopyWithImpl<_$NewVideoChatImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InternalConsultationModel consultation)
        initialize,
    required TResult Function(String message) sendMessage,
    required TResult Function(ChatModel chat) newChat,
    required TResult Function(XFile file) newImageChat,
    required TResult Function(XFile file) newVideoChat,
    required TResult Function(XFile file) newFileChat,
    required TResult Function(XFile file) newAudioChat,
  }) {
    return newVideoChat(file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InternalConsultationModel consultation)? initialize,
    TResult? Function(String message)? sendMessage,
    TResult? Function(ChatModel chat)? newChat,
    TResult? Function(XFile file)? newImageChat,
    TResult? Function(XFile file)? newVideoChat,
    TResult? Function(XFile file)? newFileChat,
    TResult? Function(XFile file)? newAudioChat,
  }) {
    return newVideoChat?.call(file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InternalConsultationModel consultation)? initialize,
    TResult Function(String message)? sendMessage,
    TResult Function(ChatModel chat)? newChat,
    TResult Function(XFile file)? newImageChat,
    TResult Function(XFile file)? newVideoChat,
    TResult Function(XFile file)? newFileChat,
    TResult Function(XFile file)? newAudioChat,
    required TResult orElse(),
  }) {
    if (newVideoChat != null) {
      return newVideoChat(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_NewChat value) newChat,
    required TResult Function(_NewImageChat value) newImageChat,
    required TResult Function(_NewVideoChat value) newVideoChat,
    required TResult Function(_NewFileChat value) newFileChat,
    required TResult Function(_NewAudioChat value) newAudioChat,
  }) {
    return newVideoChat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_NewChat value)? newChat,
    TResult? Function(_NewImageChat value)? newImageChat,
    TResult? Function(_NewVideoChat value)? newVideoChat,
    TResult? Function(_NewFileChat value)? newFileChat,
    TResult? Function(_NewAudioChat value)? newAudioChat,
  }) {
    return newVideoChat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_NewChat value)? newChat,
    TResult Function(_NewImageChat value)? newImageChat,
    TResult Function(_NewVideoChat value)? newVideoChat,
    TResult Function(_NewFileChat value)? newFileChat,
    TResult Function(_NewAudioChat value)? newAudioChat,
    required TResult orElse(),
  }) {
    if (newVideoChat != null) {
      return newVideoChat(this);
    }
    return orElse();
  }
}

abstract class _NewVideoChat implements ChatEvent {
  const factory _NewVideoChat(final XFile file) = _$NewVideoChatImpl;

  XFile get file;
  @JsonKey(ignore: true)
  _$$NewVideoChatImplCopyWith<_$NewVideoChatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NewFileChatImplCopyWith<$Res> {
  factory _$$NewFileChatImplCopyWith(
          _$NewFileChatImpl value, $Res Function(_$NewFileChatImpl) then) =
      __$$NewFileChatImplCopyWithImpl<$Res>;
  @useResult
  $Res call({XFile file});
}

/// @nodoc
class __$$NewFileChatImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$NewFileChatImpl>
    implements _$$NewFileChatImplCopyWith<$Res> {
  __$$NewFileChatImplCopyWithImpl(
      _$NewFileChatImpl _value, $Res Function(_$NewFileChatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
  }) {
    return _then(_$NewFileChatImpl(
      null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as XFile,
    ));
  }
}

/// @nodoc

class _$NewFileChatImpl with DiagnosticableTreeMixin implements _NewFileChat {
  const _$NewFileChatImpl(this.file);

  @override
  final XFile file;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatEvent.newFileChat(file: $file)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatEvent.newFileChat'))
      ..add(DiagnosticsProperty('file', file));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewFileChatImpl &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewFileChatImplCopyWith<_$NewFileChatImpl> get copyWith =>
      __$$NewFileChatImplCopyWithImpl<_$NewFileChatImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InternalConsultationModel consultation)
        initialize,
    required TResult Function(String message) sendMessage,
    required TResult Function(ChatModel chat) newChat,
    required TResult Function(XFile file) newImageChat,
    required TResult Function(XFile file) newVideoChat,
    required TResult Function(XFile file) newFileChat,
    required TResult Function(XFile file) newAudioChat,
  }) {
    return newFileChat(file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InternalConsultationModel consultation)? initialize,
    TResult? Function(String message)? sendMessage,
    TResult? Function(ChatModel chat)? newChat,
    TResult? Function(XFile file)? newImageChat,
    TResult? Function(XFile file)? newVideoChat,
    TResult? Function(XFile file)? newFileChat,
    TResult? Function(XFile file)? newAudioChat,
  }) {
    return newFileChat?.call(file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InternalConsultationModel consultation)? initialize,
    TResult Function(String message)? sendMessage,
    TResult Function(ChatModel chat)? newChat,
    TResult Function(XFile file)? newImageChat,
    TResult Function(XFile file)? newVideoChat,
    TResult Function(XFile file)? newFileChat,
    TResult Function(XFile file)? newAudioChat,
    required TResult orElse(),
  }) {
    if (newFileChat != null) {
      return newFileChat(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_NewChat value) newChat,
    required TResult Function(_NewImageChat value) newImageChat,
    required TResult Function(_NewVideoChat value) newVideoChat,
    required TResult Function(_NewFileChat value) newFileChat,
    required TResult Function(_NewAudioChat value) newAudioChat,
  }) {
    return newFileChat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_NewChat value)? newChat,
    TResult? Function(_NewImageChat value)? newImageChat,
    TResult? Function(_NewVideoChat value)? newVideoChat,
    TResult? Function(_NewFileChat value)? newFileChat,
    TResult? Function(_NewAudioChat value)? newAudioChat,
  }) {
    return newFileChat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_NewChat value)? newChat,
    TResult Function(_NewImageChat value)? newImageChat,
    TResult Function(_NewVideoChat value)? newVideoChat,
    TResult Function(_NewFileChat value)? newFileChat,
    TResult Function(_NewAudioChat value)? newAudioChat,
    required TResult orElse(),
  }) {
    if (newFileChat != null) {
      return newFileChat(this);
    }
    return orElse();
  }
}

abstract class _NewFileChat implements ChatEvent {
  const factory _NewFileChat(final XFile file) = _$NewFileChatImpl;

  XFile get file;
  @JsonKey(ignore: true)
  _$$NewFileChatImplCopyWith<_$NewFileChatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NewAudioChatImplCopyWith<$Res> {
  factory _$$NewAudioChatImplCopyWith(
          _$NewAudioChatImpl value, $Res Function(_$NewAudioChatImpl) then) =
      __$$NewAudioChatImplCopyWithImpl<$Res>;
  @useResult
  $Res call({XFile file});
}

/// @nodoc
class __$$NewAudioChatImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$NewAudioChatImpl>
    implements _$$NewAudioChatImplCopyWith<$Res> {
  __$$NewAudioChatImplCopyWithImpl(
      _$NewAudioChatImpl _value, $Res Function(_$NewAudioChatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
  }) {
    return _then(_$NewAudioChatImpl(
      null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as XFile,
    ));
  }
}

/// @nodoc

class _$NewAudioChatImpl with DiagnosticableTreeMixin implements _NewAudioChat {
  const _$NewAudioChatImpl(this.file);

  @override
  final XFile file;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatEvent.newAudioChat(file: $file)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatEvent.newAudioChat'))
      ..add(DiagnosticsProperty('file', file));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewAudioChatImpl &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewAudioChatImplCopyWith<_$NewAudioChatImpl> get copyWith =>
      __$$NewAudioChatImplCopyWithImpl<_$NewAudioChatImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InternalConsultationModel consultation)
        initialize,
    required TResult Function(String message) sendMessage,
    required TResult Function(ChatModel chat) newChat,
    required TResult Function(XFile file) newImageChat,
    required TResult Function(XFile file) newVideoChat,
    required TResult Function(XFile file) newFileChat,
    required TResult Function(XFile file) newAudioChat,
  }) {
    return newAudioChat(file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InternalConsultationModel consultation)? initialize,
    TResult? Function(String message)? sendMessage,
    TResult? Function(ChatModel chat)? newChat,
    TResult? Function(XFile file)? newImageChat,
    TResult? Function(XFile file)? newVideoChat,
    TResult? Function(XFile file)? newFileChat,
    TResult? Function(XFile file)? newAudioChat,
  }) {
    return newAudioChat?.call(file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InternalConsultationModel consultation)? initialize,
    TResult Function(String message)? sendMessage,
    TResult Function(ChatModel chat)? newChat,
    TResult Function(XFile file)? newImageChat,
    TResult Function(XFile file)? newVideoChat,
    TResult Function(XFile file)? newFileChat,
    TResult Function(XFile file)? newAudioChat,
    required TResult orElse(),
  }) {
    if (newAudioChat != null) {
      return newAudioChat(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_NewChat value) newChat,
    required TResult Function(_NewImageChat value) newImageChat,
    required TResult Function(_NewVideoChat value) newVideoChat,
    required TResult Function(_NewFileChat value) newFileChat,
    required TResult Function(_NewAudioChat value) newAudioChat,
  }) {
    return newAudioChat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_NewChat value)? newChat,
    TResult? Function(_NewImageChat value)? newImageChat,
    TResult? Function(_NewVideoChat value)? newVideoChat,
    TResult? Function(_NewFileChat value)? newFileChat,
    TResult? Function(_NewAudioChat value)? newAudioChat,
  }) {
    return newAudioChat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_NewChat value)? newChat,
    TResult Function(_NewImageChat value)? newImageChat,
    TResult Function(_NewVideoChat value)? newVideoChat,
    TResult Function(_NewFileChat value)? newFileChat,
    TResult Function(_NewAudioChat value)? newAudioChat,
    required TResult orElse(),
  }) {
    if (newAudioChat != null) {
      return newAudioChat(this);
    }
    return orElse();
  }
}

abstract class _NewAudioChat implements ChatEvent {
  const factory _NewAudioChat(final XFile file) = _$NewAudioChatImpl;

  XFile get file;
  @JsonKey(ignore: true)
  _$$NewAudioChatImplCopyWith<_$NewAudioChatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChatState {
  InternalConsultationModel? get consultation =>
      throw _privateConstructorUsedError;
  LoadingState get loadingState => throw _privateConstructorUsedError;
  DatabaseReference? get messagesRef => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  int? get totalMessages => throw _privateConstructorUsedError;
  List<ChatModel>? get messages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
  @useResult
  $Res call(
      {InternalConsultationModel? consultation,
      LoadingState loadingState,
      DatabaseReference? messagesRef,
      String userId,
      int? totalMessages,
      List<ChatModel>? messages});
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consultation = freezed,
    Object? loadingState = null,
    Object? messagesRef = freezed,
    Object? userId = null,
    Object? totalMessages = freezed,
    Object? messages = freezed,
  }) {
    return _then(_value.copyWith(
      consultation: freezed == consultation
          ? _value.consultation
          : consultation // ignore: cast_nullable_to_non_nullable
              as InternalConsultationModel?,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      messagesRef: freezed == messagesRef
          ? _value.messagesRef
          : messagesRef // ignore: cast_nullable_to_non_nullable
              as DatabaseReference?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      totalMessages: freezed == totalMessages
          ? _value.totalMessages
          : totalMessages // ignore: cast_nullable_to_non_nullable
              as int?,
      messages: freezed == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatStateImplCopyWith<$Res>
    implements $ChatStateCopyWith<$Res> {
  factory _$$ChatStateImplCopyWith(
          _$ChatStateImpl value, $Res Function(_$ChatStateImpl) then) =
      __$$ChatStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {InternalConsultationModel? consultation,
      LoadingState loadingState,
      DatabaseReference? messagesRef,
      String userId,
      int? totalMessages,
      List<ChatModel>? messages});
}

/// @nodoc
class __$$ChatStateImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatStateImpl>
    implements _$$ChatStateImplCopyWith<$Res> {
  __$$ChatStateImplCopyWithImpl(
      _$ChatStateImpl _value, $Res Function(_$ChatStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consultation = freezed,
    Object? loadingState = null,
    Object? messagesRef = freezed,
    Object? userId = null,
    Object? totalMessages = freezed,
    Object? messages = freezed,
  }) {
    return _then(_$ChatStateImpl(
      consultation: freezed == consultation
          ? _value.consultation
          : consultation // ignore: cast_nullable_to_non_nullable
              as InternalConsultationModel?,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      messagesRef: freezed == messagesRef
          ? _value.messagesRef
          : messagesRef // ignore: cast_nullable_to_non_nullable
              as DatabaseReference?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      totalMessages: freezed == totalMessages
          ? _value.totalMessages
          : totalMessages // ignore: cast_nullable_to_non_nullable
              as int?,
      messages: freezed == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatModel>?,
    ));
  }
}

/// @nodoc

class _$ChatStateImpl with DiagnosticableTreeMixin implements _ChatState {
  const _$ChatStateImpl(
      {required this.consultation,
      required this.loadingState,
      required this.messagesRef,
      required this.userId,
      required this.totalMessages,
      required final List<ChatModel>? messages})
      : _messages = messages;

  @override
  final InternalConsultationModel? consultation;
  @override
  final LoadingState loadingState;
  @override
  final DatabaseReference? messagesRef;
  @override
  final String userId;
  @override
  final int? totalMessages;
  final List<ChatModel>? _messages;
  @override
  List<ChatModel>? get messages {
    final value = _messages;
    if (value == null) return null;
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatState(consultation: $consultation, loadingState: $loadingState, messagesRef: $messagesRef, userId: $userId, totalMessages: $totalMessages, messages: $messages)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatState'))
      ..add(DiagnosticsProperty('consultation', consultation))
      ..add(DiagnosticsProperty('loadingState', loadingState))
      ..add(DiagnosticsProperty('messagesRef', messagesRef))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('totalMessages', totalMessages))
      ..add(DiagnosticsProperty('messages', messages));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatStateImpl &&
            (identical(other.consultation, consultation) ||
                other.consultation == consultation) &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState) &&
            (identical(other.messagesRef, messagesRef) ||
                other.messagesRef == messagesRef) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.totalMessages, totalMessages) ||
                other.totalMessages == totalMessages) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      consultation,
      loadingState,
      messagesRef,
      userId,
      totalMessages,
      const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      __$$ChatStateImplCopyWithImpl<_$ChatStateImpl>(this, _$identity);
}

abstract class _ChatState implements ChatState {
  const factory _ChatState(
      {required final InternalConsultationModel? consultation,
      required final LoadingState loadingState,
      required final DatabaseReference? messagesRef,
      required final String userId,
      required final int? totalMessages,
      required final List<ChatModel>? messages}) = _$ChatStateImpl;

  @override
  InternalConsultationModel? get consultation;
  @override
  LoadingState get loadingState;
  @override
  DatabaseReference? get messagesRef;
  @override
  String get userId;
  @override
  int? get totalMessages;
  @override
  List<ChatModel>? get messages;
  @override
  @JsonKey(ignore: true)
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
