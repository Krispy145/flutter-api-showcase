import 'package:dart_mappable/dart_mappable.dart';

part 'photo_dto.mapper.dart';

/// Pexels photo DTO
@MappableClass()
class PhotoDto with PhotoDtoMappable {
  const PhotoDto({
    required this.id,
    required this.width,
    required this.height,
    required this.photographer,
    required this.src,
  });

  final int id;
  final int width;
  final int height;
  final String photographer;
  final PhotoSrcDto src;
}

/// Pexels photo source URLs DTO
@MappableClass()
class PhotoSrcDto with PhotoSrcDtoMappable {
  const PhotoSrcDto({
    required this.original,
    required this.large,
    required this.medium,
    required this.small,
  });

  final String original;
  final String large;
  final String medium;
  final String small;
}
