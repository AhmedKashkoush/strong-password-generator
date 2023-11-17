import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:strong_password_generator/Core/Services/password_generator.dart';

class HomeController extends GetxController {
  final TextEditingController passwordController = TextEditingController();
  final PasswordGenerator _generator = PasswordGenerator();

  bool _obsecured = true;
  bool get obsecured => _obsecured;
  bool _isUpperCase = true;
  bool get isUpperCase => _isUpperCase;
  bool _isLowerCase = true;
  bool get isLowerCase => _isLowerCase;
  bool _isNumbers = true;
  bool get isNumbers => _isNumbers;
  bool _isSymbols = true;
  bool get isSymbols => _isSymbols;

  double _length = 8;
  double get length => _length;

  void togglePassword() {
    _obsecured = !_obsecured;
    update();
  }

  void toggleUpperCase(bool? value) {
    _isUpperCase = !_isUpperCase;
    update();
  }

  void toggleLowerCase(bool? value) {
    _isLowerCase = !_isLowerCase;
    update();
  }

  void toggleNumbers(bool? value) {
    _isNumbers = !_isNumbers;
    update();
  }

  void toggleSymbols(bool? value) {
    _isSymbols = !_isSymbols;
    update();
  }

  void changeLength(double value) {
    _length = value;
    update();
  }

  void copy() {
    final ClipboardData data = ClipboardData(text: passwordController.text);
    Clipboard.setData(data);
    Get.rawSnackbar(
      message: 'Password Copied',
    );
  }

  void generate() {
    passwordController.text = _generator.makePassword(
      length: _length.toInt(),
      upperCase: _isUpperCase,
      lowerCase: _isLowerCase,
      numbers: _isNumbers,
      symbols: _isSymbols,
    );
    update();
  }
}
