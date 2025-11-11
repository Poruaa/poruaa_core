/// Represents the state of paginated data
class PaginationState<T> {
  final List<T> items;
  final String? nextCursor;
  final bool hasMore;
  final bool isLoading;
  final bool isLoadingMore;
  final String? error;

  const PaginationState({
    this.items = const [],
    this.nextCursor,
    this.hasMore = false,
    this.isLoading = false,
    this.isLoadingMore = false,
    this.error,
  });

  PaginationState<T> copyWith({
    List<T>? items,
    String? nextCursor,
    bool? hasMore,
    bool? isLoading,
    bool? isLoadingMore,
    String? error,
    bool clearError = false,
  }) {
    return PaginationState<T>(
      items: items ?? this.items,
      nextCursor: nextCursor ?? this.nextCursor,
      hasMore: hasMore ?? this.hasMore,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      error: clearError ? null : (error ?? this.error),
    );
  }

  /// Add new items to the existing list (for pagination)
  PaginationState<T> addItems(List<T> newItems,
      {String? newNextCursor, bool? newHasMore}) {
    return copyWith(
      items: [...items, ...newItems],
      nextCursor: newNextCursor,
      hasMore: newHasMore ?? false,
      isLoadingMore: false,
    );
  }

  /// Replace all items (for refresh)
  PaginationState<T> replaceItems(List<T> newItems,
      {String? newNextCursor, bool? newHasMore}) {
    return copyWith(
      items: newItems,
      nextCursor: newNextCursor ?? nextCursor,
      hasMore: newHasMore ?? hasMore,
      isLoading: false,
      isLoadingMore: false,
    );
  }

  /// Set loading state
  PaginationState<T> setLoading({bool isLoading = true}) {
    return copyWith(isLoading: isLoading, clearError: true);
  }

  /// Set loading more state
  PaginationState<T> setLoadingMore({bool isLoadingMore = true}) {
    return copyWith(isLoadingMore: isLoadingMore);
  }

  /// Set error state
  PaginationState<T> setError(String error) {
    return copyWith(
      error: error,
      isLoading: false,
      isLoadingMore: false,
    );
  }

  /// Check if we can load more items
  bool get canLoadMore => hasMore && !isLoading && !isLoadingMore;

  /// Check if we have any items
  bool get hasItems => items.isNotEmpty;

  /// Check if we're in an error state
  bool get hasError => error != null;

  @override
  String toString() {
    return 'PaginationState(items: ${items.length}, nextCursor: $nextCursor, hasMore: $hasMore, isLoading: $isLoading, isLoadingMore: $isLoadingMore, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PaginationState<T> &&
        other.items == items &&
        other.nextCursor == nextCursor &&
        other.hasMore == hasMore &&
        other.isLoading == isLoading &&
        other.isLoadingMore == isLoadingMore &&
        other.error == error;
  }

  @override
  int get hashCode {
    return Object.hash(
        items, nextCursor, hasMore, isLoading, isLoadingMore, error);
  }
}

/// Pagination parameters for API calls
class PaginationParams {
  final int limit;
  final String? cursor;
  final String? sortBy;
  final String? sortOrder;

  const PaginationParams({
    this.limit = 20,
    this.cursor,
    this.sortBy,
    this.sortOrder,
  });

  Map<String, String> toQueryParams() {
    final params = <String, String>{
      'limit': limit.toString(),
    };

    if (cursor != null) {
      params['cursor'] = cursor!;
    }

    if (sortBy != null) {
      params['sort_by'] = sortBy!;
    }

    if (sortOrder != null) {
      params['sort_order'] = sortOrder!;
    }

    return params;
  }

  PaginationParams copyWith({
    int? limit,
    String? cursor,
    String? sortBy,
    String? sortOrder,
  }) {
    return PaginationParams(
      limit: limit ?? this.limit,
      cursor: cursor ?? this.cursor,
      sortBy: sortBy ?? this.sortBy,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }
}

/// Response from paginated API
class PaginatedResponse<T> {
  final List<T> items;
  final String? nextCursor;
  final bool hasMore;
  final int total;

  const PaginatedResponse({
    required this.items,
    this.nextCursor,
    this.hasMore = false,
    this.total = 0,
  });

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return PaginatedResponse<T>(
      items: (json['items'] as List<dynamic>?)
              ?.map((item) => fromJsonT(item as Map<String, dynamic>))
              .toList() ??
          [],
      nextCursor: json['next_cursor'] as String?,
      hasMore: json['has_more'] as bool? ?? false,
      total: json['total'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) {
    return {
      'items': items.map((item) => toJsonT(item)).toList(),
      'next_cursor': nextCursor,
      'has_more': hasMore,
      'total': total,
    };
  }
}
