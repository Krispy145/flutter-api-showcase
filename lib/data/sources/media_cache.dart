import 'package:hive/hive.dart';
import '../models/entities/media_item.dart';

/// Abstract interface for media cache
abstract class MediaCache {
  Future<void> writeResults({
    required String key,
    required List<MediaItem> items,
    required bool hasMore,
  });

  Future<(List<MediaItem> items, bool hasMore)?> readResults(String key);

  Future<void> clear();
}

/// Hive implementation of media cache
class HiveMediaCache implements MediaCache {
  const HiveMediaCache();

  static const String _boxName = 'media_cache';
  static const String _hasMoreKey = '_hasMore';

  Future<Box<Map>> get _box async => await Hive.openBox<Map>(_boxName);

  @override
  Future<void> writeResults({
    required String key,
    required List<MediaItem> items,
    required bool hasMore,
  }) async {
    try {
      final box = await _box;
      final data = {
        'items': items
            .map((item) => MediaItemMapper.ensureInitialized().encodeMap(item))
            .toList(),
        _hasMoreKey: hasMore,
      };
      await box.put(key, data);
    } catch (e) {
      // Cache write failure shouldn't break the app
      // Log error but don't throw
    }
  }

  @override
  Future<(List<MediaItem> items, bool hasMore)?> readResults(String key) async {
    try {
      final box = await _box;
      final data = box.get(key);

      if (data == null) return null;

      final itemsJson = data['items'] as List? ?? [];
      final items = itemsJson
          .cast<Map<String, dynamic>>()
          .map((json) => MediaItemMapper.fromMap(json))
          .toList();

      final hasMore = data[_hasMoreKey] as bool? ?? false;

      return (items, hasMore);
    } catch (e) {
      // Cache read failure shouldn't break the app
      return null;
    }
  }

  @override
  Future<void> clear() async {
    try {
      final box = await _box;
      await box.clear();
    } catch (e) {
      // Cache clear failure shouldn't break the app
    }
  }
}

/// In-memory fallback implementation of media cache
class InMemoryMediaCache implements MediaCache {
  InMemoryMediaCache();

  final Map<String, (List<MediaItem> items, bool hasMore)> _cache = {};

  @override
  Future<void> writeResults({
    required String key,
    required List<MediaItem> items,
    required bool hasMore,
  }) async {
    _cache[key] = (items, hasMore);
  }

  @override
  Future<(List<MediaItem> items, bool hasMore)?> readResults(String key) async {
    return _cache[key];
  }

  @override
  Future<void> clear() async {
    _cache.clear();
  }
}
