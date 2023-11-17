import 'dart:math';

import 'package:flutter/material.dart';

class PasswordGenerator {
  final String _strUpper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final String _strLower = 'abcdefghijklmnopqrstuvwxyz';
  final String _strNumbers = '1234567890';
  final String _strSymbols = '~!@#\$%^&*()_-=+/\'";:<>,.?\\';

  String makePassword({
    int length = 8,
    bool upperCase = true,
    bool lowerCase = true,
    bool numbers = true,
    bool symbols = true,
  }) {
    String seed = '';
    if (!upperCase && !lowerCase && !numbers && !symbols) return '';
    if (upperCase) seed += _strUpper;
    if (lowerCase) seed += _strLower;
    if (numbers) seed += _strNumbers;
    if (symbols) seed += _strSymbols;
    final String password = List.generate(length, (_) {
      final int index = Random.secure().nextInt(seed.length);
      return seed.characters.elementAt(index);
    }).join('');
    return password;
  }
}
