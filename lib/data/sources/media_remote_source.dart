import 'package:dio/dio.dart';
import '../../core/utils/paging.dart';
import '../models/entities/media_item.dart';
import '../models/dto/photo_dto.dart';
import '../models/mappers/photo_mapper.dart';

/// Abstract interface for media remote data source
abstract class MediaRemoteSource {
  Future<PaginationResult<MediaItem>> search({
    required String query,
    required PageParams pageParams,
  });

  Future<PaginationResult<MediaItem>> curated({
    required PageParams pageParams,
  });
}

/// HTTP implementation of media remote data source
class MediaRemoteSourceHttp implements MediaRemoteSource {
  const MediaRemoteSourceHttp(this._dio);

  final Dio _dio;

  @override
  Future<PaginationResult<MediaItem>> search({
    required String query,
    required PageParams pageParams,
  }) async {
    try {
      final response = await _dio.get(
        '/v1/search',
        queryParameters: {
          'query': query,
          'page': pageParams.page,
          'per_page': pageParams.perPage,
        },
      );

      final data = response.data as Map<String, dynamic>;
      final photos =
          (data['photos'] as List? ?? []).cast<Map<String, dynamic>>();

      final items = photos
          .map((photo) => PhotoDtoMapper.fromMap(photo))
          .map(PhotoMapper.toEntity)
          .toList();

      final hasMore = photos.length == pageParams.perPage;

      return PaginationResult(
        items: items,
        hasMore: hasMore,
      );
    } on DioException catch (e) {
      throw Exception('Failed to search media: ${e.message}');
    }
  }

  @override
  Future<PaginationResult<MediaItem>> curated({
    required PageParams pageParams,
  }) async {
    try {
      final response = await _dio.get(
        '/v1/curated',
        queryParameters: {
          'page': pageParams.page,
          'per_page': pageParams.perPage,
        },
      );

      final data = response.data as Map<String, dynamic>;
      final photos =
          (data['photos'] as List? ?? []).cast<Map<String, dynamic>>();

      final items = photos
          .map((photo) => PhotoDtoMapper.fromMap(photo))
          .map(PhotoMapper.toEntity)
          .toList();

      final hasMore = photos.length == pageParams.perPage;

      return PaginationResult(
        items: items,
        hasMore: hasMore,
      );
    } on DioException catch (e) {
      throw Exception('Failed to fetch curated media: ${e.message}');
    }
  }
}
