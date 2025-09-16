import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/notification_providers.dart';
import '../../domain/entities/notification_preferences.dart';

class NotificationPreferencesPage extends ConsumerWidget {
  const NotificationPreferencesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preferences = ref.watch(notificationPreferencesNotifierProvider);
    final permissionsAsync = ref.watch(notificationPermissionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Settings'),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue[50]!,
              Colors.white,
            ],
          ),
        ),
        child: permissionsAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                Text('Permission Error: $error'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () =>
                      ref.invalidate(notificationPermissionsProvider),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
          data: (hasPermissions) {
            if (!hasPermissions) {
              return _buildPermissionRequest(ref);
            }

            if (preferences == null) {
              return const Center(child: CircularProgressIndicator());
            }

            return _buildPreferencesForm(
                context, ref, preferences, permissionsAsync);
          },
        ),
      ),
    );
  }

  Widget _buildPermissionRequest(WidgetRef ref) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.notifications_off,
              size: 64,
              color: Colors.orange,
            ),
            const SizedBox(height: 16),
            const Text(
              'Notification Permission Required',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            const Text(
              'To receive deposit reminders and notifications, please enable notification permissions.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                final repository = ref.read(notificationRepositoryProvider);
                await repository.requestPermissions();
                ref.invalidate(notificationPermissionsProvider);
              },
              child: const Text('Enable Notifications'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPreferencesForm(
    BuildContext context,
    WidgetRef ref,
    NotificationPreferences preferences,
    AsyncValue<bool> permissionsAsync,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Permissions status
          _buildPermissionsCard(context, ref, permissionsAsync),
          const SizedBox(height: 16),

          // Main settings
          _buildSettingsCard(context, ref, preferences),
        ],
      ),
    );
  }

  Widget _buildPermissionsCard(
      BuildContext context, WidgetRef ref, AsyncValue<bool> permissionsAsync) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.security, color: Colors.orange[600]),
                const SizedBox(width: 8),
                const Text(
                  'Permissions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            permissionsAsync.when(
              loading: () => const CircularProgressIndicator(),
              error: (error, stack) =>
                  Text('Error checking permissions: $error'),
              data: (hasPermissions) => Row(
                children: [
                  Icon(
                    hasPermissions ? Icons.check_circle : Icons.warning,
                    color: hasPermissions ? Colors.green : Colors.orange,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      hasPermissions
                          ? 'Notifications are enabled'
                          : 'Notification permissions are required',
                    ),
                  ),
                  if (!hasPermissions)
                    ElevatedButton(
                      onPressed: () async {
                        final repository =
                            ref.read(notificationRepositoryProvider);
                        await repository.requestPermissions();
                        ref.invalidate(notificationPermissionsProvider);
                      },
                      child: const Text('Enable'),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsCard(BuildContext context, WidgetRef ref,
      NotificationPreferences preferences) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.notifications, color: Colors.blue[600]),
                const SizedBox(width: 8),
                const Text(
                  'Notification Settings',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Enable notifications toggle
            SwitchListTile(
              title: const Text('Enable Notifications'),
              subtitle:
                  const Text('Receive notifications for deposit maturities'),
              value: preferences.enableNotifications,
              onChanged: (value) {
                ref
                    .read(notificationPreferencesNotifierProvider.notifier)
                    .toggleNotifications(value);
              },
            ),

            if (preferences.enableNotifications) ...[
              const Divider(),

              // Maturity reminders
              SwitchListTile(
                title: const Text('Maturity Reminders'),
                subtitle: const Text('Get reminded before deposits mature'),
                value: preferences.enableMaturityReminders,
                onChanged: (value) {
                  final updated = NotificationPreferences(
                    enableNotifications: preferences.enableNotifications,
                    enableMaturityReminders: value,
                    enableMaturityDue: preferences.enableMaturityDue,
                    reminderDaysBefore: preferences.reminderDaysBefore,
                    notificationTime: preferences.notificationTime,
                    enableSound: preferences.enableSound,
                    enableVibration: preferences.enableVibration,
                    createdAt: preferences.createdAt,
                    updatedAt: DateTime.now(),
                  );
                  ref
                      .read(notificationPreferencesNotifierProvider.notifier)
                      .updatePreferences(updated);
                },
              ),

              // Due date notifications
              SwitchListTile(
                title: const Text('Maturity Due Notifications'),
                subtitle: const Text('Get notified on the day deposits mature'),
                value: preferences.enableMaturityDue,
                onChanged: (value) {
                  final updated = NotificationPreferences(
                    enableNotifications: preferences.enableNotifications,
                    enableMaturityReminders:
                        preferences.enableMaturityReminders,
                    enableMaturityDue: value,
                    reminderDaysBefore: preferences.reminderDaysBefore,
                    notificationTime: preferences.notificationTime,
                    enableSound: preferences.enableSound,
                    enableVibration: preferences.enableVibration,
                    createdAt: preferences.createdAt,
                    updatedAt: DateTime.now(),
                  );
                  ref
                      .read(notificationPreferencesNotifierProvider.notifier)
                      .updatePreferences(updated);
                },
              ),

              const Divider(),

              // Reminder days setting
              ListTile(
                title: const Text('Reminder Days'),
                subtitle: Text(
                    'Remind me ${preferences.reminderDaysBefore} days before maturity'),
                trailing: DropdownButton<int>(
                  value: preferences.reminderDaysBefore,
                  items: [1, 2, 3, 5, 7, 10, 14].map((days) {
                    return DropdownMenuItem(
                      value: days,
                      child: Text('$days days'),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      ref
                          .read(
                              notificationPreferencesNotifierProvider.notifier)
                          .updateReminderDays(value);
                    }
                  },
                ),
              ),

              // Notification time setting
              ListTile(
                title: const Text('Notification Time'),
                subtitle: Text(
                    'Daily notifications at ${preferences.notificationTime}'),
                trailing: const Icon(Icons.access_time),
                onTap: () async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: preferences.timeOfDay,
                  );
                  if (time != null) {
                    final timeString =
                        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
                    ref
                        .read(notificationPreferencesNotifierProvider.notifier)
                        .updateNotificationTime(timeString);
                  }
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
