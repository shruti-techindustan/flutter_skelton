import 'package:flutter/services.dart';

class CashFormator extends TextInputFormatter {
  //final RegExp numberRegExp = RegExp(r'\d');
  RegExp numberRegExp =
      new RegExp(r'^(?:-?(?:[0-9]+))?(?:\.[0-9]*)?(?:[eE][\+\-]?(?:[0-9]+))?$');
  final int decimalRange;

  CashFormator({this.decimalRange: 2})
      : assert(decimalRange == null || decimalRange > 0);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    /*var format=NumberFormat.currency(symbol: "\$",locale: "en_US");
    String value;
    if(newValue.text.contains("\$")){
      value=newValue.text.replaceAll("\$", "");
    }
    value="\$${format.format(value)}";
    print("text:"+value);*/
    int selectionIndex = newValue.selection.end;
    var text = newValue.text;
    if (text.contains("\$")) {
      text = text.replaceAll("\$", "");
      selectionIndex = newValue.selection.end - 1;
    } else {
      text = newValue.text;
      /*if(text.length>0){
        text="\$"+text;
        selectionIndex = newValue.selection.end-1;
      }*/
    }

    if (text.length != 0 && !numberRegExp.hasMatch(text)) {
      text = oldValue.text.replaceAll("\$", "");
      selectionIndex = text.length;
    }
    if (text.contains("..")) {
      text = oldValue.text.replaceAll("\$", "");
      selectionIndex = text.length;
    }
    if (text.contains(".") &&
        text.substring(text.indexOf(".") + 1).length > decimalRange) {
      text = oldValue.text.replaceAll("\$", "");
      selectionIndex = text.length;
    } else if (text == ".") {
      text = "0.";
      selectionIndex = text.length;
      /*newSelection = newValue.selection.copyWith(
        baseOffset: math.min(text.length, text.length + 1),
        extentOffset: math.min(text.length, text.length + 1),
      );*/
    }

    if (text.length == 0) {
      text = "";
    } else {
      text = "\$" + text;
      selectionIndex = selectionIndex + 1;
    }
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(
        offset: selectionIndex,
      ),
    );
  }
}
