# Order Insights Dashboard

## Project Overview
A Flutter application that provides insights into order metrics and trends, developed for the FlapKap Flutter Challenge.

## Features
- Display total order count
- Calculate average order value
- Show number of returns
- Visualize order trends over time

## Building the Project

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / VS Code with Flutter extensions

### Setup Steps
1. Clone the repository
2. Run `flutter pub get`
3. Run `flutter pub run build_runner build`
4. Connect a device or start an emulator
5. Run `flutter run` to start the app

## Architecture: Clean Architecture

### Justification
- **Separation of Concerns**: Divides the project into layers (presentation, domain, data)
- **Testability**: Easy to write unit tests for each layer
- **Scalability**: Modular design allows easy feature additions
- **Dependency Rule**: Inner layers are independent of outer layers

## Libraries Used
- Provider for state management
- fl_chart for data visualization
- get_it for dependency injection
- equatable for equality comparison

## Challenge Notes
Implemented as per FlapKap Flutter Challenge requirements:
- Two screens: Metrics and Order Trends
- JSON data parsing
- User-friendly design