import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/entities/media_item.dart';
import '../../../../presentation/router/app_router.dart';
import '../bloc/media_bloc.dart';
import '../bloc/media_event.dart';
import '../bloc/media_state.dart';
import '../widgets/empty_view.dart';
import '../widgets/error_view.dart';
import '../widgets/media_tile.dart';

/// Media list page with search and grid view
@RoutePage()
class MediaListPage extends StatefulWidget {
  const MediaListPage({super.key});

  @override
  State<MediaListPage> createState() => _MediaListPageState();
}

class _MediaListPageState extends State<MediaListPage> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    context.read<MediaBloc>().add(const MediaStarted());
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      context.read<MediaBloc>().add(const MediaNextPageRequested());
    }
  }

  void _onSearchChanged(String query) {
    context.read<MediaBloc>().add(MediaSearchChanged(query));
  }

  Future<void> _onRefresh() async {
    context.read<MediaBloc>().add(const MediaRefreshed());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Showcase'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search for photos...',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.clear),
              ),
              onChanged: _onSearchChanged,
            ),
          ),
        ),
      ),
      body: BlocBuilder<MediaBloc, MediaState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: _onRefresh,
            child: _buildBody(state),
          );
        },
      ),
    );
  }

  Widget _buildBody(MediaState state) {
    switch (state.status) {
      case MediaStatus.initial:
      case MediaStatus.loading:
        if (state.items.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return _buildGrid(state);
      case MediaStatus.success:
        return _buildGrid(state);
      case MediaStatus.empty:
        return const EmptyView();
      case MediaStatus.failure:
        return ErrorView(
          message: state.error ?? 'Unknown error',
          onRetry: () => _onRefresh(),
        );
    }
  }

  Widget _buildGrid(MediaState state) {
    return GridView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: state.items.length + (state.hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= state.items.length) {
          return const Center(child: CircularProgressIndicator());
        }

        final item = state.items[index];
        return MediaTile(
          item: item,
          onTap: () => _navigateToDetail(item),
        );
      },
    );
  }

  void _navigateToDetail(MediaItem item) {
    context.router.push(MediaDetailRoute(item: item));
  }
}
