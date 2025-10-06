import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:api_showcase/data/models/entities/media_item.dart';
import 'package:api_showcase/features/media/presentation/bloc/media_bloc.dart';
import 'package:api_showcase/features/media/presentation/bloc/media_event.dart';
import 'package:api_showcase/features/media/presentation/bloc/media_state.dart';
import 'package:api_showcase/features/media/presentation/pages/media_list_page.dart';

class MockMediaBloc extends Mock implements MediaBloc {}

void main() {
  group('MediaListPage', () {
    late MockMediaBloc mockBloc;

    setUp(() {
      mockBloc = MockMediaBloc();
    });

    Widget createWidgetUnderTest() {
      return MaterialApp(
        home: BlocProvider<MediaBloc>(
          create: (context) => mockBloc,
          child: const MediaListPage(),
        ),
      );
    }

    testWidgets('should display loading indicator when status is loading',
        (tester) async {
      // Arrange
      when(() => mockBloc.state)
          .thenReturn(const MediaState.initial().loading());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should display grid when status is success', (tester) async {
      // Arrange
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
      when(() => mockBloc.state).thenReturn(const MediaState.initial().success(
        items: mockItems,
        hasMore: true,
        page: 1,
      ));

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.byType(GridView), findsOneWidget);
      expect(find.text('Author 1'), findsOneWidget);
    });

    testWidgets('should display empty view when status is empty',
        (tester) async {
      // Arrange
      when(() => mockBloc.state).thenReturn(const MediaState.initial().empty());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.text('No media found'), findsOneWidget);
    });

    testWidgets('should display error view when status is failure',
        (tester) async {
      // Arrange
      when(() => mockBloc.state).thenReturn(
        const MediaState.initial().failure('Test error'),
      );

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.text('Something went wrong'), findsOneWidget);
      expect(find.text('Test error'), findsOneWidget);
    });

    testWidgets('should trigger search when text changes', (tester) async {
      // Arrange
      when(() => mockBloc.state).thenReturn(const MediaState.initial());
      when(() => mockBloc.add(any())).thenReturn(null);

      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.enterText(find.byType(TextField), 'test query');
      await tester.pumpAndSettle();

      // Assert
      verify(() => mockBloc.add(any(that: isA<MediaSearchChanged>())))
          .called(1);
    });
  });
}
