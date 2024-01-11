/// [DomainPaths] is an enum class that contains all the paths of the domain.
enum DomainPaths {
  /// [dictionary] is the path of the dictionary.
  dictionary;

  /// [path] is the path of the domain.
  String get path {
    switch (this) {
      case DomainPaths.dictionary:
        return '/dictionary';
    }
  }
}
