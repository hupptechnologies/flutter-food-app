enum VALIDATION_TYPE { EMAIL, TEXT, PASSWORD, CONFIRM_PASSWORD }

RegExp EMAIL_REGEX = new RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

String? isRequired(String? val, String? fieldName) {
  if (val == null || val == '') {
    return "$fieldName is required";
  }
  return null;
}

String? CheckPasswordLength(String? val) {
  if (val != null && val.length < 6) {
    return 'Password must be 6 digit';
  }
  return null;
}

String? CheckFieldValidation(
    {String? val,
    String? fieldName,
    VALIDATION_TYPE? fieldType,
    String? password}) {
  String? errorMsg;

  if (fieldType == VALIDATION_TYPE.TEXT) {
    errorMsg = isRequired(val, fieldName);
  }
  if (fieldType == VALIDATION_TYPE.EMAIL) {
    if (isRequired(val, fieldName) != null) {
      errorMsg = isRequired(val, fieldName);
    } else if (!EMAIL_REGEX.hasMatch(val!)) {
      errorMsg = "Please enter valid email";
    }
  }
  if (fieldType == VALIDATION_TYPE.PASSWORD) {
    if (isRequired(val, fieldName) != null) {
      errorMsg = isRequired(val, fieldName);
    } else if (CheckPasswordLength(val ?? null) != null) {
      errorMsg = CheckPasswordLength(val);
    }
  }
  if (fieldType == VALIDATION_TYPE.CONFIRM_PASSWORD) {
    if (isRequired(val, fieldName) != null) {
      errorMsg = isRequired(val, fieldName);
    } else if (CheckPasswordLength(val) != null) {
      errorMsg = CheckPasswordLength(val);
    } else if (password != val) {
      errorMsg = "Confirm password must be same as password";
    }
  }

  return errorMsg ?? null;
}
