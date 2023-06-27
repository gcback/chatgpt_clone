// request to open api
// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';
part 'model.g.dart';

class ChatRequest {
  final String model;
  final String prompt;
  final double temperature;
  final List<Message> messages;

  const ChatRequest(
    this.model,
    this.prompt,
    this.temperature,
    this.messages,
  );
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

// response from openai chat
@freezed
class ChatResponse with _$ChatResponse {
  const factory ChatResponse({
    required String id,
    required String object,
    required double created,
    required String model,
    required List<Choice> choices,
    required Usage usage,
  }) = _ChatResponse;

  factory ChatResponse.fromJson(Map<String, Object?> json) =>
      _$ChatResponseFromJson(json);
}

@freezed
class Choice with _$Choice {
  const factory Choice({
    required int index,
    required Message message,
    required String finish_reason,
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
