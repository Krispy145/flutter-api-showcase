import '../dto/photo_dto.dart';
import '../entities/media_item.dart';

/// Mapper for converting PhotoDto to MediaItem
class PhotoMapper {
  static MediaItem toEntity(PhotoDto dto) {
    return MediaItem(
      id: dto.id.toString(),
      type: MediaType.image,
      thumbnailUrl: dto.src.medium,
      displayUrl: dto.src.large,
      author: dto.photographer,
      width: dto.width,
      height: dto.height,
    );
  }
}
