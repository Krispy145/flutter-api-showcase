import '../dto/video_dto.dart';
import '../entities/media_item.dart';

/// Mapper for converting VideoDto to MediaItem
class VideoMapper {
  static MediaItem toEntity(VideoDto dto) {
    // Find the best quality video file
    final bestQuality = dto.videoFiles
            .where((file) => file.quality == 'hd' || file.quality == 'sd')
            .firstOrNull ??
        dto.videoFiles.first;

    return MediaItem(
      id: dto.id.toString(),
      type: MediaType.video,
      thumbnailUrl: bestQuality.link, // Use video link as thumbnail for now
      displayUrl: bestQuality.link,
      author: 'Unknown', // Pexels videos don't have photographer field
      width: dto.width,
      height: dto.height,
    );
  }
}
