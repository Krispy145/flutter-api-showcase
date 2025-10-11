# Flutter Api Showcase

Flutter API client patterns: BLoC, Dio, pagination, caching; integrates flutter-iam-package.

---

## 📈 Status

- **Status:** planned (Planned)
- **Focus:** Flutter API client patterns: BLoC, Dio, pagination, caching; integrates flutter-iam-package.
- **Last updated:** 11/10/2025
- **Target completion:** 27/10/2025

---

## 🔑 Highlights

- **Cross-platform** → Android, iOS, Web support
- **State Management** → Riverpod/GetIt for reactive updates
- **Dependency Injection** → Clean architecture with GetIt
- **Type Safety** → dart_mappable for data modeling
- **Networking** → Dio with interceptors and error handling
- **CI/CD** → GitHub Actions + Shorebird OTA updates
- **Testing** → Unit, widget, and golden tests

---

## 🏗 Architecture Overview

```
lib/
 ├─ core/           # DI, error handling, networking
 ├─ data/           # DTOs, entities, sources, repositories
 ├─ features/       # feature modules (providers, pages, widgets)
 └─ presentation/   # app shell, router, theme
```

**Patterns used:**

- **Repository pattern** → clean separation between UI and data
- **Riverpod/GetIt** → reactive state management and dependency injection
- **dart_mappable** → type-safe data modeling
- **Dio** → HTTP client with interceptors and error handling

---

## 📱 What It Demonstrates

- Cross-platform mobile app development with Flutter
- Clean architecture patterns and state management
- API integration and data persistence
- Modern Flutter development practices and tooling

---

## 🚀 Getting Started

```bash
git clone https://github.com/Krispy145/flutter-api-showcase.git
cd flutter-api-showcase
flutter pub get
```

**Run (Dev):**
```bash
flutter run --flavor dev
```

**Run (Prod):**
```bash
flutter run --flavor prod
```

**Codegen:**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## 🧪 Testing

```bash
flutter test --coverage
```

- Unit → repositories, services
- Widget → UI components and interactions
- Golden → visual regression tests

---

## 🔒 Security & Next Steps

- Follow security best practices for the technology stack
- Implement proper authentication and authorization
- Add comprehensive error handling and validation
- Set up monitoring and logging

---

## 🗓 Roadmap

| Milestone                    | Category              | Target Date | Status     |
| ---------------------------- | --------------------- | ----------- | ---------- |
| Pexels/API patterns setup | Flutter App & Packages | 20/10/2025 | ⏳ In Progress |
| Offline caching + pagination | Flutter App & Packages | 24/10/2025 | ⏳ In Progress |
| Secure AI API integration | Flutter App & Packages | 27/10/2025 | ⏳ In Progress |
| Flutter IAM integration | Flutter App & Packages | 31/10/2025 | ⏳ In Progress |


---

## 📄 License

MIT © Krispy145