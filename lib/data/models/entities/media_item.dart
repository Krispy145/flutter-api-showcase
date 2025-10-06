import 'package:dart_mappable/dart_mappable.dart';

part 'media_item.mapper.dart';

/// Media type enum
@MappableEnum()
enum MediaType {
  image,
  video,
}

/// Media item entity representing a photo or video
@MappableClass()
class MediaItem with MediaItemMappable {
  const MediaItem({
    required this.id,
    required this.type,
    required this.thumbnailUrl,
    required this.displayUrl,
    required this.author,
    required this.width,
    required this.height,
  });

  final String id;
  final MediaType type;
  final String thumbnailUrl;
  final String displayUrl;
  final String author;
  final int width;
  final int height;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MediaItem && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
