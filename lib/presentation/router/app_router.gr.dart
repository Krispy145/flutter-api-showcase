// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    MediaDetailRoute.name: (routeData) {
      final args = routeData.argsAs<MediaDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MediaDetailPage(
          key: args.key,
          item: args.item,
        ),
      );
    },
    MediaListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MediaListPage(),
      );
    },
  };
}

/// generated route for
/// [MediaDetailPage]
class MediaDetailRoute extends PageRouteInfo<MediaDetailRouteArgs> {
  MediaDetailRoute({
    Key? key,
    required MediaItem item,
    List<PageRouteInfo>? children,
  }) : super(
          MediaDetailRoute.name,
          args: MediaDetailRouteArgs(
            key: key,
            item: item,
          ),
          initialChildren: children,
        );

  static const String name = 'MediaDetailRoute';

  static const PageInfo<MediaDetailRouteArgs> page =
      PageInfo<MediaDetailRouteArgs>(name);
}

class MediaDetailRouteArgs {
  const MediaDetailRouteArgs({
    this.key,
    required this.item,
  });

  final Key? key;

  final MediaItem item;

  @override
  String toString() {
    return 'MediaDetailRouteArgs{key: $key, item: $item}';
  }
}

/// generated route for
/// [MediaListPage]
class MediaListRoute extends PageRouteInfo<void> {
  const MediaListRoute({List<PageRouteInfo>? children})
      : super(
          MediaListRoute.name,
          initialChildren: children,
        );

  static const String name = 'MediaListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
