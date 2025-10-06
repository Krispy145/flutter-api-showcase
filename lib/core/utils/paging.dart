/// Page parameters for pagination
class PageParams {
  const PageParams({
    required this.page,
    this.perPage = 30,
  });

  final int page;
  final int perPage;

  /// Creates the next page parameters
  PageParams next() => PageParams(
        page: page + 1,
        perPage: perPage,
      );

  /// Creates the first page parameters
  PageParams first() => PageParams(
        page: 1,
        perPage: perPage,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PageParams &&
          runtimeType == other.runtimeType &&
          page == other.page &&
          perPage == other.perPage;

  @override
  int get hashCode => page.hashCode ^ perPage.hashCode;

  @override
  String toString() => 'PageParams(page: $page, perPage: $perPage)';
}

/// Pagination result containing items and whether there are more pages
class PaginationResult<T> {
  const PaginationResult({
    required this.items,
    required this.hasMore,
  });

  final List<T> items;
  final bool hasMore;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaginationResult<T> &&
          runtimeType == other.runtimeType &&
          items == other.items &&
          hasMore == other.hasMore;

  @override
  int get hashCode => items.hashCode ^ hasMore.hashCode;

  @override
  String toString() =>
      'PaginationResult(items: ${items.length}, hasMore: $hasMore)';
}
