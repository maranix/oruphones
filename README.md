# OruPhones App

OruPhones is a mobile application built using Flutter and Dart, designed to showcase mobile devices available for sale. Users can browse through various phone listings, apply filters, and search for specific models. The app utilizes Firebase Cloud Messaging (FCM) for push notifications.

## Tech Stack

- Flutter
- Dart
- Firebase Cloud Messaging (FCM)

## Project Description

OruPhones is a mobile app that allows users to explore a wide range of mobile devices available for sale. It provides a user-friendly interface for browsing through phone listings, applying filters based on make, condition, storage, and RAM, and searching for specific models.

## Project Structure

```
- lib/
  - data/
    - model/
    - repository/
  - features/
    - home/
    - app/
  - presentation/
    - widgets/
  - ui/
    - padding.dart
  - utils/
```

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
5. Install flutterfire_cli and Setup firebase_tools using the official documentation and configure the project following the official guide from [Here](https://firebase.google.com/docs/flutter/setup?platform=ios#available-plugins)
6. Install project dependencies: `flutter pub get`
7. Run the project on your preferred device or emulator: `flutter run`

## Bugs
Filter doesn't work, didn't have enough time to implement it.
Background Notifications and redirection is working but if the application is in foreground then the user is automatically navigated to Notifications screen. I know the reason but don't have enough time to fix this issue.

## License

This project is licensed under the MIT License.

## Contact

For any inquiries or questions, you can contact the project maintainers at ramanverma4183@gmail.com.

## Acknowledgments

- Flutter and Dart communities for providing excellent documentation and support.
- The Equatable package for simplifying value comparison in Dart.
- The Firebase Messaging package for handling push notifications.