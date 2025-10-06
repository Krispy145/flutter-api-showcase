# API Showcase

A Flutter media browser built to demonstrate how I design **production-grade API clients** with modern architecture, state management, caching, and CI/CD.

This project complements my **AI Chat (RAG)** repo by showing a different domain and stack:

- **AI Chat (RAG)** → AI + streaming (Riverpod)
- **API Showcase** → API integration + pagination + BLoC

Together, they highlight my **range and versatility in Flutter**, both frontend and backend-aligned.

---

## 📈 Status

- **Status:** scaffolded (initial setup complete)
- **Focus:** Flutter architecture, data flow, caching, and secure API patterns
- **Last updated:** 06/10/2025
- **Upcoming integration:** Secure AI API (as backend source)

---

## 🔑 Highlights

- **Media Browser:** Image & video search using the [Pexels API](https://www.pexels.com/api/)
- **State Management:** BLoC + Cubit for predictable state flows
- **Navigation:** Auto Route for typed navigation
- **Dependency Injection:** GetIt with flavor-based graph setup
- **Data Models:** dart_mappable for typed DTOs/entities
- **Networking:** Dio with interceptors (auth, retries, logging)
- **Offline-first:** Hive caching with stale data fallback
- **Pagination:** Infinite scroll + pull-to-refresh
- **CI/CD:** GitHub Actions + Shorebird-ready OTA updates
- **Flavors:** Dev/Prod builds via `--dart-define`

---

## 🏗 Architecture Overview

Feature-first architecture with clean separation of concerns:

```
lib/
 ├─ core/            # env, di, error, networking, utils
 ├─ data/            # dto, entities, sources, repositories
 ├─ features/media/  # bloc, pages, widgets
 └─ presentation/    # app shell, router, theme
```

**Patterns used:**

- `Repository` combines remote & cache sources
- `Source` layer uses Dio for API + Hive for persistence
- `BLoC` drives all UI events → states
- `auto_route` for navigation
- `dart_mappable` for codegen DTOs

---

## 📱 What It Demonstrates

- Clean & modular Flutter API integration
- Offline-first and paginated list patterns
- Type-safe navigation and dependency graph setup
- Reusable architecture suitable for production-scale apps

---

## 🚀 Getting Started

```bash
git clone https://github.com/Krispy145/api_showcase.git
cd api_showcase
flutter pub get
```

**Run (Dev flavor):**

```bash
flutter run -t lib/main_dev.dart --flavor dev --dart-define=PEXELS_API_KEY=your-key
```

**Run (Prod flavor):**

```bash
flutter run -t lib/main_prod.dart --flavor prod --dart-define=PEXELS_API_KEY=your-key
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

- Unit tests → Repositories, API mapping
- Widget tests → Search + pagination
- Golden tests → Grid layout + error states

---

## 🔒 Security & Next Steps

- Follow secure API client patterns (no keys hard-coded, safe caching)
- Integrate with **Secure AI API** backend to demonstrate token-based access
- Add **Auth Interceptor** integration with `flutter_iam` package

---

## 🗓 Roadmap

| Milestone                    | Target Date | Status     |
| ---------------------------- | ----------- | ---------- |
| Scaffold repo                | 06/10/2025  | ✅ Done    |
| Pexels API integration       | 10/10/2025  | ⏳ Pending |
| Offline caching + pagination | 14/10/2025  | ⏳ Planned |
| Secure AI API integration    | 20/10/2025  | ⏳ Planned |
| Flutter IAM integration      | 27/10/2025  | ⏳ Planned |

---

## 📄 License

MIT © Krispy145
