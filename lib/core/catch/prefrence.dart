import 'dart:io';

import 'package:chats/core/catch/caching_key.dart';
import 'package:chats/core/model/user_model.dart';
import 'package:get_storage/get_storage.dart';

class PreferenceManager {
  void saveFCMToken(String fcmToken) => GetStorage().write(CachingKey.FCM_TOKEN, fcmToken);

  String fcmToken() => GetStorage().read(CachingKey.FCM_TOKEN) as String? ?? "";

  void saveIsDarkMode(bool isDark) => GetStorage().write(CachingKey.IS_DARK_MODE, isDark);

  bool isDarkMode() => GetStorage().read(CachingKey.IS_DARK_MODE) as bool? ?? false;

  void saveIsFirstTime(bool isFirstTime) => GetStorage().write(CachingKey.IS_FIRST_TIME, isFirstTime);

  bool isFirstTime() => GetStorage().read(CachingKey.IS_FIRST_TIME) as bool? ?? true;

  void saveIsLoggedIn(bool isLoggedIn) => GetStorage().write(CachingKey.IS_LOGGED_IN, isLoggedIn);

  bool isLoggedIn() => GetStorage().read(CachingKey.IS_LOGGED_IN) as bool? ?? false;

  void saveAuthToken(String? authToken) => GetStorage().write(CachingKey.AUTH_TOKEN, authToken ?? '');

  String authToken() => GetStorage().read(CachingKey.AUTH_TOKEN) as String? ?? "";

  void saveFullName(String? fullName) => GetStorage().write(CachingKey.FullName, fullName ?? '');

  String fullName() => GetStorage().read(CachingKey.FullName) as String? ?? "";


  void saveValue(String cachingKey, String value) => GetStorage().write(cachingKey, value);

  String getValue(String cachingKey) => GetStorage().read(cachingKey) as String;

  void saveLanguage(String lang) => GetStorage().write(CachingKey.LANGUAGE, lang);

  String currentLang() =>
      GetStorage().read(CachingKey.LANGUAGE) as String? ?? Platform.localeName.split("_").first.toString();

  bool isArabic() => currentLang() == "ar";
  void saveUserModel(UserModell userModel) => GetStorage().write(CachingKey.USER_MODEL, userModel.toJson());

  userModel() => UserModell().fromJson(GetStorage().read(CachingKey.USER_MODEL));

  bool isMe(String id) {
    UserModell user = userModel();
    return user.id == id;
  }

  void logout() {
    GetStorage().remove(CachingKey.USER_MODEL);
    GetStorage().remove(CachingKey.AUTH_TOKEN);
    saveIsLoggedIn(false);
  }

  void login({required String authToken, required UserModell user}) {
    saveAuthToken(authToken);
    saveUserModel(user);
    saveIsLoggedIn(true);
  }
}
