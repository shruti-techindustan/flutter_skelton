import 'package:intl/intl.dart';

class Utils {



  static String formatPhoneNumber(String str) {
    return str.replaceAll(new RegExp(r"[()-\s+\b]"), "");
  }


}
