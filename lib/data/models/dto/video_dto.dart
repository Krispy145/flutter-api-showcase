import 'package:dart_mappable/dart_mappable.dart';

part 'video_dto.mapper.dart';

/// Pexels video DTO
@MappableClass()
class VideoDto with VideoDtoMappable {
  const VideoDto({
    required this.id,
    required this.width,
    required this.height,
    required this.videoFiles,
  });

  final int id;
  final int width;
  final int height;
  final List<VideoFileDto> videoFiles;
}

/// Pexels video file DTO
@MappableClass()
class VideoFileDto with VideoFileDtoMappable {
  const VideoFileDto({
    required this.link,
    required this.quality,
  });

  final String link;
  final String quality;
}
