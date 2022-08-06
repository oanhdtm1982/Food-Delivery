import 'package:flutter/material.dart';

/// Adds an useful localization method on a [BuildContext]
extension LocalizationExt on BuildContext {
  String localize(String value) {
    final code = AppLocalization.of(this).locale.languageCode;
    final database = AppLocalization._localizedValues;

    if (database.containsKey(code)) {
      return database[code]?[value] ?? "-";
    } else {
      return database["en"]?[value] ?? "-";
    }
  }
}

/// This class is responsible of translating strings into a certain
/// languages defined by the [Locale] passed in the constructor.
class AppLocalization {
  final Locale locale;
  const AppLocalization(this.locale);

  static AppLocalization of(BuildContext context) =>
      Localizations.of<AppLocalization>(context, AppLocalization)!;

  static Map<String, Map<String, String>> _localizedValues = {
    "en": {
      "title": "Login app",
      "login": "Login",
      "register": "Register",
      "welcome": "Welcome!",
      "invalid_field": "Invalid value",
      "error_login": "Error while logging in",
      "error_register": "Error while registering",
      "username": "Username",
      "password": "Password",
      "error_firebase": "Couldn't load Firebase",
    },
    "vi": {
      "title": "Login app",
      "login": "Đăng nhập",
      "register": "Đăng ký",
      "welcome": "Xin chào!",
      "invalid_field": "Không hợp lệ",
      "error_login": "Lỗi đăng nhập",
      "error_register": "Lỗi đăng ký",
      "username": "Tên",
      "password": "Mật khẩu",
      "error_firebase": "Không thể kết nối đến Firebase",
    },
  };
}
