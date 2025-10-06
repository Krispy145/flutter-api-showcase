import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../data/models/entities/media_item.dart';
import '../../features/media/presentation/pages/media_detail_page.dart';
import '../../features/media/presentation/pages/media_list_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MediaListRoute.page,
          path: '/',
          initial: true,
        ),
        AutoRoute(
          page: MediaDetailRoute.page,
          path: '/detail',
        ),
      ];
}
