import '../../core/utils/paging.dart';
import '../models/entities/media_item.dart';
import '../sources/media_cache.dart';
import '../sources/media_remote_source.dart';
import 'media_repository.dart';

/// Implementation of media repository combining remote and cache
class MediaRepositoryImpl implements MediaRepository {
  const MediaRepositoryImpl(
    this._remoteSource,
    this._cache,
  );

  final MediaRemoteSource _remoteSource;
  final MediaCache _cache;

  @override
  Future<PaginationResult<MediaItem>> fetchPage({
    String query = '',
    required PageParams pageParams,
  }) async {
    final cacheKey = '${query.trim()}|${pageParams.page}';

    // Try to read from cache first
    final cached = await _cache.readResults(cacheKey);
    if (cached != null) {
      return PaginationResult(
        items: cached.$1,
        hasMore: cached.$2,
      );
    }

    try {
      // Fetch from remote source
      final result = query.isEmpty
          ? await _remoteSource.curated(pageParams: pageParams)
          : await _remoteSource.search(
              query: query,
              pageParams: pageParams,
            );

      // Cache the result
      await _cache.writeResults(
        key: cacheKey,
        items: result.items,
        hasMore: result.hasMore,
      );

      return result;
    } catch (e) {
      // On network failure, try to return stale cache from previous pages
      if (pageParams.page > 1) {
        final staleKey = '${query.trim()}|${pageParams.page - 1}';
        final stale = await _cache.readResults(staleKey);
        if (stale != null) {
          return PaginationResult(
            items: stale.$1,
            hasMore: false, // Mark as no more pages since we're offline
          );
        }
      }
      rethrow;
    }
  }
}
