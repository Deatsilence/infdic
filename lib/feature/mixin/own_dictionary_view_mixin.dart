import 'package:flutter/material.dart';
import 'package:infdic/feature/view/own_dictionary_view.dart';
import 'package:infdic/feature/view_model/own_dictionary_view_model.dart';

/// [OwnDictionaryViewMixin] is the view model of home page
mixin OwnDictionaryViewMixin on State<OwnDictionaryView> {
  /// [_searchController] is the controller of search text form field
  late final TextEditingController _searchController;

  late final OwnDictionaryViewModel _ownDictionaryViewModel;

  /// [ownDictionaryViewModel] is the view model of dictionary page
  OwnDictionaryViewModel get ownDictionaryViewModel => _ownDictionaryViewModel;

  /// [searchController] is the controller of search text form field
  TextEditingController get searchController => _searchController;

  @override
  void initState() {
    super.initState();
    _ownDictionaryViewModel = OwnDictionaryViewModel();
    _searchController = TextEditingController();
    ownDictionaryViewModel.getUser();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
