import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:api_showcase/core/utils/paging.dart';
import 'package:api_showcase/data/models/entities/media_item.dart';
import 'package:api_showcase/data/repositories/media_repository_impl.dart';
import 'package:api_showcase/data/sources/media_cache.dart';
import 'package:api_showcase/data/sources/media_remote_source.dart';

class MockMediaRemoteSource extends Mock implements MediaRemoteSource {}

class MockMediaCache extends Mock implements MediaCache {}

void main() {
  group('MediaRepositoryImpl', () {
    late MediaRepositoryImpl repository;
    late MockMediaRemoteSource mockRemoteSource;
    late MockMediaCache mockCache;

    setUp(() {
      mockRemoteSource = MockMediaRemoteSource();
      mockCache = MockMediaCache();
      repository = MediaRepositoryImpl(mockRemoteSource, mockCache);
    });

    group('fetchPage', () {
      const pageParams = PageParams(page: 1);
      final mockItems = [
        const MediaItem(
          id: '1',
          type: MediaType.image,
          thumbnailUrl: 'thumb1',
          displayUrl: 'display1',
          author: 'Author 1',
          width: 100,
          height: 100,
        ),
      ];

      test('should return cached data when available', () async {
        // Arrange
        when(() => mockCache.readResults('|1'))
            .thenAnswer((_) async => (mockItems, true));

        // Act
        final result = await repository.fetchPage(pageParams: pageParams);

        // Assert
        expect(result.items, equals(mockItems));
        expect(result.hasMore, isTrue);
        verify(() => mockCache.readResults('|1')).called(1);
        verifyNever(() =>
            mockRemoteSource.curated(pageParams: any(named: 'pageParams')));
      });

      test('should fetch from remote when cache is empty', () async {
        // Arrange
        when(() => mockCache.readResults('|1')).thenAnswer((_) async => null);
        when(() => mockRemoteSource.curated(pageParams: pageParams)).thenAnswer(
            (_) async => PaginationResult(items: mockItems, hasMore: true));
        when(() => mockCache.writeResults(
              key: '|1',
              items: mockItems,
              hasMore: true,
            )).thenAnswer((_) async {});

        // Act
        final result = await repository.fetchPage(pageParams: pageParams);

        // Assert
        expect(result.items, equals(mockItems));
        expect(result.hasMore, isTrue);
        verify(() => mockCache.readResults('|1')).called(1);
        verify(() => mockRemoteSource.curated(pageParams: pageParams))
            .called(1);
        verify(() => mockCache.writeResults(
              key: '|1',
              items: mockItems,
              hasMore: true,
            )).called(1);
      });

      test('should return stale cache on network failure', () async {
        // Arrange
        when(() => mockCache.readResults('|1')).thenAnswer((_) async => null);
        when(() => mockRemoteSource.curated(pageParams: pageParams))
            .thenThrow(DioException(
          requestOptions: RequestOptions(path: '/'),
          type: DioExceptionType.connectionTimeout,
        ));
        when(() => mockCache.readResults('|0'))
            .thenAnswer((_) async => (mockItems, false));

        // Act
        final result = await repository.fetchPage(pageParams: pageParams);

        // Assert
        expect(result.items, equals(mockItems));
        expect(result.hasMore, isFalse);
        verify(() => mockCache.readResults('|0')).called(1);
      });
    });
  });
}
