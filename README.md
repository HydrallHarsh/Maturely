# Deposits Manager

A Flutter + Firebase app for digitizing and managing fixed/recurring deposits with OCR capabilities, lineage tracking, and offline-first architecture.

## Features

- 📱 **Cross-platform**: Android and iOS support
- 🔍 **OCR Integration**: Scan diary pages and receipts using Google ML Kit
- 🔗 **Lineage Tracking**: Track reinvestment chains and deposit history
- 📊 **Dashboard**: View upcoming maturities and statistics
- 🔔 **Notifications**: Local reminders for upcoming maturities
- 🔒 **Security**: App lock with biometrics/PIN and data encryption
- 📱 **Offline-first**: Works without internet, syncs when online
- ☁️ **Cloud Sync**: Firebase integration for multi-device access

## Tech Stack

- **Flutter**: Cross-platform UI framework
- **Riverpod**: State management
- **Hive**: Local database (offline-first)
- **Firebase**: Cloud services (Auth, Firestore, Storage, FCM)
- **Google ML Kit**: OCR text recognition
- **go_router**: Navigation

## Project Structure

```
lib/
├── core/                    # Core utilities and constants
├── features/               # Feature-based modules
│   ├── deposits/          # Deposit management
│   ├── notifications/     # Notification handling
│   └── ocr/              # OCR functionality
└── shared/               # Shared components
    └── presentation/     # Common UI components
```

## Getting Started

### Prerequisites

- Flutter SDK (>=3.10.0)
- Dart SDK (>=3.0.0)
- Android Studio / Xcode
- Firebase project

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd deposits_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Set up Firebase**
   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com)
   - Enable Authentication, Firestore, Storage, and Cloud Messaging
   - Download configuration files:
     - `google-services.json` for Android (place in `android/app/`)
     - `GoogleService-Info.plist` for iOS (place in `ios/Runner/`)
   - Run FlutterFire CLI to configure:
     ```bash
     flutterfire configure
     ```

4. **Generate code**
   ```bash
   flutter packages pub run build_runner build
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

## Development Status

### ✅ Completed
- [x] Project setup and folder structure
- [x] Basic routing and navigation
- [x] Theme configuration
- [x] Domain models (Deposit entity)
- [x] Repository interfaces

### 🔄 In Progress
- [ ] Clarification questions (awaiting user responses)
- [ ] Hive local storage implementation

### 📋 Pending
- [ ] Deposit form with validation
- [ ] OCR integration
- [ ] Chain linking logic
- [ ] Dashboard implementation
- [ ] Notifications
- [ ] Security features
- [ ] Firebase sync
- [ ] Testing

## Architecture

The app follows Clean Architecture principles with:

- **Domain Layer**: Entities, repositories, use cases
- **Data Layer**: Repository implementations, data sources
- **Presentation Layer**: UI, state management, routing

### Key Design Decisions

- **Offline-first**: All data stored locally, synced to cloud when online
- **Lineage tracking**: Deposits can be linked to show reinvestment chains
- **Security**: Sensitive data encrypted, app lock protection
- **OCR**: On-device text recognition for privacy

## Contributing

1. Follow the existing code structure
2. Write tests for new features
3. Update documentation
4. Follow Flutter/Dart style guidelines

## License

This project is private and proprietary.

## Support

For questions or issues, please contact the development team.
