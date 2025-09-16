import '../entities/notification_type.dart';
import '../entities/notification_preferences.dart';

abstract class NotificationRepository {
  /// Schedule a notification
  Future<void> scheduleNotification(ScheduledNotification notification);

  /// Cancel a scheduled notification
  Future<void> cancelNotification(String notificationId);

  /// Cancel all notifications for a specific deposit
  Future<void> cancelNotificationsForDeposit(String depositId);

  /// Get all scheduled notifications
  Future<List<ScheduledNotification>> getScheduledNotifications();

  /// Get scheduled notifications for a specific deposit
  Future<List<ScheduledNotification>> getNotificationsForDeposit(
      String depositId);

  /// Mark a notification as delivered
  Future<void> markAsDelivered(String notificationId);

  /// Clean up old delivered/cancelled notifications
  Future<void> cleanupOldNotifications({int olderThanDays = 30});

  /// Get notification preferences
  Future<NotificationPreferences> getPreferences();

  /// Save notification preferences
  Future<void> savePreferences(NotificationPreferences preferences);

  /// Check if notifications are enabled
  Future<bool> areNotificationsEnabled();

  /// Request notification permissions
  Future<bool> requestPermissions();

  /// Check if notification permissions are granted
  Future<bool> hasPermissions();
}
