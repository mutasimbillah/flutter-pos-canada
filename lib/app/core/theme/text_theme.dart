import 'package:flutter/material.dart';

abstract class CustomTextTheme {
  static const TextStyle header = TextStyle(
    fontSize: 30,
    letterSpacing: 1.5,
    height: 1,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    letterSpacing: 1,
    height: 1,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle footer = TextStyle(
    fontSize: 18,
    letterSpacing: 1,
    height: 1,
    fontWeight: FontWeight.w600,
  );
}
