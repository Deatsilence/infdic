/// [HasValueStringExtension] checks if string is null or empty
extension HasValueStringExtension on String? {
  /// Check if string is null or empty
  bool get hasValue => this != null && this!.isNotEmpty;
}

/// [HasValueListExtension] checks if list is null or empty
extension HasValueListExtension<T> on List<T>? {
  /// Check if list is null or empty
  bool get hasValue => this != null && this!.isNotEmpty;
}
