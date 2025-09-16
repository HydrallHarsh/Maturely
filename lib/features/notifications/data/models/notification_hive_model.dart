import 'package:hive/hive.dart';

part 'notification_hive_model.g.dart';

@HiveType(typeId: 6)
class ScheduledNotificationHiveModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String depositId;

  @HiveField(2)
  String title;

  @HiveField(3)
  String body;

  @HiveField(4)
  DateTime scheduledTime;

  @HiveField(5)
  String category;

  @HiveField(6)
  String priority;

  @HiveField(7)
  DateTime createdAt;

  @HiveField(8)
  bool isDelivered;

  @HiveField(9)
  bool isCancelled;

  @HiveField(10)
  Map<String, dynamic>? payload;

  ScheduledNotificationHiveModel({
    required this.id,
    required this.depositId,
    required this.title,
    required this.body,
    required this.scheduledTime,
    required this.category,
    required this.priority,
    required this.createdAt,
    this.isDelivered = false,
    this.isCancelled = false,
    this.payload,
  });
}

@HiveType(typeId: 7)
class NotificationPreferencesHiveModel extends HiveObject {
  @HiveField(0)
  bool enableNotifications;

  @HiveField(1)
  bool enableMaturityReminders;

  @HiveField(2)
  bool enableMaturityDue;

  @HiveField(3)
  int reminderDaysBefore;

  @HiveField(4)
  String notificationTime;

  @HiveField(5)
  bool enableSound;

  @HiveField(6)
  bool enableVibration;

  @HiveField(7)
  DateTime createdAt;

  @HiveField(8)
  DateTime updatedAt;

  NotificationPreferencesHiveModel({
    this.enableNotifications = true,
    this.enableMaturityReminders = true,
    this.enableMaturityDue = true,
    this.reminderDaysBefore = 3,
    this.notificationTime = '09:00',
    this.enableSound = true,
    this.enableVibration = true,
    required this.createdAt,
    required this.updatedAt,
  });
}
