import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/config/flavor.dart';
import '../core/di/di.dart';
import '../features/media/presentation/bloc/media_bloc.dart';
import 'theme/app_theme.dart';

/// Main application widget
class App extends StatelessWidget {
  const App({super.key, required this.flavor});

  final Flavor flavor;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MediaBloc()),
      ],
      child: MaterialApp.router(
        title: 'API Showcase',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: getIt.router.config(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
