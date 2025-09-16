import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../deposits/domain/entities/deposit.dart';
import '../entities/notification_type.dart';
import '../repositories/notification_repository.dart';

class NotificationScheduler {
  final NotificationRepository _repository;
  final Uuid _uuid = const Uuid();

  NotificationScheduler(this._repository);

  /// Schedule notifications for a deposit based on user preferences
  Future<void> scheduleForDeposit(Deposit deposit) async {
    final preferences = await _repository.getPreferences();

    if (!preferences.enableNotifications) return;

    // Cancel any existing notifications for this deposit
    await _repository.cancelNotificationsForDeposit(deposit.id);

    final notifications = <ScheduledNotification>[];

    // Schedule reminder notification (3 days before or user preference)
    if (preferences.enableMaturityReminders) {
      final reminderDate = deposit.dueDate.subtract(
        Duration(days: preferences.reminderDaysBefore),
      );

      // Only schedule if the reminder date is in the future
      if (reminderDate.isAfter(DateTime.now())) {
        final reminderTime =
            _combineDateTime(reminderDate, preferences.timeOfDay);

        notifications.add(ScheduledNotification(
          id: _uuid.v4(),
          depositId: deposit.id,
          title: 'Deposit Maturity Reminder',
          body:
              'Your ${deposit.bankName} deposit (₹${_formatAmount(deposit.amountDeposited)}) matures in ${preferences.reminderDaysBefore} days',
          scheduledTime: reminderTime,
          category: NotificationCategory.maturityReminder,
          priority: NotificationPriority.normal,
          createdAt: DateTime.now(),
          payload: {
            'depositId': deposit.id,
            'type': 'reminder',
            'daysUntilMaturity': preferences.reminderDaysBefore.toString(),
          },
        ));
      }
    }

    // Schedule due date notification
    if (preferences.enableMaturityDue) {
      final dueTime = _combineDateTime(deposit.dueDate, preferences.timeOfDay);

      // Only schedule if the due date is in the future
      if (dueTime.isAfter(DateTime.now())) {
        notifications.add(ScheduledNotification(
          id: _uuid.v4(),
          depositId: deposit.id,
          title: 'Deposit Matured!',
          body:
              'Your ${deposit.bankName} deposit (₹${_formatAmount(deposit.dueAmount)}) has matured today',
          scheduledTime: dueTime,
          category: NotificationCategory.maturityDue,
          priority: NotificationPriority.high,
          createdAt: DateTime.now(),
          payload: {
            'depositId': deposit.id,
            'type': 'matured',
            'amount': deposit.dueAmount.toString(),
          },
        ));
      }
    }

    // Schedule all notifications
    for (final notification in notifications) {
      await _repository.scheduleNotification(notification);
    }
  }

  /// Cancel all notifications for a deposit
  Future<void> cancelForDeposit(String depositId) async {
    await _repository.cancelNotificationsForDeposit(depositId);
  }

  /// Reschedule notifications for updated deposit
  Future<void> rescheduleForDeposit(Deposit deposit) async {
    await cancelForDeposit(deposit.id);
    await scheduleForDeposit(deposit);
  }

  /// Get upcoming notifications
  Future<List<ScheduledNotification>> getUpcomingNotifications() async {
    final all = await _repository.getScheduledNotifications();
    return all.where((n) => n.isActive && n.isDue).toList()
      ..sort((a, b) => a.scheduledTime.compareTo(b.scheduledTime));
  }

  /// Combine date and time of day
  DateTime _combineDateTime(DateTime date, TimeOfDay time) {
    return DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
  }

  /// Format amount for display
  String _formatAmount(double amount) {
    return amount.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );
  }
}
