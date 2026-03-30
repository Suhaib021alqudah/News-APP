

# News Explorer App 📰

A modern, fast, and feature-rich News Application built with **Flutter**. This app allows users to browse top headlines, search for specific topics, and filter news by categories with full multi-language support.

## 🚀 Features

  * **Top Headlines**: Real-time news fetched from the [NewsAPI](https://newsapi.org/).
  * **Search Functionality**: Search for any keyword globally in both Arabic and English.
  * **Category Filtering**: Quick access to news categories like Technology, Business, Entertainment, and Travel.
  * **Multi-language (Localization)**: Seamless switching between English and Arabic using `easy_localization`.
  * **Responsive UI**: Optimized for various screen sizes using `flutter_screenutil`.
  * **Image Caching**: Efficient image loading and caching using `cached_network_image`.

## 🛠 Tech Stack

  * **Framework**: Flutter.
  * **Networking**: [Dio](https://pub.dev/packages/dio) for robust API requests.
  * **Routing**: [GoRouter](https://pub.dev/packages/go_router) for declarative navigation.
  * **State Management**: `FutureBuilder` for direct UI-data binding.
  * **Localization**: `easy_localization`.
  * **Logging**: `pretty_dio_logger` for easy debugging of network calls.

## 📁 Project Structure

```text
lib/
├── core/
│   ├── network/          # ApiHelper & Endpoints
│   ├── routing/          # AppRoutes configuration
│   └── constant/         # Colors, Fonts, & API Keys
├── features/
│   ├── home/             # Home UI, Services, & Articles Logic
│   ├── result/           # Search results & ResultServices
│   └── details/          # Article details view
└── main.dart             # Application entry point
```

## ⚙️ Getting Started

### 1\. Prerequisites

  * Flutter SDK installed.
  * A valid API Key from [NewsAPI.org](https://newsapi.org/).

### 2\. Installation

Clone the repository and install dependencies:

```bash
flutter pub get
```

### 3\. Setup API Key

Navigate to `lib/core/constant/constant.dart` and insert your API key:

```dart
class AppConstant {
  static const String apiKey = 'YOUR_API_KEY_HERE';
}
```

### 4\. Run the App

```bash
flutter run
```



## 📸 Screenshots


### 🏠 Home Page

![Home](/HomeScreen.png)


## 📝 Important Notes

  * **Localization**: Make sure to add your translation JSON files in `assets/translations/` and register them in `pubspec.yaml`.
  * **API Limits**: The free tier of NewsAPI might have restrictions on requests from physical mobile devices (Production); use an emulator for the best testing experience.

-----

**Developed by:  Suhaib Alqudah** 
