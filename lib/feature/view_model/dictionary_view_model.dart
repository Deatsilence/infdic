import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:infdic/product/init/cache/cache_manager.dart';
import 'package:infdic/product/service/dictionary_service.dart';
import 'package:infdic/product/service/firebase/firebase_network_manager.dart';
import 'package:infdic/product/state/base/base_cubit.dart';
import 'package:infdic/product/state/dictionary_view_state.dart';
import 'package:infdic/product/utility/constants/enums/domain_paths.dart';
import 'package:infdic/product/utility/extension/make_safe_custom_extension.dart';

/// [DictionaryViewModel] is the view model of home page
final class DictionaryViewModel extends BaseCubit<DictionaryViewState> {
  /// Constructor
  DictionaryViewModel()
      : super(const DictionaryViewState(isLoading: false, words: []));

  /// [changeLoading] is the loading state of home page
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  /// [getDataOfUserFromCache] is the data of user from cache
  Future<void> getDataOfUserFromCache() async {
    changeLoading();
    await CacheManager.instance
        .getUserDataFromSP()
        .then(
          (value) => emit(
            state.copyWith(
              infDicUser: InfDicUser.fromJson(
                jsonDecode(value) as Map<String, dynamic>,
              ),
            ),
          ),
        )
        .whenComplete(changeLoading);
  }

  /// [getUser] is the user of dictionary page
  Future<void> getUser() async {
    changeLoading();
    final user = FirebaseNetworkManager.instance.getCurrentUser();
    if (user != null) {
      late InfDicUser infDicUser;
      await FirebaseNetworkManager.instance
          .getDataFromFirestore(id: user.uid)
          .then((value) {
            infDicUser = InfDicUser.fromJson(value.data() ?? {});
          })
          .whenComplete(() => emit(state.copyWith(infDicUser: infDicUser)))
          .whenComplete(changeLoading);
    }
  }

  /// [searchAWord] is the search a word of dictionary page
  Future<void> searchAWord(
    String word,
  ) async {
    changeLoading();
    await DictionaryService.instance
        .dioGet<Word>(
      domain: DomainPaths.dictionary.path,
      value: word,
      model: Word(),
    )
        .then((value) {
      debugPrint('value: $value');

      if (value is List<Word>) {
        final safeWord = value.makeSafeCustom(
          (value) =>
              value?.id != null &&
              value?.category != null &&
              value?.type != null &&
              value?.word_en != null &&
              value?.word_tr != null,
        );
        emit(state.copyWith(words: safeWord));
      }
    }).whenComplete(changeLoading);
  }
}
