extension IterableExtension<T> on Iterable<T?> {
  List<T> makeSafeCustom(bool Function(T? value) onHandle) =>
      where(onHandle).cast<T>().toList();
}
