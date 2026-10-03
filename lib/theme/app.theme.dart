import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myerp/theme/app.colors.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.bg(false),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.appColor,
      brightness: Brightness.light,
    ),
  );

  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.bg(true),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.appColor,
      brightness: Brightness.dark,
    ),
  );
}

class ThemeController extends GetxController {
  final RxBool isDark = false.obs;

  void toggle(bool value) {
    isDark.value = value;
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
  }
}
