class AppConstants {
  // App Info
  static const String appName = 'Deposits Manager';
  static const String appVersion = '1.0.0';
  
  // Storage Keys
  static const String depositsBoxName = 'deposits';
  static const String settingsBoxName = 'settings';
  static const String userBoxName = 'user';
  
  // Notification IDs
  static const int maturityNotificationId = 1000;
  static const int reminderNotificationId = 2000;
  
  // Default Values
  static const int defaultReminderDays = 7;
  static const int defaultLongReminderDays = 30;
  static const int maxAttachmentSize = 10 * 1024 * 1024; // 10MB
  
  // Date Formats
  static const String dateFormat = 'dd/MM/yyyy';
  static const String dateTimeFormat = 'dd/MM/yyyy HH:mm';
  static const String displayDateFormat = 'dd MMM yyyy';
  
  // Regex Patterns
  static const String amountPattern = r'₹?\s?\d{1,3}(,\d{3})*(\.\d+)?';
  static const String datePattern = r'\d{1,2}[/-]\d{1,2}[/-]\d{2,4}';
  static const String accountNumberPattern = r'(?:A/c|Account|A/C No|Acc No)[\s:]*(\d+)';
  static const String fdrNumberPattern = r'(?:FDR|F\.D\.R)[\s:]*(\d+)';
  static const String srNumberPattern = r'(?:Renewed to|Renewed To|Sr\.?\s*No\.?)[\s:]*(\d+)';
  
  // UI Constants
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double borderRadius = 12.0;
  static const double cardElevation = 2.0;
}
