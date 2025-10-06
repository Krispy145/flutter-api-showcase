import '../../core/utils/paging.dart';
import '../models/entities/media_item.dart';

/// Abstract interface for media repository
abstract class MediaRepository {
  Future<PaginationResult<MediaItem>> fetchPage({
    String query = '',
    required PageParams pageParams,
  });
}
