part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.initialize(InternalConsultationModel consultation) = _Initialize;
  const factory ChatEvent.sendMessage(String message) = _SendMessage;
  const factory ChatEvent.newChat(ChatModel chat) = _NewChat;
  const factory ChatEvent.newImageChat(XFile file) = _NewImageChat;
  const factory ChatEvent.newVideoChat(XFile file) = _NewVideoChat;
  const factory ChatEvent.newFileChat(XFile file) = _NewFileChat;
  const factory ChatEvent.newAudioChat(XFile file) = _NewAudioChat;
}