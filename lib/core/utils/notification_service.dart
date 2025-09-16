import 'package:flutter/foundation.dart';

import '../../features/deposits/domain/entities/deposit.dart';

// Minimal, lint-safe notification hooks.
// We will wire real scheduling on Android/iOS in a later step.
class NotificationService {
  static bool _initialized = false;

  static Future<void> init() async {
    // No-op on web and during early development to avoid platform setup.
    _initialized = true;
  }

  static Future<void> scheduleForDeposit(Deposit deposit) async {
    if (!_initialized || kIsWeb) return;
    // Intentionally no-op for now. This keeps code paths ready without build errors.
    // Next: add platform channels + timezone scheduling for Android/iOS.
  }

  static Future<void> cancelForDeposit(String depositId) async {
    if (!_initialized || kIsWeb) return;
  }
}
