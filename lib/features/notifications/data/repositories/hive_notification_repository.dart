import 'package:hive/hive.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

import '../../domain/entities/notification_type.dart';
import '../../domain/entities/notification_preferences.dart';
import '../../domain/repositories/notification_repository.dart';
import '../models/notification_hive_model.dart';

class HiveNotificationRepository implements NotificationRepository {
  static const String _notificationsBoxName = 'notifications';
  static const String _preferencesBoxName = 'notification_preferences';
  static const String _preferencesKey = 'user_preferences';

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  HiveNotificationRepository(this._flutterLocalNotificationsPlugin);

  Box<ScheduledNotificationHiveModel> get _notificationsBox =>
      Hive.box<ScheduledNotificationHiveModel>(_notificationsBoxName);

  Box<NotificationPreferencesHiveModel> get _preferencesBox =>
      Hive.box<NotificationPreferencesHiveModel>(_preferencesBoxName);

  @override
  Future<void> scheduleNotification(ScheduledNotification notification) async {
    // Store in Hive
    final hiveModel = _toHiveNotification(notification);
    await _notificationsBox.put(notification.id, hiveModel);

    // Schedule with platform
    await _scheduleWithPlatform(notification);
  }

  @override
  Future<void> cancelNotification(String notificationId) async {
    final hiveModel = _notificationsBox.get(notificationId);
    if (hiveModel != null) {
      // Cancel with platform
      await _flutterLocalNotificationsPlugin
          .cancel(notificationId.hashCode.abs());

      // Mark as cancelled in Hive
      hiveModel.isCancelled = true;
      await hiveModel.save();
    }
  }

  @override
  Future<void> cancelNotificationsForDeposit(String depositId) async {
    final notifications = _notificationsBox.values
        .where((n) => n.depositId == depositId && !n.isCancelled)
        .toList();

    for (final notification in notifications) {
      await cancelNotification(notification.id);
    }
  }

  @override
  Future<List<ScheduledNotification>> getScheduledNotifications() async {
    return _notificationsBox.values.map(_fromHiveNotification).toList();
  }

  @override
  Future<List<ScheduledNotification>> getNotificationsForDeposit(
      String depositId) async {
    return _notificationsBox.values
        .where((n) => n.depositId == depositId)
        .map(_fromHiveNotification)
        .toList();
  }

  @override
  Future<void> markAsDelivered(String notificationId) async {
    final hiveModel = _notificationsBox.get(notificationId);
    if (hiveModel != null) {
      hiveModel.isDelivered = true;
      await hiveModel.save();
    }
  }

  @override
  Future<void> cleanupOldNotifications({int olderThanDays = 30}) async {
    final cutoffDate = DateTime.now().subtract(Duration(days: olderThanDays));
    final toDelete = <String>[];

    for (final entry in _notificationsBox.toMap().entries) {
      final notification = entry.value;
      if ((notification.isDelivered || notification.isCancelled) &&
          notification.createdAt.isBefore(cutoffDate)) {
        toDelete.add(entry.key);
      }
    }

    await _notificationsBox.deleteAll(toDelete);
  }

  @override
  Future<NotificationPreferences> getPreferences() async {
    final hiveModel = _preferencesBox.get(_preferencesKey);
    if (hiveModel != null) {
      return _fromHivePreferences(hiveModel);
    }

    // Return default preferences
    return NotificationPreferences.createDefault();
  }

  @override
  Future<void> savePreferences(NotificationPreferences preferences) async {
    final hiveModel = _toHivePreferences(preferences);
    await _preferencesBox.put(_preferencesKey, hiveModel);
  }

  @override
  Future<bool> areNotificationsEnabled() async {
    final preferences = await getPreferences();
    return preferences.enableNotifications;
  }

  @override
  Future<bool> requestPermissions() async {
    final result = await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
    return result ?? false;
  }

  @override
  Future<bool> hasPermissions() async {
    final result = await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.areNotificationsEnabled();
    return result ?? false;
  }

  // Helper methods
  ScheduledNotificationHiveModel _toHiveNotification(
      ScheduledNotification notification) {
    return ScheduledNotificationHiveModel(
      id: notification.id,
      depositId: notification.depositId,
      title: notification.title,
      body: notification.body,
      scheduledTime: notification.scheduledTime,
      category: notification.category.name,
      priority: notification.priority.name,
      createdAt: notification.createdAt,
      isDelivered: notification.isDelivered,
      isCancelled: notification.isCancelled,
      payload: notification.payload,
    );
  }

  ScheduledNotification _fromHiveNotification(
      ScheduledNotificationHiveModel hive) {
    return ScheduledNotification(
      id: hive.id,
      depositId: hive.depositId,
      title: hive.title,
      body: hive.body,
      scheduledTime: hive.scheduledTime,
      category: NotificationCategory.values.firstWhere(
        (e) => e.name == hive.category,
        orElse: () => NotificationCategory.general,
      ),
      priority: NotificationPriority.values.firstWhere(
        (e) => e.name == hive.priority,
        orElse: () => NotificationPriority.normal,
      ),
      createdAt: hive.createdAt,
      isDelivered: hive.isDelivered,
      isCancelled: hive.isCancelled,
      payload: hive.payload,
    );
  }

  NotificationPreferencesHiveModel _toHivePreferences(
      NotificationPreferences preferences) {
    return NotificationPreferencesHiveModel(
      enableNotifications: preferences.enableNotifications,
      enableMaturityReminders: preferences.enableMaturityReminders,
      enableMaturityDue: preferences.enableMaturityDue,
      reminderDaysBefore: preferences.reminderDaysBefore,
      notificationTime: preferences.notificationTime,
      enableSound: preferences.enableSound,
      enableVibration: preferences.enableVibration,
      createdAt: preferences.createdAt,
      updatedAt: preferences.updatedAt,
    );
  }

  NotificationPreferences _fromHivePreferences(
      NotificationPreferencesHiveModel hive) {
    return NotificationPreferences(
      enableNotifications: hive.enableNotifications,
      enableMaturityReminders: hive.enableMaturityReminders,
      enableMaturityDue: hive.enableMaturityDue,
      reminderDaysBefore: hive.reminderDaysBefore,
      notificationTime: hive.notificationTime,
      enableSound: hive.enableSound,
      enableVibration: hive.enableVibration,
      createdAt: hive.createdAt,
      updatedAt: hive.updatedAt,
    );
  }

  Future<void> _scheduleWithPlatform(ScheduledNotification notification) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'deposit_notifications',
      'Deposit Notifications',
      channelDescription: 'Notifications for deposit maturities and reminders',
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      notification.platformId,
      notification.title,
      notification.body,
      tz.TZDateTime.from(notification.scheduledTime, tz.local),
      platformChannelSpecifics,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: notification.id,
    );
  }
}
