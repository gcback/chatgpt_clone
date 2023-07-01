// request to openai api
// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@freezed
class ChatRequest with _$ChatRequest {
  const ChatRequest._();
  const factory ChatRequest({
    required String model,
    @Default(0.8) double temperature,
    required List<Message> messages,
  }) = _ChatRequest;
}

@freezed
class Message with _$Message {
  const factory Message({
    @Default('user') String role,
    required String content,
  }) = _Message;

  factory Message.fromJson(Map<String, Object?> json) =>
      _$MessageFromJson(json);
}

@freezed
class Delta with _$Delta {
  const factory Delta({
    @Default('user') String role,
    String? content,
  }) = _Delta;

  factory Delta.fromJson(Map<String, Object?> json) => _$DeltaFromJson(json);
}

// response from openai chat
@freezed
class ChatResponse with _$ChatResponse {
  const ChatResponse._();
  const factory ChatResponse({
    @Default('0000') String id,
    @Default('0000') String object,
    @Default(0.0) double created,
    @Default('0000') String model,
    required List<Choice> choices,
    Usage? usage,
  }) = _ChatResponse;

  factory ChatResponse.withReply({required String reply, required double dt}) {
    return ChatResponse(
      created: dt,
      choices: [
        Choice(
          index: 0,
          delta: Delta(role: 'user', content: reply),
        )
      ],
    );
  }
  factory ChatResponse.fromJson(Map<String, Object?> json) =>
      _$ChatResponseFromJson(json);
}

@freezed
class Choice with _$Choice {
  const factory Choice({
    required int index,
    // required Message message,
    Delta? delta,
    String? finish_reason,
  }) = _Choice;

  factory Choice.fromJson(Map<String, Object?> json) => _$ChoiceFromJson(json);
}

@freezed
class Usage with _$Usage {
  const factory Usage({
    required int prompt_tokens,
    required int completion_tokens,
    required int total_tokens,
  }) = _Usage;

  factory Usage.fromJson(Map<String, Object?> json) => _$UsageFromJson(json);
}

enum ChatStatus {
  waiting,
  complete,
}

@freezed
class Chat with _$Chat {
  const Chat._();
  const factory Chat({
    required ChatRequest request,
    ChatResponse? response,
    @Default(ChatStatus.waiting) ChatStatus status,
  }) = _Chat;

  String get query => request.messages.first.content;
  String? get reply => response?.choices.first.delta?.content;
  Usage? get usage => response?.usage;
}

typedef ChatList = List<Chat>;

/// Chat completion API의 HTTP Response는 Stream일 경우 body는 SSE(Server-Side Event) 형태입니다.
///   ref:
///      - https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events
///      - https://github.com/cfug/dio/issues/1279
//
// class Event {
//   const Event(this.id, this.event, this.data);
//   final String? id;
//   final String? event;
//   final String? data;

//   @override
//   String toString() {
//     return '$id $event $data';
//   }
// }

/// openai api들에서 response 종료 토큰으로 사용합니다.
const String kChatEndToken = '[DONE]';
