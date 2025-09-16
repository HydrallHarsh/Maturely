// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScheduledNotification _$ScheduledNotificationFromJson(
    Map<String, dynamic> json) {
  return _ScheduledNotification.fromJson(json);
}

/// @nodoc
mixin _$ScheduledNotification {
  String get id => throw _privateConstructorUsedError;
  String get depositId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  DateTime get scheduledTime => throw _privateConstructorUsedError;
  NotificationCategory get category => throw _privateConstructorUsedError;
  NotificationPriority get priority => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool get isDelivered => throw _privateConstructorUsedError;
  bool get isCancelled => throw _privateConstructorUsedError;
  Map<String, dynamic>? get payload => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduledNotificationCopyWith<ScheduledNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduledNotificationCopyWith<$Res> {
  factory $ScheduledNotificationCopyWith(ScheduledNotification value,
          $Res Function(ScheduledNotification) then) =
      _$ScheduledNotificationCopyWithImpl<$Res, ScheduledNotification>;
  @useResult
  $Res call(
      {String id,
      String depositId,
      String title,
      String body,
      DateTime scheduledTime,
      NotificationCategory category,
      NotificationPriority priority,
      DateTime createdAt,
      bool isDelivered,
      bool isCancelled,
      Map<String, dynamic>? payload});
}

/// @nodoc
class _$ScheduledNotificationCopyWithImpl<$Res,
        $Val extends ScheduledNotification>
    implements $ScheduledNotificationCopyWith<$Res> {
  _$ScheduledNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? depositId = null,
    Object? title = null,
    Object? body = null,
    Object? scheduledTime = null,
    Object? category = null,
    Object? priority = null,
    Object? createdAt = null,
    Object? isDelivered = null,
    Object? isCancelled = null,
    Object? payload = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      depositId: null == depositId
          ? _value.depositId
          : depositId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledTime: null == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as NotificationCategory,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as NotificationPriority,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isDelivered: null == isDelivered
          ? _value.isDelivered
          : isDelivered // ignore: cast_nullable_to_non_nullable
              as bool,
      isCancelled: null == isCancelled
          ? _value.isCancelled
          : isCancelled // ignore: cast_nullable_to_non_nullable
              as bool,
      payload: freezed == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduledNotificationImplCopyWith<$Res>
    implements $ScheduledNotificationCopyWith<$Res> {
  factory _$$ScheduledNotificationImplCopyWith(
          _$ScheduledNotificationImpl value,
          $Res Function(_$ScheduledNotificationImpl) then) =
      __$$ScheduledNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String depositId,
      String title,
      String body,
      DateTime scheduledTime,
      NotificationCategory category,
      NotificationPriority priority,
      DateTime createdAt,
      bool isDelivered,
      bool isCancelled,
      Map<String, dynamic>? payload});
}

/// @nodoc
class __$$ScheduledNotificationImplCopyWithImpl<$Res>
    extends _$ScheduledNotificationCopyWithImpl<$Res,
        _$ScheduledNotificationImpl>
    implements _$$ScheduledNotificationImplCopyWith<$Res> {
  __$$ScheduledNotificationImplCopyWithImpl(_$ScheduledNotificationImpl _value,
      $Res Function(_$ScheduledNotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? depositId = null,
    Object? title = null,
    Object? body = null,
    Object? scheduledTime = null,
    Object? category = null,
    Object? priority = null,
    Object? createdAt = null,
    Object? isDelivered = null,
    Object? isCancelled = null,
    Object? payload = freezed,
  }) {
    return _then(_$ScheduledNotificationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      depositId: null == depositId
          ? _value.depositId
          : depositId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledTime: null == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as NotificationCategory,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as NotificationPriority,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isDelivered: null == isDelivered
          ? _value.isDelivered
          : isDelivered // ignore: cast_nullable_to_non_nullable
              as bool,
      isCancelled: null == isCancelled
          ? _value.isCancelled
          : isCancelled // ignore: cast_nullable_to_non_nullable
              as bool,
      payload: freezed == payload
          ? _value._payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduledNotificationImpl extends _ScheduledNotification {
  const _$ScheduledNotificationImpl(
      {required this.id,
      required this.depositId,
      required this.title,
      required this.body,
      required this.scheduledTime,
      required this.category,
      this.priority = NotificationPriority.normal,
      required this.createdAt,
      this.isDelivered = false,
      this.isCancelled = false,
      final Map<String, dynamic>? payload})
      : _payload = payload,
        super._();

  factory _$ScheduledNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduledNotificationImplFromJson(json);

  @override
  final String id;
  @override
  final String depositId;
  @override
  final String title;
  @override
  final String body;
  @override
  final DateTime scheduledTime;
  @override
  final NotificationCategory category;
  @override
  @JsonKey()
  final NotificationPriority priority;
  @override
  final DateTime createdAt;
  @override
  @JsonKey()
  final bool isDelivered;
  @override
  @JsonKey()
  final bool isCancelled;
  final Map<String, dynamic>? _payload;
  @override
  Map<String, dynamic>? get payload {
    final value = _payload;
    if (value == null) return null;
    if (_payload is EqualUnmodifiableMapView) return _payload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ScheduledNotification(id: $id, depositId: $depositId, title: $title, body: $body, scheduledTime: $scheduledTime, category: $category, priority: $priority, createdAt: $createdAt, isDelivered: $isDelivered, isCancelled: $isCancelled, payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduledNotificationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.depositId, depositId) ||
                other.depositId == depositId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.scheduledTime, scheduledTime) ||
                other.scheduledTime == scheduledTime) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isDelivered, isDelivered) ||
                other.isDelivered == isDelivered) &&
            (identical(other.isCancelled, isCancelled) ||
                other.isCancelled == isCancelled) &&
            const DeepCollectionEquality().equals(other._payload, _payload));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      depositId,
      title,
      body,
      scheduledTime,
      category,
      priority,
      createdAt,
      isDelivered,
      isCancelled,
      const DeepCollectionEquality().hash(_payload));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduledNotificationImplCopyWith<_$ScheduledNotificationImpl>
      get copyWith => __$$ScheduledNotificationImplCopyWithImpl<
          _$ScheduledNotificationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduledNotificationImplToJson(
      this,
    );
  }
}

abstract class _ScheduledNotification extends ScheduledNotification {
  const factory _ScheduledNotification(
      {required final String id,
      required final String depositId,
      required final String title,
      required final String body,
      required final DateTime scheduledTime,
      required final NotificationCategory category,
      final NotificationPriority priority,
      required final DateTime createdAt,
      final bool isDelivered,
      final bool isCancelled,
      final Map<String, dynamic>? payload}) = _$ScheduledNotificationImpl;
  const _ScheduledNotification._() : super._();

  factory _ScheduledNotification.fromJson(Map<String, dynamic> json) =
      _$ScheduledNotificationImpl.fromJson;

  @override
  String get id;
  @override
  String get depositId;
  @override
  String get title;
  @override
  String get body;
  @override
  DateTime get scheduledTime;
  @override
  NotificationCategory get category;
  @override
  NotificationPriority get priority;
  @override
  DateTime get createdAt;
  @override
  bool get isDelivered;
  @override
  bool get isCancelled;
  @override
  Map<String, dynamic>? get payload;
  @override
  @JsonKey(ignore: true)
  _$$ScheduledNotificationImplCopyWith<_$ScheduledNotificationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
