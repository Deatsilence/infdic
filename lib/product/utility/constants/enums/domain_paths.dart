/// [DomainPaths] is an enum class that contains all the paths of the domain.
enum DomainPaths {
  /// [dictionary] is the path of the dictionary.
  dictionary,

  /// [detail] is the path of the detail.
  detail;

  /// [path] is the path of the domain.
  String get path {
    switch (this) {
      case DomainPaths.dictionary:
        return '/dictionary';
      case DomainPaths.detail:
        return '/dictionary/detail';
    }
  }
}
