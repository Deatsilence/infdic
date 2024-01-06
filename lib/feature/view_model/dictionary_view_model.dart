import 'dart:convert';
import 'package:gen/gen.dart';
import 'package:infdic/product/init/cache/cache_manager.dart';
import 'package:infdic/product/service/dictionary_service.dart';
import 'package:infdic/product/service/firebase/firebase_network_manager.dart';
import 'package:infdic/product/state/base/base_cubit.dart';
import 'package:infdic/product/state/dictionary_view_state.dart';

/// [DictionaryViewModel] is the view model of home page
final class DictionaryViewModel extends BaseCubit<DictionaryViewState> {
  /// Constructor
  DictionaryViewModel() : super(const DictionaryViewState(isLoading: false));

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
        .dioGet<Word>(word, Word())
        .then(
          (value) => value is Word ? emit(state.copyWith(word: value)) : null,
        )
        .whenComplete(changeLoading);
  }
}
