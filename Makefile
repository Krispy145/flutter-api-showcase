.PHONY: gen watch test analyze run-dev run-prod

gen:
	flutter pub run build_runner build --delete-conflicting-outputs

watch:
	flutter pub run build_runner watch --delete-conflicting-outputs

test:
	flutter test --coverage

analyze:
	flutter analyze

run-dev:
	flutter run -t lib/main_dev.dart --flavor dev --dart-define=APP_NAME="API Showcase" --dart-define=PEXELS_BASE_URL="https://api.pexels.com" --dart-define=PEXELS_API_KEY=""

run-prod:
	flutter run -t lib/main_prod.dart --flavor prod --dart-define=APP_NAME="API Showcase" --dart-define=PEXELS_BASE_URL="https://api.pexels.com" --dart-define=PEXELS_API_KEY=""
