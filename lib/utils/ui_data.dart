import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UIData {
  static String DefaultMMDDYYYYText = "N/A";
  static String DefaultHHMMText = "--:--";
  static String DefaultHHMMMText = "N/A";
  static String DefaultMMDDYYYYHHMMAA = "N/A";



  static convertedTimeStamptoHHMMAA(num time) {
    if (time == null || time == 0) return DefaultHHMMText;
    var dateFormat = new DateFormat('hh:mm aa');
    DateTime dt = new DateTime.fromMillisecondsSinceEpoch(time);
    String convertedTime = dateFormat.format(dt).toString();

    return convertedTime;
  }

  static convertedTimeStamptoMMDDYYYY(num time, {seperator: "-"}) {
    if (time == null || time == 0) return DefaultMMDDYYYYText;
    var dateFormat = new DateFormat("MM${seperator}dd${seperator}yyyy");
    DateTime dt = new DateTime.fromMillisecondsSinceEpoch(time);
    String convertedTime = dateFormat.format(dt).toString();

    return convertedTime;
  }

  getPrice(num price) {
    return price.toStringAsFixed(2);
  }




  static convertedTimeStamptoHHMM(num time) {
    if (time == null || time == 0) return DefaultHHMMText;
    var dateFormat = new DateFormat('hh:mm aa');
    DateTime dt = new DateTime.fromMillisecondsSinceEpoch(time);
    String convertedTime = dateFormat.format(dt).toString();
    return convertedTime;
  }

  static convertedTimeStamptoMMDDYYYYHHMMAA(num time) {
    if (time == null || time == 0) return DefaultMMDDYYYYHHMMAA;
    var dateFormat = new DateFormat('MM-dd-yyyy hh:mm aa');
    DateTime dt = new DateTime.fromMillisecondsSinceEpoch(time);
    String convertedTime = dateFormat.format(dt).toString();
    return convertedTime;
  }

  static convertedTimeStampToMMddYYYY(num time) {
    if (time == null || time == 0) return DefaultMMDDYYYYText;
    var dateFormat = new DateFormat('MM-dd-yyyy');
    DateTime dt = new DateTime.fromMillisecondsSinceEpoch(time);
    String convertedTime = dateFormat.format(dt).toString();
    return convertedTime;
  }

  static convertedTimeStamptohhmmaaMMddyyyy(num time) {
    var dateFormat = new DateFormat('hh:mm aa, MM/dd/yyyy ');
    DateTime dt = new DateTime.fromMillisecondsSinceEpoch(time);
    String convertedTime = dateFormat.format(dt).toString();

    return convertedTime;
  }

  static convertedTimeStamptoYYYYMMdd(num time) {
    var dateFormat = new DateFormat('yyyyMMdd');
    DateTime dt = new DateTime.fromMillisecondsSinceEpoch(time);
    String convertedTime = dateFormat.format(dt).toString();

    return convertedTime;
  }


  static String fixedNumToTwoDecimal(num value) {
    return value.toStringAsFixed(2);
  }
}
