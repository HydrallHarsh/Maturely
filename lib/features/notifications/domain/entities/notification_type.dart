import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_type.freezed.dart';
part 'notification_type.g.dart';

enum NotificationCategory {
  @JsonValue('maturity_reminder')
  maturityReminder,
  @JsonValue('maturity_due')
  maturityDue,
  @JsonValue('general')
  general,
}

enum NotificationPriority {
  @JsonValue('low')
  low,
  @JsonValue('normal')
  normal,
  @JsonValue('high')
  high,
}

@freezed
class ScheduledNotification with _$ScheduledNotification {
  const factory ScheduledNotification({
    required String id,
    required String depositId,
    required String title,
    required String body,
    required DateTime scheduledTime,
    required NotificationCategory category,
    @Default(NotificationPriority.normal) NotificationPriority priority,
    required DateTime createdAt,
    @Default(false) bool isDelivered,
    @Default(false) bool isCancelled,
    Map<String, dynamic>? payload,
  }) = _ScheduledNotification;

  factory ScheduledNotification.fromJson(Map<String, dynamic> json) =>
      _$ScheduledNotificationFromJson(json);

  const ScheduledNotification._();

  /// Check if this notification is due for delivery
  bool get isDue => DateTime.now().isAfter(scheduledTime);

  /// Check if this notification is still active (not delivered or cancelled)
  bool get isActive => !isDelivered && !isCancelled;

  /// Get the notification ID for the platform scheduler
  int get platformId => id.hashCode.abs();
}
