import 'package:flutter/material.dart';
import 'package:infdic/feature/view/dictionary_view.dart';
import 'package:infdic/feature/view_model/dictionary_view_model.dart';

/// [DictionaryViewMixin] is the view model of home page
mixin DictionaryViewMixin on State<DictionaryView> {
  late final DictionaryViewModel _dictionaryViewModel;

  /// [dictionaryViewModel] is the view model of dictionary page
  DictionaryViewModel get dictionaryViewModel => _dictionaryViewModel;
  @override
  void initState() {
    super.initState();
    _dictionaryViewModel = DictionaryViewModel();
  }
}
