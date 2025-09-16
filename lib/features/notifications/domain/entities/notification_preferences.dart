import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_preferences.freezed.dart';
part 'notification_preferences.g.dart';

@freezed
class NotificationPreferences with _$NotificationPreferences {
  const factory NotificationPreferences({
    @Default(true) bool enableNotifications,
    @Default(true) bool enableMaturityReminders,
    @Default(true) bool enableMaturityDue,
    @Default(3) int reminderDaysBefore,
    @Default('09:00') String notificationTime, // HH:mm format
    @Default(true) bool enableSound,
    @Default(true) bool enableVibration,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _NotificationPreferences;

  factory NotificationPreferences.fromJson(Map<String, dynamic> json) =>
      _$NotificationPreferencesFromJson(json);

  const NotificationPreferences._();

  /// Get the notification time as TimeOfDay
  TimeOfDay get timeOfDay {
    final parts = notificationTime.split(':');
    return TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );
  }

  /// Create preferences with updated notification time
  NotificationPreferences withTime(TimeOfDay time) {
    final timeString =
        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    return copyWith(
      notificationTime: timeString,
      updatedAt: DateTime.now(),
    );
  }

  /// Create default preferences
  static NotificationPreferences createDefault() {
    final now = DateTime.now();
    return NotificationPreferences(
      createdAt: now,
      updatedAt: now,
    );
  }
}
