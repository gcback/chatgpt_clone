// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatRequest {
  String get model => throw _privateConstructorUsedError;
  double get temperature => throw _privateConstructorUsedError;
  List<Message> get messages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatRequestCopyWith<ChatRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRequestCopyWith<$Res> {
  factory $ChatRequestCopyWith(
          ChatRequest value, $Res Function(ChatRequest) then) =
      _$ChatRequestCopyWithImpl<$Res, ChatRequest>;
  @useResult
  $Res call({String model, double temperature, List<Message> messages});
}

/// @nodoc
class _$ChatRequestCopyWithImpl<$Res, $Val extends ChatRequest>
    implements $ChatRequestCopyWith<$Res> {
  _$ChatRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? temperature = null,
    Object? messages = null,
  }) {
    return _then(_value.copyWith(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatRequestCopyWith<$Res>
    implements $ChatRequestCopyWith<$Res> {
  factory _$$_ChatRequestCopyWith(
          _$_ChatRequest value, $Res Function(_$_ChatRequest) then) =
      __$$_ChatRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String model, double temperature, List<Message> messages});
}

/// @nodoc
class __$$_ChatRequestCopyWithImpl<$Res>
    extends _$ChatRequestCopyWithImpl<$Res, _$_ChatRequest>
    implements _$$_ChatRequestCopyWith<$Res> {
  __$$_ChatRequestCopyWithImpl(
      _$_ChatRequest _value, $Res Function(_$_ChatRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? temperature = null,
    Object? messages = null,
  }) {
    return _then(_$_ChatRequest(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc

class _$_ChatRequest extends _ChatRequest {
  const _$_ChatRequest(
      {required this.model,
      this.temperature = 0.8,
      required final List<Message> messages})
      : _messages = messages,
        super._();

  @override
  final String model;
  @override
  @JsonKey()
  final double temperature;
  final List<Message> _messages;
  @override
  List<Message> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'ChatRequest(model: $model, temperature: $temperature, messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatRequest &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model, temperature,
      const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatRequestCopyWith<_$_ChatRequest> get copyWith =>
      __$$_ChatRequestCopyWithImpl<_$_ChatRequest>(this, _$identity);
}

abstract class _ChatRequest extends ChatRequest {
  const factory _ChatRequest(
      {required final String model,
      final double temperature,
      required final List<Message> messages}) = _$_ChatRequest;
  const _ChatRequest._() : super._();

  @override
  String get model;
  @override
  double get temperature;
  @override
  List<Message> get messages;
  @override
  @JsonKey(ignore: true)
  _$$_ChatRequestCopyWith<_$_ChatRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  String get role => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call({String role, String content});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$_MessageCopyWith(
          _$_Message value, $Res Function(_$_Message) then) =
      __$$_MessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String role, String content});
}

/// @nodoc
class __$$_MessageCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$_Message>
    implements _$$_MessageCopyWith<$Res> {
  __$$_MessageCopyWithImpl(_$_Message _value, $Res Function(_$_Message) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = null,
  }) {
    return _then(_$_Message(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Message implements _Message {
  const _$_Message({this.role = 'user', required this.content});

  factory _$_Message.fromJson(Map<String, dynamic> json) =>
      _$$_MessageFromJson(json);

  @override
  @JsonKey()
  final String role;
  @override
  final String content;

  @override
  String toString() {
    return 'Message(role: $role, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Message &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, role, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageCopyWith<_$_Message> get copyWith =>
      __$$_MessageCopyWithImpl<_$_Message>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageToJson(
      this,
    );
  }
}

abstract class _Message implements Message {
  const factory _Message({final String role, required final String content}) =
      _$_Message;

  factory _Message.fromJson(Map<String, dynamic> json) = _$_Message.fromJson;

  @override
  String get role;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$_MessageCopyWith<_$_Message> get copyWith =>
      throw _privateConstructorUsedError;
}

Delta _$DeltaFromJson(Map<String, dynamic> json) {
  return _Delta.fromJson(json);
}

/// @nodoc
mixin _$Delta {
  String get role => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeltaCopyWith<Delta> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeltaCopyWith<$Res> {
  factory $DeltaCopyWith(Delta value, $Res Function(Delta) then) =
      _$DeltaCopyWithImpl<$Res, Delta>;
  @useResult
  $Res call({String role, String? content});
}

/// @nodoc
class _$DeltaCopyWithImpl<$Res, $Val extends Delta>
    implements $DeltaCopyWith<$Res> {
  _$DeltaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeltaCopyWith<$Res> implements $DeltaCopyWith<$Res> {
  factory _$$_DeltaCopyWith(_$_Delta value, $Res Function(_$_Delta) then) =
      __$$_DeltaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String role, String? content});
}

/// @nodoc
class __$$_DeltaCopyWithImpl<$Res> extends _$DeltaCopyWithImpl<$Res, _$_Delta>
    implements _$$_DeltaCopyWith<$Res> {
  __$$_DeltaCopyWithImpl(_$_Delta _value, $Res Function(_$_Delta) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = freezed,
  }) {
    return _then(_$_Delta(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Delta implements _Delta {
  const _$_Delta({this.role = 'user', this.content});

  factory _$_Delta.fromJson(Map<String, dynamic> json) =>
      _$$_DeltaFromJson(json);

  @override
  @JsonKey()
  final String role;
  @override
  final String? content;

  @override
  String toString() {
    return 'Delta(role: $role, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Delta &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, role, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeltaCopyWith<_$_Delta> get copyWith =>
      __$$_DeltaCopyWithImpl<_$_Delta>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeltaToJson(
      this,
    );
  }
}

abstract class _Delta implements Delta {
  const factory _Delta({final String role, final String? content}) = _$_Delta;

  factory _Delta.fromJson(Map<String, dynamic> json) = _$_Delta.fromJson;

  @override
  String get role;
  @override
  String? get content;
  @override
  @JsonKey(ignore: true)
  _$$_DeltaCopyWith<_$_Delta> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatResponse _$ChatResponseFromJson(Map<String, dynamic> json) {
  return _ChatResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatResponse {
  String get id => throw _privateConstructorUsedError;
  String get object => throw _privateConstructorUsedError;
  double get created => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  List<Choice> get choices => throw _privateConstructorUsedError;
  Usage? get usage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatResponseCopyWith<ChatResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatResponseCopyWith<$Res> {
  factory $ChatResponseCopyWith(
          ChatResponse value, $Res Function(ChatResponse) then) =
      _$ChatResponseCopyWithImpl<$Res, ChatResponse>;
  @useResult
  $Res call(
      {String id,
      String object,
      double created,
      String model,
      List<Choice> choices,
      Usage? usage});

  $UsageCopyWith<$Res>? get usage;
}

/// @nodoc
class _$ChatResponseCopyWithImpl<$Res, $Val extends ChatResponse>
    implements $ChatResponseCopyWith<$Res> {
  _$ChatResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? object = null,
    Object? created = null,
    Object? model = null,
    Object? choices = null,
    Object? usage = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as double,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      choices: null == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<Choice>,
      usage: freezed == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as Usage?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UsageCopyWith<$Res>? get usage {
    if (_value.usage == null) {
      return null;
    }

    return $UsageCopyWith<$Res>(_value.usage!, (value) {
      return _then(_value.copyWith(usage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ChatResponseCopyWith<$Res>
    implements $ChatResponseCopyWith<$Res> {
  factory _$$_ChatResponseCopyWith(
          _$_ChatResponse value, $Res Function(_$_ChatResponse) then) =
      __$$_ChatResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String object,
      double created,
      String model,
      List<Choice> choices,
      Usage? usage});

  @override
  $UsageCopyWith<$Res>? get usage;
}

/// @nodoc
class __$$_ChatResponseCopyWithImpl<$Res>
    extends _$ChatResponseCopyWithImpl<$Res, _$_ChatResponse>
    implements _$$_ChatResponseCopyWith<$Res> {
  __$$_ChatResponseCopyWithImpl(
      _$_ChatResponse _value, $Res Function(_$_ChatResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? object = null,
    Object? created = null,
    Object? model = null,
    Object? choices = null,
    Object? usage = freezed,
  }) {
    return _then(_$_ChatResponse(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as double,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      choices: null == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<Choice>,
      usage: freezed == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as Usage?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatResponse extends _ChatResponse {
  const _$_ChatResponse(
      {this.id = '0000',
      this.object = '0000',
      this.created = 0.0,
      this.model = '0000',
      required final List<Choice> choices,
      this.usage})
      : _choices = choices,
        super._();

  factory _$_ChatResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ChatResponseFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String object;
  @override
  @JsonKey()
  final double created;
  @override
  @JsonKey()
  final String model;
  final List<Choice> _choices;
  @override
  List<Choice> get choices {
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choices);
  }

  @override
  final Usage? usage;

  @override
  String toString() {
    return 'ChatResponse(id: $id, object: $object, created: $created, model: $model, choices: $choices, usage: $usage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality().equals(other._choices, _choices) &&
            (identical(other.usage, usage) || other.usage == usage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, object, created, model,
      const DeepCollectionEquality().hash(_choices), usage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatResponseCopyWith<_$_ChatResponse> get copyWith =>
      __$$_ChatResponseCopyWithImpl<_$_ChatResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatResponseToJson(
      this,
    );
  }
}

abstract class _ChatResponse extends ChatResponse {
  const factory _ChatResponse(
      {final String id,
      final String object,
      final double created,
      final String model,
      required final List<Choice> choices,
      final Usage? usage}) = _$_ChatResponse;
  const _ChatResponse._() : super._();

  factory _ChatResponse.fromJson(Map<String, dynamic> json) =
      _$_ChatResponse.fromJson;

  @override
  String get id;
  @override
  String get object;
  @override
  double get created;
  @override
  String get model;
  @override
  List<Choice> get choices;
  @override
  Usage? get usage;
  @override
  @JsonKey(ignore: true)
  _$$_ChatResponseCopyWith<_$_ChatResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

Choice _$ChoiceFromJson(Map<String, dynamic> json) {
  return _Choice.fromJson(json);
}

/// @nodoc
mixin _$Choice {
  int get index =>
      throw _privateConstructorUsedError; // required Message message,
  Delta? get delta => throw _privateConstructorUsedError;
  String? get finish_reason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChoiceCopyWith<Choice> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChoiceCopyWith<$Res> {
  factory $ChoiceCopyWith(Choice value, $Res Function(Choice) then) =
      _$ChoiceCopyWithImpl<$Res, Choice>;
  @useResult
  $Res call({int index, Delta? delta, String? finish_reason});

  $DeltaCopyWith<$Res>? get delta;
}

/// @nodoc
class _$ChoiceCopyWithImpl<$Res, $Val extends Choice>
    implements $ChoiceCopyWith<$Res> {
  _$ChoiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? delta = freezed,
    Object? finish_reason = freezed,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      delta: freezed == delta
          ? _value.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as Delta?,
      finish_reason: freezed == finish_reason
          ? _value.finish_reason
          : finish_reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DeltaCopyWith<$Res>? get delta {
    if (_value.delta == null) {
      return null;
    }

    return $DeltaCopyWith<$Res>(_value.delta!, (value) {
      return _then(_value.copyWith(delta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ChoiceCopyWith<$Res> implements $ChoiceCopyWith<$Res> {
  factory _$$_ChoiceCopyWith(_$_Choice value, $Res Function(_$_Choice) then) =
      __$$_ChoiceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index, Delta? delta, String? finish_reason});

  @override
  $DeltaCopyWith<$Res>? get delta;
}

/// @nodoc
class __$$_ChoiceCopyWithImpl<$Res>
    extends _$ChoiceCopyWithImpl<$Res, _$_Choice>
    implements _$$_ChoiceCopyWith<$Res> {
  __$$_ChoiceCopyWithImpl(_$_Choice _value, $Res Function(_$_Choice) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? delta = freezed,
    Object? finish_reason = freezed,
  }) {
    return _then(_$_Choice(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      delta: freezed == delta
          ? _value.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as Delta?,
      finish_reason: freezed == finish_reason
          ? _value.finish_reason
          : finish_reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Choice implements _Choice {
  const _$_Choice({required this.index, this.delta, this.finish_reason});

  factory _$_Choice.fromJson(Map<String, dynamic> json) =>
      _$$_ChoiceFromJson(json);

  @override
  final int index;
// required Message message,
  @override
  final Delta? delta;
  @override
  final String? finish_reason;

  @override
  String toString() {
    return 'Choice(index: $index, delta: $delta, finish_reason: $finish_reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Choice &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.delta, delta) || other.delta == delta) &&
            (identical(other.finish_reason, finish_reason) ||
                other.finish_reason == finish_reason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, index, delta, finish_reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChoiceCopyWith<_$_Choice> get copyWith =>
      __$$_ChoiceCopyWithImpl<_$_Choice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChoiceToJson(
      this,
    );
  }
}

abstract class _Choice implements Choice {
  const factory _Choice(
      {required final int index,
      final Delta? delta,
      final String? finish_reason}) = _$_Choice;

  factory _Choice.fromJson(Map<String, dynamic> json) = _$_Choice.fromJson;

  @override
  int get index;
  @override // required Message message,
  Delta? get delta;
  @override
  String? get finish_reason;
  @override
  @JsonKey(ignore: true)
  _$$_ChoiceCopyWith<_$_Choice> get copyWith =>
      throw _privateConstructorUsedError;
}

Usage _$UsageFromJson(Map<String, dynamic> json) {
  return _Usage.fromJson(json);
}

/// @nodoc
mixin _$Usage {
  int get prompt_tokens => throw _privateConstructorUsedError;
  int get completion_tokens => throw _privateConstructorUsedError;
  int get total_tokens => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsageCopyWith<Usage> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsageCopyWith<$Res> {
  factory $UsageCopyWith(Usage value, $Res Function(Usage) then) =
      _$UsageCopyWithImpl<$Res, Usage>;
  @useResult
  $Res call({int prompt_tokens, int completion_tokens, int total_tokens});
}

/// @nodoc
class _$UsageCopyWithImpl<$Res, $Val extends Usage>
    implements $UsageCopyWith<$Res> {
  _$UsageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prompt_tokens = null,
    Object? completion_tokens = null,
    Object? total_tokens = null,
  }) {
    return _then(_value.copyWith(
      prompt_tokens: null == prompt_tokens
          ? _value.prompt_tokens
          : prompt_tokens // ignore: cast_nullable_to_non_nullable
              as int,
      completion_tokens: null == completion_tokens
          ? _value.completion_tokens
          : completion_tokens // ignore: cast_nullable_to_non_nullable
              as int,
      total_tokens: null == total_tokens
          ? _value.total_tokens
          : total_tokens // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UsageCopyWith<$Res> implements $UsageCopyWith<$Res> {
  factory _$$_UsageCopyWith(_$_Usage value, $Res Function(_$_Usage) then) =
      __$$_UsageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int prompt_tokens, int completion_tokens, int total_tokens});
}

/// @nodoc
class __$$_UsageCopyWithImpl<$Res> extends _$UsageCopyWithImpl<$Res, _$_Usage>
    implements _$$_UsageCopyWith<$Res> {
  __$$_UsageCopyWithImpl(_$_Usage _value, $Res Function(_$_Usage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prompt_tokens = null,
    Object? completion_tokens = null,
    Object? total_tokens = null,
  }) {
    return _then(_$_Usage(
      prompt_tokens: null == prompt_tokens
          ? _value.prompt_tokens
          : prompt_tokens // ignore: cast_nullable_to_non_nullable
              as int,
      completion_tokens: null == completion_tokens
          ? _value.completion_tokens
          : completion_tokens // ignore: cast_nullable_to_non_nullable
              as int,
      total_tokens: null == total_tokens
          ? _value.total_tokens
          : total_tokens // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Usage implements _Usage {
  const _$_Usage(
      {required this.prompt_tokens,
      required this.completion_tokens,
      required this.total_tokens});

  factory _$_Usage.fromJson(Map<String, dynamic> json) =>
      _$$_UsageFromJson(json);

  @override
  final int prompt_tokens;
  @override
  final int completion_tokens;
  @override
  final int total_tokens;

  @override
  String toString() {
    return 'Usage(prompt_tokens: $prompt_tokens, completion_tokens: $completion_tokens, total_tokens: $total_tokens)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Usage &&
            (identical(other.prompt_tokens, prompt_tokens) ||
                other.prompt_tokens == prompt_tokens) &&
            (identical(other.completion_tokens, completion_tokens) ||
                other.completion_tokens == completion_tokens) &&
            (identical(other.total_tokens, total_tokens) ||
                other.total_tokens == total_tokens));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, prompt_tokens, completion_tokens, total_tokens);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UsageCopyWith<_$_Usage> get copyWith =>
      __$$_UsageCopyWithImpl<_$_Usage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UsageToJson(
      this,
    );
  }
}

abstract class _Usage implements Usage {
  const factory _Usage(
      {required final int prompt_tokens,
      required final int completion_tokens,
      required final int total_tokens}) = _$_Usage;

  factory _Usage.fromJson(Map<String, dynamic> json) = _$_Usage.fromJson;

  @override
  int get prompt_tokens;
  @override
  int get completion_tokens;
  @override
  int get total_tokens;
  @override
  @JsonKey(ignore: true)
  _$$_UsageCopyWith<_$_Usage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Chat {
  ChatRequest get request => throw _privateConstructorUsedError;
  ChatResponse? get response => throw _privateConstructorUsedError;
  ChatStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatCopyWith<Chat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatCopyWith<$Res> {
  factory $ChatCopyWith(Chat value, $Res Function(Chat) then) =
      _$ChatCopyWithImpl<$Res, Chat>;
  @useResult
  $Res call({ChatRequest request, ChatResponse? response, ChatStatus status});

  $ChatRequestCopyWith<$Res> get request;
  $ChatResponseCopyWith<$Res>? get response;
}

/// @nodoc
class _$ChatCopyWithImpl<$Res, $Val extends Chat>
    implements $ChatCopyWith<$Res> {
  _$ChatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
    Object? response = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as ChatRequest,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as ChatResponse?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ChatStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatRequestCopyWith<$Res> get request {
    return $ChatRequestCopyWith<$Res>(_value.request, (value) {
      return _then(_value.copyWith(request: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatResponseCopyWith<$Res>? get response {
    if (_value.response == null) {
      return null;
    }

    return $ChatResponseCopyWith<$Res>(_value.response!, (value) {
      return _then(_value.copyWith(response: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ChatCopyWith<$Res> implements $ChatCopyWith<$Res> {
  factory _$$_ChatCopyWith(_$_Chat value, $Res Function(_$_Chat) then) =
      __$$_ChatCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ChatRequest request, ChatResponse? response, ChatStatus status});

  @override
  $ChatRequestCopyWith<$Res> get request;
  @override
  $ChatResponseCopyWith<$Res>? get response;
}

/// @nodoc
class __$$_ChatCopyWithImpl<$Res> extends _$ChatCopyWithImpl<$Res, _$_Chat>
    implements _$$_ChatCopyWith<$Res> {
  __$$_ChatCopyWithImpl(_$_Chat _value, $Res Function(_$_Chat) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
    Object? response = freezed,
    Object? status = null,
  }) {
    return _then(_$_Chat(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as ChatRequest,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as ChatResponse?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ChatStatus,
    ));
  }
}

/// @nodoc

class _$_Chat extends _Chat {
  const _$_Chat(
      {required this.request, this.response, this.status = ChatStatus.waiting})
      : super._();

  @override
  final ChatRequest request;
  @override
  final ChatResponse? response;
  @override
  @JsonKey()
  final ChatStatus status;

  @override
  String toString() {
    return 'Chat(request: $request, response: $response, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Chat &&
            (identical(other.request, request) || other.request == request) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request, response, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatCopyWith<_$_Chat> get copyWith =>
      __$$_ChatCopyWithImpl<_$_Chat>(this, _$identity);
}

abstract class _Chat extends Chat {
  const factory _Chat(
      {required final ChatRequest request,
      final ChatResponse? response,
      final ChatStatus status}) = _$_Chat;
  const _Chat._() : super._();

  @override
  ChatRequest get request;
  @override
  ChatResponse? get response;
  @override
  ChatStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_ChatCopyWith<_$_Chat> get copyWith => throw _privateConstructorUsedError;
}
