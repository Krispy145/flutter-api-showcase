import 'package:equatable/equatable.dart';
import '../../../../data/models/entities/media_item.dart';

/// Status of media loading
enum MediaStatus {
  initial,
  loading,
  success,
  empty,
  failure,
}

/// State for media list
class MediaState extends Equatable {
  const MediaState({
    required this.status,
    required this.query,
    required this.items,
    required this.hasMore,
    required this.page,
    this.error,
  });

  final MediaStatus status;
  final String query;
  final List<MediaItem> items;
  final bool hasMore;
  final int page;
  final String? error;

  /// Create initial state
  const MediaState.initial()
      : status = MediaStatus.initial,
        query = '',
        items = const [],
        hasMore = true,
        page = 1,
        error = null;

  /// Create loading state
  MediaState loading() => copyWith(
        status: MediaStatus.loading,
        error: null,
      );

  /// Create success state
  MediaState success({
    required List<MediaItem> items,
    required bool hasMore,
    required int page,
  }) =>
      copyWith(
        status: MediaStatus.success,
        items: items,
        hasMore: hasMore,
        page: page,
        error: null,
      );

  /// Create empty state
  MediaState empty() => copyWith(
        status: MediaStatus.empty,
        items: const [],
        hasMore: false,
        page: 1,
        error: null,
      );

  /// Create failure state
  MediaState failure(String error) => copyWith(
        status: MediaStatus.failure,
        error: error,
      );

  /// Copy with new values
  MediaState copyWith({
    MediaStatus? status,
    String? query,
    List<MediaItem>? items,
    bool? hasMore,
    int? page,
    String? error,
  }) {
    return MediaState(
      status: status ?? this.status,
      query: query ?? this.query,
      items: items ?? this.items,
      hasMore: hasMore ?? this.hasMore,
      page: page ?? this.page,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, query, items, hasMore, page, error];
}
