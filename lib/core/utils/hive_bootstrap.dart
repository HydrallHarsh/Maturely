import 'package:hive_flutter/hive_flutter.dart';

import '../../features/deposits/data/models/deposit_hive_model.dart';
import '../../features/deposits/data/models/deposit_chain_hive_model.dart';
import '../../features/notifications/data/models/notification_hive_model.dart';

class HiveBootstrap {
  static const String depositsBoxName = 'deposits_box_v1';
  static const String chainsBoxName = 'deposit_chains';
  static const String linksBoxName = 'chain_links';
  static const String notificationsBoxName = 'notifications';
  static const String notificationPreferencesBoxName =
      'notification_preferences';

  static Future<void> initAndOpen() async {
    // Init is already called in main, but safe to call again
    await Hive.initFlutter();

    // Clear existing boxes if there are type conflicts
    try {
      await Hive.deleteBoxFromDisk(depositsBoxName);
      await Hive.deleteBoxFromDisk(chainsBoxName);
      await Hive.deleteBoxFromDisk(linksBoxName);
      await Hive.deleteBoxFromDisk(notificationsBoxName);
      await Hive.deleteBoxFromDisk(notificationPreferencesBoxName);
    } catch (e) {
      // Ignore errors if boxes don't exist
    }

    if (!Hive.isAdapterRegistered(AttachmentHiveModel.typeId)) {
      Hive.registerAdapter(AttachmentHiveModelAdapter());
    }
    if (!Hive.isAdapterRegistered(DepositHiveModel.typeId)) {
      Hive.registerAdapter(DepositHiveModelAdapter());
    }
    if (!Hive.isAdapterRegistered(DepositChainHiveModel.typeId)) {
      Hive.registerAdapter(DepositChainHiveModelAdapter());
    }
    if (!Hive.isAdapterRegistered(ChainLinkHiveModel.typeId)) {
      Hive.registerAdapter(ChainLinkHiveModelAdapter());
    }
    if (!Hive.isAdapterRegistered(6)) {
      Hive.registerAdapter(ScheduledNotificationHiveModelAdapter());
    }
    if (!Hive.isAdapterRegistered(7)) {
      Hive.registerAdapter(NotificationPreferencesHiveModelAdapter());
    }
    await Hive.openBox<DepositHiveModel>(depositsBoxName);
    await Hive.openBox<DepositChainHiveModel>(chainsBoxName);
    await Hive.openBox<ChainLinkHiveModel>(linksBoxName);
    await Hive.openBox<ScheduledNotificationHiveModel>(notificationsBoxName);
    await Hive.openBox<NotificationPreferencesHiveModel>(
        notificationPreferencesBoxName);
  }
}
