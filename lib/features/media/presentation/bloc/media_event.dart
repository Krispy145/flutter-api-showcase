import 'package:equatable/equatable.dart';

/// Base class for all media events
sealed class MediaEvent extends Equatable {
  const MediaEvent();

  @override
  List<Object?> get props => [];
}

/// Event to start loading media (initial load with curated content)
class MediaStarted extends MediaEvent {
  const MediaStarted();
}

/// Event when search query changes
class MediaSearchChanged extends MediaEvent {
  const MediaSearchChanged(this.query);

  final String query;

  @override
  List<Object?> get props => [query];
}

/// Event to request the next page of results
class MediaNextPageRequested extends MediaEvent {
  const MediaNextPageRequested();
}

/// Event to refresh the current results
class MediaRefreshed extends MediaEvent {
  const MediaRefreshed();
}
