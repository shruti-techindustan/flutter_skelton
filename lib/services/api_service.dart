import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:flutter_demo_app/services/ui/custom_interceptors.dart';

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

     dio.interceptors.add(CustomInterceptors());
    //dio.interceptors.add(LogInterceptor(responseBody: true,requestHeader: true,request: true));
  }

  Future<Response> getEmployees() async {
    return await dio.get("http://dummy.restapiexample.com/api/v1/employees");
  }
}

enum BuildType { DEV, STAGE, PROD }
