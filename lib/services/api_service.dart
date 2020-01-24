import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:async/async.dart';
import 'package:dio/dio.dart';

import 'package:intl/intl.dart';

class ApiService {
  var BaseUrl;
  static const GoogleAPIKey = "AIzaSyCZj40Co5f9FJF6rnkvYccVW1x-k3DgBDQ";

  BuildType buildType = BuildType.DEV;

  Dio dio = Dio();

  ApiService() {
    switch (buildType) {
      case BuildType.DEV:
        BaseUrl = "http://api.dev.domainname";
        break;
      case BuildType.STAGE:
        BaseUrl = "https://api.stage.domainname";
        break;
      case BuildType.PROD:
        BaseUrl = "https://api.domainname";
        break;
    }
  }

  Future<Response> phoneAuth() async {
    var url = BaseUrl + "api/auth/authentication";
    return await dio.post(url, options: Options(contentType: 'application/x-www-form-urlencoded'));
  }
}

enum BuildType { DEV, STAGE, PROD }
