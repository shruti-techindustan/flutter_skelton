import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_demo_app/values/strings.dart';

import 'api_service.dart';
import 'package:dio/dio.dart' as dio;

import 'db/local/preference_helper.dart';

class DataManager {
  final apiService = ApiService();
  PreferencesHelper preferencesHelper;
  String accessToken;

  DataManager() {
    preferencesHelper = PreferencesHelper();
  }

  void saveUserName(String name) async {
    preferencesHelper.updateStringPrefs(Strings.USER_NAME, name);
  }

  getUserName() async {
    return preferencesHelper.getStringPrefs(Strings.USER_NAME);
  }

  void clearAllPreference() async {
    String userName = await getUserName();
    await preferencesHelper.clearAllPrefs();
    saveUserName(userName);
  }

  Future<Response> login() async {
    return apiService.phoneAuth();
  }
}
