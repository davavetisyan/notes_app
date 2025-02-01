import 'package:flutter/material.dart';
import 'package:notes_app/core/config/theme/app_colors.dart';

class AppTheme {
  static ThemeData get standart {
    return ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.mainBgColor,
        appBarTheme: AppBarTheme(
          color: AppColors.mainBgColor,
          
        ),
        fontFamily: 'Nunito');
  }
}
