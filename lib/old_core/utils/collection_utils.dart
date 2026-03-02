class CollectionUtils {
  static R? firstOrNull<T, R>(
    Iterable<T> items,
    R? Function(T element) extractor, {
    bool Function(R value)? condiction,
  }) {
    for (final item in items) {
      final value = extractor(item);
      if (value != null && (condiction?.call(value) ?? true)) {
        return value;
      }
    }
    return null;
  }
}
