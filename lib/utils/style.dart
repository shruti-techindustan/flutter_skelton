import 'package:flutter/material.dart';
import 'package:flutter_demo_app/values/app_colors.dart';

inputDecorationStyle(String hintText, {String error: null}) {
  if (error != null) print(error);
  return InputDecoration(
      hintText: hintText, errorText: error, errorMaxLines: 3);
}

textStyleSmall() {
  return TextStyle(color: AppColors.GREY_COLOR, fontSize: 11);
}


