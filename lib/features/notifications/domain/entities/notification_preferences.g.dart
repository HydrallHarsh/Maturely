// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationPreferencesImpl _$$NotificationPreferencesImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationPreferencesImpl(
      enableNotifications: json['enableNotifications'] as bool? ?? true,
      enableMaturityReminders: json['enableMaturityReminders'] as bool? ?? true,
      enableMaturityDue: json['enableMaturityDue'] as bool? ?? true,
      reminderDaysBefore: (json['reminderDaysBefore'] as num?)?.toInt() ?? 3,
      notificationTime: json['notificationTime'] as String? ?? '09:00',
      enableSound: json['enableSound'] as bool? ?? true,
      enableVibration: json['enableVibration'] as bool? ?? true,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$NotificationPreferencesImplToJson(
        _$NotificationPreferencesImpl instance) =>
    <String, dynamic>{
      'enableNotifications': instance.enableNotifications,
      'enableMaturityReminders': instance.enableMaturityReminders,
      'enableMaturityDue': instance.enableMaturityDue,
      'reminderDaysBefore': instance.reminderDaysBefore,
      'notificationTime': instance.notificationTime,
      'enableSound': instance.enableSound,
      'enableVibration': instance.enableVibration,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
