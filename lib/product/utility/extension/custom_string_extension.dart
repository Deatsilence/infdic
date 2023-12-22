/// [CustomStringExtension] checks if string is null or empty
extension CustomStringExtension on String? {
  /// Check if string is null or empty
  bool get hasValue => this != null && this!.isNotEmpty;
}
