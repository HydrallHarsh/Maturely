// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduledNotificationImpl _$$ScheduledNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$ScheduledNotificationImpl(
      id: json['id'] as String,
      depositId: json['depositId'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      scheduledTime: DateTime.parse(json['scheduledTime'] as String),
      category: $enumDecode(_$NotificationCategoryEnumMap, json['category']),
      priority: $enumDecodeNullable(
              _$NotificationPriorityEnumMap, json['priority']) ??
          NotificationPriority.normal,
      createdAt: DateTime.parse(json['createdAt'] as String),
      isDelivered: json['isDelivered'] as bool? ?? false,
      isCancelled: json['isCancelled'] as bool? ?? false,
      payload: json['payload'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ScheduledNotificationImplToJson(
        _$ScheduledNotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'depositId': instance.depositId,
      'title': instance.title,
      'body': instance.body,
      'scheduledTime': instance.scheduledTime.toIso8601String(),
      'category': _$NotificationCategoryEnumMap[instance.category]!,
      'priority': _$NotificationPriorityEnumMap[instance.priority]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'isDelivered': instance.isDelivered,
      'isCancelled': instance.isCancelled,
      'payload': instance.payload,
    };

const _$NotificationCategoryEnumMap = {
  NotificationCategory.maturityReminder: 'maturity_reminder',
  NotificationCategory.maturityDue: 'maturity_due',
  NotificationCategory.general: 'general',
};

const _$NotificationPriorityEnumMap = {
  NotificationPriority.low: 'low',
  NotificationPriority.normal: 'normal',
  NotificationPriority.high: 'high',
};
