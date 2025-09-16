// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScheduledNotificationHiveModelAdapter
    extends TypeAdapter<ScheduledNotificationHiveModel> {
  @override
  final int typeId = 6;

  @override
  ScheduledNotificationHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScheduledNotificationHiveModel(
      id: fields[0] as String,
      depositId: fields[1] as String,
      title: fields[2] as String,
      body: fields[3] as String,
      scheduledTime: fields[4] as DateTime,
      category: fields[5] as String,
      priority: fields[6] as String,
      createdAt: fields[7] as DateTime,
      isDelivered: fields[8] as bool,
      isCancelled: fields[9] as bool,
      payload: (fields[10] as Map?)?.cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, ScheduledNotificationHiveModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.depositId)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.body)
      ..writeByte(4)
      ..write(obj.scheduledTime)
      ..writeByte(5)
      ..write(obj.category)
      ..writeByte(6)
      ..write(obj.priority)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.isDelivered)
      ..writeByte(9)
      ..write(obj.isCancelled)
      ..writeByte(10)
      ..write(obj.payload);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScheduledNotificationHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NotificationPreferencesHiveModelAdapter
    extends TypeAdapter<NotificationPreferencesHiveModel> {
  @override
  final int typeId = 7;

  @override
  NotificationPreferencesHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotificationPreferencesHiveModel(
      enableNotifications: fields[0] as bool,
      enableMaturityReminders: fields[1] as bool,
      enableMaturityDue: fields[2] as bool,
      reminderDaysBefore: fields[3] as int,
      notificationTime: fields[4] as String,
      enableSound: fields[5] as bool,
      enableVibration: fields[6] as bool,
      createdAt: fields[7] as DateTime,
      updatedAt: fields[8] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, NotificationPreferencesHiveModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.enableNotifications)
      ..writeByte(1)
      ..write(obj.enableMaturityReminders)
      ..writeByte(2)
      ..write(obj.enableMaturityDue)
      ..writeByte(3)
      ..write(obj.reminderDaysBefore)
      ..writeByte(4)
      ..write(obj.notificationTime)
      ..writeByte(5)
      ..write(obj.enableSound)
      ..writeByte(6)
      ..write(obj.enableVibration)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationPreferencesHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
