import 'package:flutter/material.dart';
import 'package:flutter_pos/app/core/theme/color_manager.dart';

class CustomInputDecoration {
  static InputDecoration get({
    required IconData icon,
    required String label,
  }) {
    return InputDecoration(
      prefixIcon: Icon(icon),
      fillColor: ColorManager.SECONDARY,
      filled: true,
      labelText: label,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.SECONDARY,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.SECONDARY,
        ),
      ),
    );
  }
}
