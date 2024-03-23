class Validator {
  static String? validateInput(String? value, {
    bool requireNumeric = false,
    bool requireTenDigits = false,
    bool requireAtLastDigits = false,
    bool requireNotEmpty = false,
    bool requireStartsWith09 = false,
    bool passwordValidation = false,
   bool requireelevenDigits=false,
  }) {
    if (requireNotEmpty && (value == null || value.isEmpty)) {
      return 'يرجى تعبئة الحقل';
    }
    if (requireStartsWith09 && (value == null || !value.startsWith('09'))) {
      return 'يجب أن يبدأ الرقم بـ 09';
    }
    if (requireNumeric && (value == null || !isNumeric(value))) {
      return 'يرجى إدخال أرقام فقط';
    }
    if (requireTenDigits && (value == null || value.length != 10)) {
      return 'يرجى إدخال عشرة أرقام';
    }
    if (requireelevenDigits && (value == null || value.length != 11)) {
      return 'يرجى إدخال احدى عشر رقماً';
    }

    if (passwordValidation) {

      if (!value!.contains(RegExp(r'[A-Z]')) ||
          !value.contains(RegExp(r'[a-z]')) ||
          !value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        return 'يرجى إدخال أحرف كبيرة وصغيرة ورموز';
      }
    }
    if (requireAtLastDigits && (value == null || value.length < 8)) {
      return 'يرجى إدخال 8 أحرف على الأقل';
    }
    return null;
  }

  static bool isNumeric(String? value) {
    if (value == null) {
      return false;
    }
    return double.tryParse(value) != null;
  }

  static bool hasUppercase(String? value) {
    if (value == null) {
      return false;
    }
    return value.contains(RegExp(r'[A-Z]'));
  }

  static bool hasLowercase(String? value) {
    if (value == null) {
      return false;
    }
    return value.contains(RegExp(r'[a-z]'));
  }

  static bool hasSpecialCharacters(String? value) {
    if (value == null) {
      return false;
    }
    return value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }
}