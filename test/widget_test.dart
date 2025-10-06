import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:api_showcase/presentation/app.dart';
import 'package:api_showcase/core/config/flavor.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App(flavor: Flavor.dev));

    // Verify that the app loads
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
