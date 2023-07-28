# OruPhones App

OruPhones is a mobile application built using Flutter and Dart, designed to showcase mobile devices available for sale. Users can browse through various phone listings, apply filters, and search for specific models. The app utilizes Firebase Cloud Messaging (FCM) for push notifications.

## Screenshots
<p align="center">
<image src="screenshots/1.png?raw=true" width=32% />
<image src="screenshots/2.png?raw=true" width=32%/>
</p>
<p align="center">
<image src="screenshots/3.png?raw=true" width=32%/>
<image src="screenshots/4.png?raw=true" width=32%/>
</p>

## Tech Stack

- Flutter 3.10
- Dart 3.0
- Firebase Cloud Messaging (FCM)

## Project Description

OruPhones is a mobile app that allows users to explore a wide range of mobile devices available for sale. It provides a user-friendly interface for browsing through phone listings, applying filters based on make, condition, storage, and RAM, and searching for specific models.

## Project Structure

```
src
├── app
│   ├── app.dart
│   └── services
│       └── notifications_service.dart
├── data
│   ├── model
│   │   ├── filters
│   │   ├── listing
│   │   ├── model.dart
│   │   └── search
│   └── repository
│       ├── assignment
│       ├── base.dart
│       └── repository.dart
├── features
│   ├── app
│   │   ├── app.dart
│   │   └── bloc
│   ├── features.dart
│   ├── home
│   │   ├── bloc
│   │   └── home.dart
│   ├── notifications
│   │   ├── bloc
│   │   └── notifications.dart
│   └── search
│       ├── bloc
│       └── search.dart
├── presentation
│   ├── home
│   │   ├── home.dart
│   │   ├── view
│   │   └── widgets
│   ├── notifications
│   │   ├── notifications.dart
│   │   └── view
│   ├── presentation.dart
│   ├── search
│   │   ├── search.dart
│   │   └── view
│   └── widgets
│       ├── buttons
│       ├── oru_appbar.dart
│       ├── oru_searchbar.dart
│       └── widgets.dart
├── ui
│   ├── colors.dart
│   ├── padding.dart
│   ├── theme.dart
│   └── ui.dart
└── utils
    ├── extensions
    │   ├── http_extensions.dart
    │   ├── list_extensions.dart
    │   └── uri_extensions.dart
    ├── result
    │   └── result.dart
    └── utils.dart
```

**Folders and Their Purpose:**

1. **app**: Contains core application files and services related to the app's functionalities.
   - `app.dart`: Main entry point of the application.
   - `services`: Folder containing the notification service (`notifications_service.dart`) for handling app notifications.

2. **data**: Manages data-related operations, including data models and repositories.
   - `model`: Holds data models related to filters, listings, and search.
   - `repository`: Contains repository classes that interact with data sources like APIs or databases.
   - `base.dart`: Base class/interface for repositories.

3. **features**: Organizes different feature modules of the application, each having its own bloc for state management.
   - `app`: Feature module for the app.
   - `home`: Feature module for the home screen.
   - `notifications`: Feature module for handling notifications.
   - `search`: Feature module for search functionality.

4. **presentation**: Handles the presentation layer of the application, including UI components and widgets organized by features.
   - `home`: UI components related to the home screen.
   - `notifications`: UI components related to notifications.
   - `search`: UI components related to search functionality.
   - `widgets`: Shared UI widgets used across different features.

5. **ui**: Contains files related to the user interface, such as color constants, padding constants, theme definitions, and UI-related constants.

6. **utils**: Contains utility files, including extensions and result-related functionality.
   - `extensions`: Holds Dart extension methods for various classes.
   - `result`: Defines classes related to result handling (e.g., success, failure).
   - `utils.dart`: Utility functions for general purposes.

## Architecture

The OruPhones app follows the BLoC (Business Logic Component) architecture, which separates the business logic from the UI layer. It utilizes the Equatable package for value comparison, and the Firebase Messaging package for handling push notifications.

## Design Decisions

- Used Flutter for cross-platform development to target both Android and iOS platforms.
- Implemented the BLoC architecture to manage the app's state and separate concerns effectively.
- Utilized Firebase Cloud Messaging (FCM) for push notification services.

## Setup Instructions

To run this project locally, follow these steps:

1. Clone the repository: `git clone https://github.com/maranix/oruphones`
2. Navigate to the project directory: `cd oruphones`
3. Ensure you have Flutter and Dart SDK installed. If not, you can download them from the official Flutter website.
4. Install flutterfire_cli and Setup firebase_tools using the official documentation and configure the project following the official guide from [Here](https://firebase.google.com/docs/flutter/setup?platform=ios#available-plugins)
5. Install project dependencies: `flutter pub get`
6. Run the project on your preferred device or emulator: `flutter run`

## License

This project is licensed under the MIT License.

## Contact

For any inquiries or questions, you can contact the project maintainers at ramanverma4183@gmail.com.

## Acknowledgments

- Flutter and Dart communities for providing excellent documentation and support.
- The Equatable package for simplifying value comparison in Dart.
- The Firebase Messaging package for handling push notifications.