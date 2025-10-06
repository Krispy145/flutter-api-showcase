import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../core/di/di.dart';
import '../../../../core/utils/paging.dart';
import '../../../../data/repositories/media_repository.dart';
import 'media_event.dart';
import 'media_state.dart';

/// BLoC for managing media state
class MediaBloc extends Bloc<MediaEvent, MediaState> {
  MediaBloc() : super(const MediaState.initial()) {
    on<MediaStarted>(_onStarted);
    on<MediaSearchChanged>(_onSearchChanged,
        transformer: _debounce(const Duration(milliseconds: 400)));
    on<MediaNextPageRequested>(_onNextPage);
    on<MediaRefreshed>(_onRefreshed);
  }

  final MediaRepository _repository = getIt<MediaRepository>();

  /// Handle initial media load
  Future<void> _onStarted(MediaStarted event, Emitter<MediaState> emit) async {
    emit(state.loading());

    try {
      final result = await _repository.fetchPage(
        query: '',
        pageParams: const PageParams(page: 1),
      );

      if (result.items.isEmpty) {
        emit(state.empty());
      } else {
        emit(state.success(
          items: result.items,
          hasMore: result.hasMore,
          page: 1,
        ));
      }
    } catch (e) {
      emit(state.failure('Failed to load media: ${e.toString()}'));
    }
  }

  /// Handle search query changes
  Future<void> _onSearchChanged(
      MediaSearchChanged event, Emitter<MediaState> emit) async {
    emit(state.copyWith(query: event.query));

    if (event.query.trim().isEmpty) {
      add(const MediaStarted());
      return;
    }

    emit(state.loading());

    try {
      final result = await _repository.fetchPage(
        query: event.query,
        pageParams: const PageParams(page: 1),
      );

      if (result.items.isEmpty) {
        emit(state.empty());
      } else {
        emit(state.success(
          items: result.items,
          hasMore: result.hasMore,
          page: 1,
        ));
      }
    } catch (e) {
      emit(state.failure('Failed to search media: ${e.toString()}'));
    }
  }

  /// Handle next page request
  Future<void> _onNextPage(
      MediaNextPageRequested event, Emitter<MediaState> emit) async {
    if (!state.hasMore || state.status == MediaStatus.loading) return;

    emit(state.loading());

    try {
      final nextPage = state.page + 1;
      final result = await _repository.fetchPage(
        query: state.query,
        pageParams: PageParams(page: nextPage),
      );

      final updatedItems = [...state.items, ...result.items];

      emit(state.success(
        items: updatedItems,
        hasMore: result.hasMore,
        page: nextPage,
      ));
    } catch (e) {
      emit(state.failure('Failed to load more media: ${e.toString()}'));
    }
  }

  /// Handle refresh request
  Future<void> _onRefreshed(
      MediaRefreshed event, Emitter<MediaState> emit) async {
    if (state.query.trim().isEmpty) {
      add(const MediaStarted());
    } else {
      add(MediaSearchChanged(state.query));
    }
  }

  /// Debounce transformer for search events
  EventTransformer<MediaSearchChanged> _debounce<MediaSearchChanged>(
      Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
