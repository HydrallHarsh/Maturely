import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../domain/entities/notification_preferences.dart';
import '../../domain/repositories/notification_repository.dart';
import '../../domain/usecases/notification_scheduler.dart';
import '../../data/repositories/hive_notification_repository.dart';

// Provider for FlutterLocalNotificationsPlugin instance
final flutterLocalNotificationsProvider =
    Provider<FlutterLocalNotificationsPlugin>((ref) {
  return FlutterLocalNotificationsPlugin();
});

// Provider for notification repository
final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  final plugin = ref.watch(flutterLocalNotificationsProvider);
  return HiveNotificationRepository(plugin);
});

// Provider for notification scheduler
final notificationSchedulerProvider = Provider<NotificationScheduler>((ref) {
  final repository = ref.watch(notificationRepositoryProvider);
  return NotificationScheduler(repository);
});

// Provider for notification permissions status
final notificationPermissionsProvider = FutureProvider<bool>((ref) {
  final repository = ref.watch(notificationRepositoryProvider);
  return repository.hasPermissions();
});

// Simple state notifier for notification preferences (without copyWith for now)
class NotificationPreferencesNotifier
    extends StateNotifier<NotificationPreferences?> {
  final NotificationRepository _repository;

  NotificationPreferencesNotifier(this._repository) : super(null) {
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    try {
      final preferences = await _repository.getPreferences();
      state = preferences;
    } catch (error) {
      // Create default preferences on error
      state = NotificationPreferences.createDefault();
    }
  }

  Future<void> updatePreferences(NotificationPreferences preferences) async {
    try {
      await _repository.savePreferences(preferences);
      state = preferences;
    } catch (error) {
      // Handle error but keep current state
    }
  }

  Future<void> toggleNotifications(bool enabled) async {
    if (state != null) {
      // Create new preferences manually until copyWith is available
      final updated = NotificationPreferences(
        enableNotifications: enabled,
        enableMaturityReminders: state!.enableMaturityReminders,
        enableMaturityDue: state!.enableMaturityDue,
        reminderDaysBefore: state!.reminderDaysBefore,
        notificationTime: state!.notificationTime,
        enableSound: state!.enableSound,
        enableVibration: state!.enableVibration,
        createdAt: state!.createdAt,
        updatedAt: DateTime.now(),
      );
      await updatePreferences(updated);
    }
  }

  Future<void> updateReminderDays(int days) async {
    if (state != null) {
      final updated = NotificationPreferences(
        enableNotifications: state!.enableNotifications,
        enableMaturityReminders: state!.enableMaturityReminders,
        enableMaturityDue: state!.enableMaturityDue,
        reminderDaysBefore: days,
        notificationTime: state!.notificationTime,
        enableSound: state!.enableSound,
        enableVibration: state!.enableVibration,
        createdAt: state!.createdAt,
        updatedAt: DateTime.now(),
      );
      await updatePreferences(updated);
    }
  }

  Future<void> updateNotificationTime(String time) async {
    if (state != null) {
      final updated = NotificationPreferences(
        enableNotifications: state!.enableNotifications,
        enableMaturityReminders: state!.enableMaturityReminders,
        enableMaturityDue: state!.enableMaturityDue,
        reminderDaysBefore: state!.reminderDaysBefore,
        notificationTime: time,
        enableSound: state!.enableSound,
        enableVibration: state!.enableVibration,
        createdAt: state!.createdAt,
        updatedAt: DateTime.now(),
      );
      await updatePreferences(updated);
    }
  }
}

// Provider for notification preferences state notifier
final notificationPreferencesNotifierProvider = StateNotifierProvider<
    NotificationPreferencesNotifier, NotificationPreferences?>((ref) {
  final repository = ref.watch(notificationRepositoryProvider);
  return NotificationPreferencesNotifier(repository);
});
