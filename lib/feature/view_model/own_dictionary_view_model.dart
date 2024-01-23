import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:infdic/product/service/dictionary_service.dart';
import 'package:infdic/product/service/firebase/firebase_network_manager.dart';
import 'package:infdic/product/state/base/base_cubit.dart';
import 'package:infdic/product/state/own_dictionary_view_state.dart';
import 'package:infdic/product/utility/constants/enums/domain_paths.dart';
import 'package:infdic/product/utility/extension/has_value_extension.dart';
import 'package:infdic/product/utility/extension/make_safe_custom_extension.dart';

/// [OwnDictionaryViewModel] is the view model of home page
final class OwnDictionaryViewModel extends BaseCubit<OwnDictionaryViewState> {
  /// Constructor
  OwnDictionaryViewModel()
      : super(const OwnDictionaryViewState(isLoading: false, words: []));

  /// [changeLoading] is the loading state of home page
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  /// [addAWord] is the words of home page
  Future<void> addAWord({required Word? word}) async {
    changeLoading();
    final user = FirebaseNetworkManager.instance.getCurrentUser();
    if (user == null && word == null) return;
    await FirebaseNetworkManager.instance
        .addAWordToFirestore(id: user!.uid, word: word!.word_en ?? '')
        .whenComplete(changeLoading);
  }

  /// [deleteWord] is the words of home page
  Future<void> deleteWord({required Word? word}) async {
    changeLoading();
    final user = FirebaseNetworkManager.instance.getCurrentUser();
    if (user == null && word == null) return;
    await FirebaseNetworkManager.instance
        .deleteAWordfFromFirestore(id: user!.uid, word: word!.word_en ?? '')
        .whenComplete(changeLoading);
  }

  Future<void> getUser() async {
    changeLoading();
    final user = FirebaseNetworkManager.instance.getCurrentUser();
    if (user != null) {
      late InfDicUser infDicUser;
      await FirebaseNetworkManager.instance
          .getDataFromFirestore(id: user.uid)
          .then((value) {
        infDicUser = InfDicUser.fromJson(value.data() ?? {});
      }).whenComplete(() => emit(state.copyWith(infDicUser: infDicUser)));

      final ownWordsFutures = infDicUser.ownWords.map(searchAWord);
      final ownWordsResults = await Future.wait(ownWordsFutures);

      final ownWords = ownWordsResults.whereType<List<Word?>>().toList();
      debugPrint('ownWords: $ownWords');

      emit(state.copyWith(words: ownWords));
      changeLoading();
    }
  }

  /// [searchAWord] is the search a word of dictionary page
  Future<List<Word?>?> searchAWord(
    String word,
  ) async {
    var safeWord = <Word>[];
    await DictionaryService.instance
        .dioGet<Word>(
      domain: DomainPaths.dictionary.path,
      value: word,
      model: Word(),
    )
        .then((value) {
      debugPrint('value: $value');

      if (value is List<Word>) {
        safeWord = value.makeSafeCustom(
          (value) =>
              value?.id != null &&
              value?.category != null &&
              value?.type != null &&
              value?.word_en != null &&
              value?.word_tr != null,
        );
        debugPrint('safeWord: $safeWord');
      }
    }).whenComplete(() => _getAuidoOfSpesificAWord(word: word));
    return safeWord;
  }

  /// [_getAuidoOfSpesificAWord] is the detail of spesific a word of
  /// dictionary page
  Future<void> _getAuidoOfSpesificAWord({required String word}) async {
    await DictionaryService.instance
        .dioGet<WordDetail>(
      domain: DomainPaths.detail.path,
      value: word,
      model: WordDetail(),
    )
        .then((value) {
      if (value is List<WordDetail>) {
        final wordDetails = value.makeSafeCustom(
          (value) => value?.word.hasValue == true,
        );

        emit(state.copyWith(wordDetails: wordDetails));
      }
    });
  }
}
