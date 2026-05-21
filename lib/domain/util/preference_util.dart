import 'dart:convert';

import 'package:ayursh/domain/model/response/config_model.dart';
import 'package:ayursh/domain/model/response/therapy_category_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtil {
  late SharedPreferences prefs;
  final String accessTokenKey = 'access_token';
  final String expiryTimeKey = 'expiry_time';
  final String firstTimeOpenApp = 'first_time_open_app';
  final String categoryListKey = 'categoryList';
  final String physioCategoryListKey = 'physioCategoryList';
  final String configDataKey = 'configDataKey';
  final String userIdKey = 'userId';
  final String phoneNumberKey = 'phoneNumber';
  final String fcmTokenKey = 'fcmTokenKey';

  Future<PreferenceUtil> init() async {
    prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future saveAccessToken(String accessToken) async {
    await prefs.setString(accessTokenKey, accessToken);
  }

  Future<String> getAccessToken() async {
    return prefs.getString(accessTokenKey) ?? '';
  }

  Future saveExpiryTime(int expiryTime) async {
    await prefs.setInt(expiryTimeKey, expiryTime * 1000);
  }

  Future<int> getExpiryTime() async {
    return prefs.getInt(expiryTimeKey) ?? 0;
  }

  Future saveFirstTimeOpenApp() async {
    await prefs.setBool(firstTimeOpenApp, false);
  }

  Future<bool> isFirstTimeOpenApp() async {
    return prefs.getBool(firstTimeOpenApp) ?? true;
  }

  Future saveCategoryList(List<TherapyCategoryModel> categories) async {
    await prefs.setStringList(categoryListKey, categories.map((e) => json.encode(e.toJson())).toList());
  }

  Future savePhysioCategoryList(List<TherapyCategoryModel> categories) async {
    await prefs.setStringList(physioCategoryListKey, categories.map((e) => json.encode(e.toJson())).toList());
  }

  Future<List<TherapyCategoryModel>> getCategoryList() async {
    var jsonList = prefs.getStringList(categoryListKey) ?? [];
    var categoryList = jsonList.map((data) => TherapyCategoryModel.fromJson(json.decode(data))).toList();
    return categoryList;
  }

  Future<List<TherapyCategoryModel>> getPhysioCategoryList() async {
    var jsonList = prefs.getStringList(physioCategoryListKey) ?? [];
    var physioCategoryList = jsonList.map((data) => TherapyCategoryModel.fromJson(json.decode(data))).toList();
    return physioCategoryList;
  }

  Future saveAppConfigs(configModel) async {
    await prefs.setString(configDataKey, json.encode(configModel.toJson()));
  }

  Future<ConfigModel?> getAppConfigs() async {
    var jsonString = prefs.getString(configDataKey) ?? '';
    if (jsonString.isEmpty) {
      return null;
    }
    return ConfigModel.fromJson(json.decode(jsonString));
  }

  Future saveUserId(String userId) async {
    await prefs.setString(userIdKey, userId);
  }

  Future<String> getUserId() async {
    return prefs.getString(userIdKey) ?? '';
  }

  Future savePhoneNumber(String phoneNumber) async {
    await prefs.setString(phoneNumberKey, phoneNumber);
  }

  Future<String> getPhoneNumber() async {
    return prefs.getString(phoneNumberKey) ?? '';
  }

  Future saveFcmToken(String fcmToken) async {
    await prefs.setString(fcmTokenKey, fcmToken);
  }

  Future<String> getFcmToken() async {
    return prefs.getString(fcmTokenKey) ?? '';
  }
}
