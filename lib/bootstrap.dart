import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/config/flavor.dart';
import 'core/di/di.dart';
import 'presentation/app.dart';

/// Bootstrap the application
Future<void> bootstrap(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Register Hive adapters if needed
  // Hive.registerAdapter(MediaItemAdapter());
  // Hive.registerAdapter(MediaTypeAdapter());

  // Configure dependencies
  await configureDependencies(flavor);

  // Run the app
  runApp(App(flavor: flavor));
}
