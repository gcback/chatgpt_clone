// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$$_MessageFromJson(Map<String, dynamic> json) => _$_Message(
      role: json['role'] as String? ?? 'user',
      content: json['content'] as String,
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
    };

_$_Delta _$$_DeltaFromJson(Map<String, dynamic> json) => _$_Delta(
      role: json['role'] as String? ?? 'user',
      content: json['content'] as String?,
    );

Map<String, dynamic> _$$_DeltaToJson(_$_Delta instance) => <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
    };

_$_ChatResponse _$$_ChatResponseFromJson(Map<String, dynamic> json) =>
    _$_ChatResponse(
      id: json['id'] as String? ?? '0000',
      object: json['object'] as String? ?? '0000',
      created: (json['created'] as num?)?.toDouble() ?? 0.0,
      model: json['model'] as String? ?? '0000',
      choices: (json['choices'] as List<dynamic>)
          .map((e) => Choice.fromJson(e as Map<String, dynamic>))
          .toList(),
      usage: json['usage'] == null
          ? null
          : Usage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ChatResponseToJson(_$_ChatResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'created': instance.created,
      'model': instance.model,
      'choices': instance.choices,
      'usage': instance.usage,
    };

_$_Choice _$$_ChoiceFromJson(Map<String, dynamic> json) => _$_Choice(
      index: json['index'] as int,
      delta: json['delta'] == null
          ? null
          : Delta.fromJson(json['delta'] as Map<String, dynamic>),
      finish_reason: json['finish_reason'] as String?,
    );

Map<String, dynamic> _$$_ChoiceToJson(_$_Choice instance) => <String, dynamic>{
      'index': instance.index,
      'delta': instance.delta,
      'finish_reason': instance.finish_reason,
    };

_$_Usage _$$_UsageFromJson(Map<String, dynamic> json) => _$_Usage(
      prompt_tokens: json['prompt_tokens'] as int,
      completion_tokens: json['completion_tokens'] as int,
      total_tokens: json['total_tokens'] as int,
    );

Map<String, dynamic> _$$_UsageToJson(_$_Usage instance) => <String, dynamic>{
      'prompt_tokens': instance.prompt_tokens,
      'completion_tokens': instance.completion_tokens,
      'total_tokens': instance.total_tokens,
    };
