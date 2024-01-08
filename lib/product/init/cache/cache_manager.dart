import 'dart:convert';
import 'package:common/common.dart';
import 'package:gen/gen.dart';
import 'package:infdic/product/error/shared_initialize_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// [CacheManager] is the cache manager of the app
final class CacheManager {
  CacheManager._();

  static final CacheManager _instance = CacheManager._();

  /// [instance] is the instance of [CacheManager]
  static CacheManager get instance => _instance;

  SharedPreferences? _sharedPreferences;

  void _checkPreferences() {
    if (_sharedPreferences == null) {
      throw SharedNotInitializeException();
    }
  }

  /// [_init] is the initialization of [CacheManager]
  Future<void> _init() async {
    await SharedPreferences.getInstance()
        .then((value) => _sharedPreferences = value);
  }

  /// [checkSignInSP] is the get user data from shared preferences
  Future<bool> checkSignInSP() async {
    await _init();
    _checkPreferences();
    return _sharedPreferences!.getBool(LocaleCacheKey.isSignedIn) ?? false;
  }

  /// [setSignInSP] is the get user data from shared preferences
  Future<bool> setSignInSP({required bool isSignedIn}) async {
    await _init();
    _checkPreferences();
    return _sharedPreferences!.setBool(LocaleCacheKey.isSignedIn, isSignedIn);
  }

  /// [setUserDataToSP] is the get user data from shared preferences
  Future<bool> setUserDataToSP({required InfDicUser infDicUser}) async {
    await _init();
    _checkPreferences();
    return _sharedPreferences!.setString(
      LocaleCacheKey.userModel,
      jsonEncode(
        {LocaleCacheKey.userModel: infDicUser},
        toEncodable: (Object? value) => value is InfDicUser
            ? infDicUser.toJson()
            : throw UnsupportedError('Cannot convert to JSON: $value'),
      ),
    );
  }

  /// [getUserDataFromSP] is the get user data from shared preferences
  Future<String> getUserDataFromSP() async {
    await _init();
    _checkPreferences();
    final data = _sharedPreferences!.getString(LocaleCacheKey.userModel) ?? '';
    return data;
  }

  /// [clearSP] is the clear shared preferences
  Future<bool> clearSP() async {
    await _init();
    _checkPreferences();
    return _sharedPreferences!.clear();
  }
}
