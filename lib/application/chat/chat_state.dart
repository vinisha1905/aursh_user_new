part of 'chat_bloc.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState(
      {required InternalConsultationModel? consultation,
      required LoadingState loadingState,
      required DatabaseReference? messagesRef,
      required String userId,
      required int? totalMessages,
      required List<ChatModel>? messages}) = _ChatState;

  factory ChatState.initialize() => ChatState(
      userId: '',
      totalMessages: null,
      consultation: null,
      loadingState: LoadingState.isInitial,
      messagesRef: null,
      messages: null);
}
