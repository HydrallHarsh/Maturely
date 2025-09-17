import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'core/constants/app_constants.dart';
import 'core/utils/hive_bootstrap.dart';
import 'shared/presentation/theme/app_theme.dart';
import 'core/utils/notification_service.dart';
import 'features/auth/presentation/widgets/auth_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize Hive
  await HiveBootstrap.initAndOpen();

  // Initialize local notifications (no-op on web)
  await NotificationService.init();

  runApp(
    const ProviderScope(
      child: DepositsApp(),
    ),
  );
}

class DepositsApp extends ConsumerWidget {
  const DepositsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const AuthWrapper(), // Use AuthWrapper instead of router
      debugShowCheckedModeBanner: false,
    );
  }
}
