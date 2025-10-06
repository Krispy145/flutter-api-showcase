import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../data/repositories/media_repository.dart';
import '../../data/repositories/media_repository_impl.dart';
import '../../data/sources/media_cache.dart';
import '../../data/sources/media_remote_source.dart';
import '../../presentation/router/app_router.dart';
import '../config/flavor.dart';
import '../network/http_client.dart';

/// Global GetIt instance
final getIt = GetIt.instance;

/// Configures all dependencies for the application
Future<void> configureDependencies(Flavor flavor) async {
  // Network
  final dio = HttpClientFactory.create();
  getIt.registerLazySingleton<Dio>(() => dio);

  // Data sources
  getIt.registerLazySingleton<MediaRemoteSource>(() => MediaRemoteSourceHttp(getIt<Dio>()));
  getIt.registerLazySingleton<MediaCache>(HiveMediaCache.new);

  // Repository
  getIt.registerLazySingleton<MediaRepository>(() => MediaRepositoryImpl(getIt<MediaRemoteSource>(), getIt<MediaCache>()));

  // Router
  getIt.registerLazySingleton<AppRouter>(AppRouter.new);
}

/// Extension for easy access to router
extension AppRouterExtension on GetIt {
  AppRouter get router => get<AppRouter>();
}
