# NoteAura ✨

**NoteAura** is a modern Flutter application for creating and managing personal notes in a clean, elegant, and user-friendly way.

The app is designed with a soft modern UI, beautiful gradient colors, and simple authentication options to make writing and organizing notes feel easy and enjoyable.

---

## 📱 App Overview

NoteAura helps users keep their thoughts, ideas, reminders, and personal notes in one simple place.

The app includes authentication screens, a custom app icon, a native splash screen, and support for Firebase Authentication.

---

## ✨ Features

* Modern Flutter UI
* Custom app icon
* Native splash screen
* Email and password authentication
* Google Sign-In
* Facebook Sign-In setup
* Firebase integration
* Clean login and signup flow
* Personal notes management
* Responsive and mobile-friendly design

---

## 🎨 Design Style

NoteAura uses a soft and modern color palette inspired by:

* Blue
* Purple
* Pink
* Light pastel backgrounds
* Rounded cards and inputs
* Clean spacing
* Minimal and elegant UI components

The design focuses on simplicity, calmness, and a friendly personal-notes experience.

---

## 🛠️ Tech Stack

* **Flutter**
* **Dart**
* **Firebase Core**
* **Firebase Authentication**
* **Google Sign-In**
* **Facebook Auth**
* **flutter_launcher_icons**
* **flutter_native_splash**

---

## 📂 Project Structure

```text
lib/
├── main.dart
├── screens/
│   ├── splash_screen.dart
│   ├── login_screen.dart
│   └── signup_screen.dart
├── services/
│   └── auth_service.dart
└── widgets/
    └── reusable UI components
```

```text
assets/
└── icons/
    └── app_icon.png
```

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/your-username/noteaura.git
cd noteaura
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Run the app

```bash
flutter run
```

---

## 🔥 Firebase Setup

This project uses Firebase Authentication.

To connect Firebase:

1. Create a Firebase project.
2. Add an Android app using your app package name.
3. Download the `google-services.json` file.
4. Place it inside:

```text
android/app/google-services.json
```

5. Enable the required authentication providers from Firebase Console:

```text
Authentication > Sign-in method
```

Enable:

* Email/Password
* Google
* Facebook

---

## 🔐 Google Sign-In Setup

To use Google Sign-In:

1. Enable Google provider in Firebase Authentication.
2. Add your SHA-1 fingerprint to Firebase.
3. Download the updated `google-services.json`.
4. Replace the old file in:

```text
android/app/google-services.json
```

To get SHA-1:

```bash
cd android
./gradlew signingReport
```

On Windows PowerShell:

```bash
cd android
.\gradlew signingReport
```

---

## 📘 Facebook Login Setup

To use Facebook Login:

1. Create an app from Meta for Developers.
2. Enable Facebook Login.
3. Copy the Facebook App ID and Client Token.
4. Add them to:

```text
android/app/src/main/res/values/strings.xml
```

Example:

```xml
<resources>
    <string name="app_name">NoteAura</string>
    <string name="facebook_app_id">YOUR_FACEBOOK_APP_ID</string>
    <string name="fb_login_protocol_scheme">fbYOUR_FACEBOOK_APP_ID</string>
    <string name="facebook_client_token">YOUR_FACEBOOK_CLIENT_TOKEN</string>
</resources>
```

5. Enable Facebook provider in Firebase Authentication.
6. Add the Facebook App ID and App Secret in Firebase Console.

---

## 🖼️ App Icon

The app icon is generated using:

```text
flutter_launcher_icons
```

Configuration is located in `pubspec.yaml`:

```yaml
flutter_launcher_icons:
  android: true
  ios: true
  image_path: "assets/icons/app_icon.png"
  adaptive_icon_background: "#3B5BFF"
  adaptive_icon_foreground: "assets/icons/app_icon.png"
```

To regenerate the icon:

```bash
dart run flutter_launcher_icons
```

---

## 🌅 Native Splash Screen

The native splash screen is generated using:

```text
flutter_native_splash
```

Configuration is located in `pubspec.yaml`:

```yaml
flutter_native_splash:
  color: "#F7F8FF"
  image: assets/icons/app_icon.png

  android_12:
    color: "#F7F8FF"
    image: assets/icons/app_icon.png

  android: true
  ios: true
  web: false
```

To regenerate the splash screen:

```bash
dart run flutter_native_splash:create
```

---

## 📦 Main Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.8
  firebase_core: ^4.10.0
  firebase_auth: ^6.5.3
  google_sign_in: latest
  flutter_facebook_auth: latest
```

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter

  flutter_lints: ^6.0.0
  flutter_launcher_icons: ^0.14.4
  flutter_native_splash: ^2.4.7
```

---

## 🧪 Useful Commands

Clean project:

```bash
flutter clean
```

Get packages:

```bash
flutter pub get
```

Run app:

```bash
flutter run
```

Generate app icons:

```bash
dart run flutter_launcher_icons
```

Generate splash screen:

```bash
dart run flutter_native_splash:create
```

---

## 📌 Notes

* Make sure `assets/icons/app_icon.png` exists before generating icons or splash screen.
* After changing the app icon, uninstall the app from the device and install it again.
* After changing assets in `pubspec.yaml`, run:

```bash
flutter clean
flutter pub get
flutter run
```

---

## 👩‍💻 Author

Created by **Sara Omar**

---

## 📄 License

This project is for personal learning and development.
