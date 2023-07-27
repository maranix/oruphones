import 'package:flutter/material.dart';

import 'colors.dart';

final oruTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: OruColors.primary,
    iconTheme: IconThemeData(color: OruColors.appBarIcon),
  ),
  cardTheme: const CardTheme(
    elevation: 0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      elevation: 0,
      foregroundColor: Colors.grey,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            5,
          ),
        ),
        side: BorderSide(
          color: Colors.grey,
          width: 1.5,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16),
    ),
  ),
);
