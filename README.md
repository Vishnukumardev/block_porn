# Block Porn 🛡️

A mobile application to block pornographic content on Android devices, providing a safe browsing experience for users and families.

## 📱 Overview

**Block Porn** is a comprehensive content filtering application built with Flutter that helps users maintain a clean and safe browsing environment. Whether you're a parent protecting your children, an individual seeking to avoid distractions, or an organization managing network safety, Block Porn provides robust content filtering capabilities.

## ✨ Features

- **🔒 Content Filtering** - Intelligent detection and blocking of adult content
- **👥 Multi-Profile Support** - Create and manage multiple user profiles with different restrictions
- **📊 Activity Leaderboard** - Track and monitor browsing statistics
- **🎨 User-Friendly Interface** - Clean, intuitive UI built with Material Design
- **🌐 Multi-Language Support** - Internationalization (i18n) support for multiple languages
- **🔐 Secure Authentication** - User authentication with persistent sessions
- **📈 Usage Analytics** - Monitor and analyze content filtering effectiveness
- **🎯 Customizable Rules** - Fine-tune filtering preferences per profile

## 🏗️ Architecture

This project follows **Clean Architecture** principles with clear separation of concerns:

```
lib/
├── src/
│   ├── core/              # Core utilities and shared functionality
│   │   ├── helper/        # Helper utilities
│   │   ├── observer/      # BLoC observers
│   │   ├── router/        # Navigation routing
│   │   ├── styles/        # App themes and styles
│   │   ├── translations/  # i18n translations
│   │   └── utils/         # Common utilities
│   ├── features/          # Feature modules
│   │   ├── authentication/
│   │   ├── home/
│   │   ├── leaderboard/
│   │   └── profile/
│   └── shared/            # Shared widgets and components
├── main.dart              # App entry point
└── injection.dart         # Dependency injection setup
```

### Design Patterns

- **BLoC Pattern** - State management using flutter_bloc
- **Dependency Injection** - Using get_it for IoC container
- **Repository Pattern** - Data layer abstraction with repository classes
- **Freezed** - Code generation for immutable models

## 🛠️ Tech Stack

### Framework & Language
- **Flutter** - Cross-platform mobile development
- **Dart** 3.10.0+

### State Management
- `flutter_bloc` (9.1.1) - Reactive state management
- `bloc_lint` - Linter for BLoC code

### Networking & Data
- `dio` (5.9.2) - HTTP client
- `shared_preferences` (2.5.4) - Local data persistence
- `json_serializable` (6.13.0) - JSON serialization

### Code Generation
- `freezed` (3.2.5) - Immutable model generation
- `auto_route` (11.1.0) - Route generation
- `build_runner` (2.13.1) - Code generation runner

### Localization
- `intl` (0.20.2) - Internationalization support
- `flutter_localizations` - Flutter i18n

### UI
- `flutter_svg` (2.2.4) - SVG asset support
- `cupertino_icons` (1.0.8) - iOS-style icons

### Development Tools
- `flutter_lints` (6.0.0) - Lint rules
- `equatable` (2.0.8) - Value equality

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK** - Version 3.10.0 or higher
- **Dart SDK** - Version 3.10.0 or higher (included with Flutter)
- **Android SDK** - For Android development
- **Java Development Kit (JDK)** - Version 11 or higher
- **Git** - For version control

## 📁 Project Structure

- **lib/** - Main application code
  - **src/core/** - Core application functionality
  - **src/features/** - Feature modules with their own BLoCs and UIs
  - **src/shared/** - Reusable widgets and components
  - **generated/** - Auto-generated code (routes, localizations, etc.)
  - **l10n/** - Localization files
  - **injection.dart** - Service locator configuration

- **assets/** - Static assets
  - **images/** - PNG and other image formats
  - **svg/** - SVG vector graphics
  - **fonts/** - Custom fonts
  - **sounds/** - Audio files

- **android/** - Android-specific code
- **ios/** - iOS-specific code (if applicable)
- **test/** - Widget tests

## 🔧 Configuration

### Localization

Add new languages in `lib/src/core/translations/` by creating `.arb` files:

```
lib/src/core/translations/
├── arb/
│   ├── app_en.arb
│   ├── app_es.arb
│   └── app_fr.arb
```

### Routing

Routes are defined using `auto_route`. Add new routes in the routing configuration and regenerate:

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Please follow these guidelines:

1. Fork the repository
2. Create your feature branch
3. Ensure code quality and tests pass
4. Submit a pull request with clear description

## 📞 Support

For issues, questions, or suggestions, please open an issue on the [GitHub repository](https://github.com/Vishnukumardev/block_porn/issues).

---

**Built with ❤️ using Flutter**