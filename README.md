# AfasiaApp

A comprehensive Flutter application designed for speech therapy and aphasia treatment on tablet devices.

## 📋 Table of Contents
- [Description](#description)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Technologies](#technologies)
- [Contributing](#contributing)
- [License](#license)

## 📖 Description

AfasiaApp is a specialized mobile application developed for tablets, designed to assist in speech therapy and aphasia treatment. This project was created as part of a Civil Computer Engineering degree program and focuses on providing interactive activities to help patients with language disorders improve their communication skills.

The application includes various therapeutic activities such as:
- **Reading Comprehension**: Interactive exercises to improve reading skills
- **Object Nomination**: Activities to help patients identify and name objects
- **Action Nomination**: Exercises focused on recognizing and naming actions
- **Audio Recording**: Capability to record and playback speech for therapy sessions
- **Progress Tracking**: Monitor patient progress through different activities

## ✨ Features

- 🎯 **Targeted Therapy Activities**: Specialized exercises for different aspects of language recovery
- 🎵 **Audio Integration**: Record, playback, and manage audio files for speech therapy
- 📱 **Tablet-Optimized UI**: Designed specifically for tablet devices with intuitive touch interfaces
- 📊 **Progress Tracking**: Monitor and save patient progress
- 🎨 **Interactive Elements**: Engaging visual components including color pickers and sliders
- 📷 **Image Handling**: Support for image selection and manipulation
- 💾 **Local Storage**: SQLite database for offline data management

## 🔧 Prerequisites

Before you begin, ensure you have the following installed:

### Using FVM (Flutter Version Management) - Recommended

1. **Install FVM** (if not already installed):
   ```bash
   # Using pub
   dart pub global activate fvm
   
   # Or using Homebrew (macOS)
   brew tap leoafarias/fvm
   brew install fvm
   ```

2. **Install the required Flutter version**:
   ```bash
   fvm install 2.8.1
   fvm use 2.8.1
   ```

### Alternative: Direct Flutter Installation

- [Flutter SDK 2.8.1](https://flutter.dev/docs/get-started/install)
- [Dart SDK 2.15.1](https://dart.dev/get-dart)
- Android Studio or VS Code with Flutter extensions
- Android SDK (for Android development)
- Xcode (for iOS development, macOS only)

### Device Requirements

- Android device/emulator (API level 16+)
- iOS device/simulator (iOS 9.0+)
- **Recommended**: Tablet device for optimal user experience

## 🚀 Installation

### Step 1: Clone the Repository
```bash
git clone https://github.com/asanchezRay/afasiaApp.git
cd afasiaApp
```

### Step 2: Set Up Flutter Version (Using FVM)
```bash
# If using FVM
fvm use 2.8.1

# Verify the Flutter version
fvm flutter --version
```

### Step 3: Install Dependencies
```bash
# Using FVM
fvm flutter pub get

# Or without FVM
flutter pub get
```

### Step 4: Verify Device Connection
```bash
# Using FVM
fvm flutter devices

# Or without FVM
flutter devices
```

### Step 5: Run the Application
```bash
# For development/debugging (using FVM)
fvm flutter run

# Or without FVM
flutter run

# For release build
fvm flutter build apk --release
```

## 📱 Usage

### Running in Development Mode
```bash
# Start the app in debug mode
fvm flutter run

# Run with specific device
fvm flutter run -d <device-id>

# Run in release mode
fvm flutter run --release
```

### Building for Production
```bash
# Build APK for Android
fvm flutter build apk --release

# Build App Bundle for Google Play Store
fvm flutter build appbundle --release

# Build for iOS (macOS only)
fvm flutter build ios --release
```

## 📁 Project Structure

```
afasiaApp/
├── android/                 # Android-specific files
├── assets/                  # Application assets
│   ├── audio/              # Audio files for therapy
│   ├── icons/              # App icons
│   └── images/             # Images used in activities
├── ios/                    # iOS-specific files
├── lib/                    # Main application code
│   ├── Screens/            # UI screens and pages
│   │   ├── Activities/     # Therapy activity screens
│   │   │   ├── Lectura/   # Reading activities
│   │   │   └── ...        # Other activity types
│   │   └── Welcome/       # Welcome and onboarding
│   ├── components/         # Reusable UI components
│   ├── database/          # SQLite database management
│   ├── constants.dart     # App constants and configurations
│   └── main.dart          # Application entry point
├── pubspec.yaml           # Dependencies and project configuration
└── README.md             # This file
```

## 🛠 Technologies

### Core Framework
- **Flutter**: 2.8.1 - UI framework for cross-platform development
- **Dart**: 2.15.1 - Programming language

### Key Dependencies
- **sqflite**: ^1.3.0 - SQLite database for local storage
- **flutter_sound**: ^2.0.3 - Audio recording and playback
- **image_picker**: ^0.8.0+4 - Image selection functionality
- **http**: ^0.13.1 - Network requests
- **get**: ^3.24.0 - State management and navigation
- **flutter_localizations** - Internationalization support

### UI Components
- **syncfusion_flutter_sliders**: ^18.4.35-beta - Interactive sliders
- **flutter_colorpicker**: ^0.3.5 - Color selection tools
- **flutter_spinkit**: ^4.1.2 - Loading animations
- **badges**: ^1.1.6 - UI badges and indicators

### Utilities
- **permission_handler**: ^5.0.1+1 - Device permissions management
- **path_provider**: ^2.0.2 - File system access
- **screenshot**: ^0.3.0 - Screen capture functionality
- **flutter_phoenix**: ^1.0.0 - App restart capability

## 🤝 Contributing

We welcome contributions to improve AfasiaApp! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Development Guidelines
- Follow Flutter/Dart coding conventions
- Add comments for complex logic
- Test your changes on both Android and iOS
- Update documentation as needed

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Support

If you encounter any issues or have questions:

1. Check the [Issues](https://github.com/asanchezRay/afasiaApp/issues) page
2. Create a new issue with detailed information
3. Contact the development team
