import 'package:flutter/material.dart';
import 'package:infdic/feature/view/dictionary_view.dart';
import 'package:infdic/feature/view_model/dictionary_view_model.dart';

/// [DictionaryViewMixin] is the view model of home page
mixin DictionaryViewMixin on State<DictionaryView> {
  /// [_searchController] is the controller of search text form field
  late final TextEditingController _searchController;

  late final DictionaryViewModel _dictionaryViewModel;

  /// [dictionaryViewModel] is the view model of dictionary page
  DictionaryViewModel get dictionaryViewModel => _dictionaryViewModel;

  /// [searchController] is the controller of search text form field
  TextEditingController get searchController => _searchController;

  @override
  void initState() {
    super.initState();
    _dictionaryViewModel = DictionaryViewModel();
    _searchController = TextEditingController();
    dictionaryViewModel.getUser();
  }
}
