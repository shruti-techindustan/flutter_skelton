import 'dart:async';

mixin Validators {
  final validateEmailStream =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.trim().isEmpty) {
      sink.addError("Email can't be empty");
    } else {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = new RegExp(pattern);
      if (!regex.hasMatch(email.trim())) {
        sink.addError('Enter a valid email');
      } else {
        sink.add(email);
      }
    }
  });

  final validatePasswordStream = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.trim().isEmpty) {
      sink.addError("Password can't be empty");
    } else if (password.length < 4) {
      sink.addError('Password character length must be atleast 4');
    } else {
      sink.add(password);
    }
  });

  String validatePassword(String password) {
    if (password.trim().isEmpty) {
      return "Password can't be empty";
    } else if (password.trim().length < 4) {
      return "Password character length must be atleast 4";
    } else {
      return null;
    }
  }

  final checkNullOrEmpty =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value == null || value == "null") {
      sink.addError("Null Value");
    } else if (value.isEmpty) {
      sink.addError("Empty value");
    } else {
      sink.add(value);
    }
  });

  String validateOptionalPhoneForm(String phone) {
    if (phone.trim().length == 0)
      return null;
    else {
      RegExp regExp = new RegExp(
        r"^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$",
        caseSensitive: false,
        multiLine: false,
      );
      if (regExp.hasMatch(phone) == false) {
        return '"$phone" is not a valid phone number';
      }

      return null;
    }
  }

  validateEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(email.trim())) {
      return false;
    } else {
      return true;
    }
  }

  String validateEmailForm(String email) {
    if (email.trim().isEmpty) return "Email can't be empty";
    return validateEmail(email) ? null : "Enter a valid email";
  }

  String validateWebsites(String url) {
    RegExp regExp = RegExp(
        r"^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$");
    if (!regExp.hasMatch(url.trim())) {
      return "Invalid URL";
    } else {
      return null;
    }
  }
}
