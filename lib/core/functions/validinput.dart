import 'package:get/get.dart';

validInput(String val, int min, int max, [String? type]) {
  if (type == "name") {
    if (!GetUtils.isUsername(val)) {
      return "not valid name";
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not valid email";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not valid phone";
    }
  }
  if (type == "price") {
    if (!GetUtils.isNum(val)) {
      return "not valid price";
    }
  }

  if (val.isEmpty) {
    return "cant be empty";
  }

  if (val.length < min) {
    return "value cant be less $min";
  }

  if (val.length > max) {
    return "value cant be larger $max";
  }
}

validInputemp(String val, int min, int max, [String? type]) {
  if (type == "name") {
    if (!GetUtils.isUsername(val)) {
      return "not valid name";
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not valid email";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not valid phone";
    }
  }
  if (type == "price") {
    if (!GetUtils.isNum(val)) {
      return "not valid price";
    }
  }

  if (val.length < min) {
    return "value cant be less $min";
  }

  if (val.length > max) {
    return "value cant be larger $max";
  }
}
