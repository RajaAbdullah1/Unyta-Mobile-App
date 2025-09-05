import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_border_radius.dart';
import '../styles/app_colors.dart';
import '../styles/app_paddings.dart';
import '../styles/app_text_styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,

    appBarTheme: AppBarTheme(
      color: AppColors.background,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
    ),

    fontFamily: 'Walsheim',


//************************ Color Theme ***************************
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.primaryLight,

      secondary: AppColors.textPrimary,
      onSecondary: AppColors.textSecondary,

      surfaceDim: AppColors.border,
      surface: AppColors.white,
      surfaceContainerHighest: AppColors.blackDark,
      surfaceBright: AppColors.background,

      onSurface: AppColors.textPrimary,

      error: AppColors.error,
      onError: AppColors.white,

      // Extra (custom mapping)
      onSecondaryFixed: AppColors.success,
    ),

//************************ Text Theming ***************************
    textTheme: const TextTheme(
      headlineLarge: AppTextStyles.headlineLarge,
      headlineMedium: AppTextStyles.headlineMedium,
      headlineSmall: AppTextStyles.headlineSmall,
      titleLarge: AppTextStyles.titleLarge,
      titleMedium: AppTextStyles.titleMedium,
      titleSmall: AppTextStyles.titleSmall,
      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.bodyMedium,
      bodySmall: AppTextStyles.bodySmall,
      labelLarge: AppTextStyles.labelLarge,
      labelMedium: AppTextStyles.labelMedium,
      labelSmall: AppTextStyles.labelSmall,
    ),

//************************ Elevated Button Theming ***************************
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: WidgetStateProperty.resolveWith<double>((states) {
          if (states.contains(WidgetState.hovered))
            return 0; // Hover pe bhi no shadow
          if (states.contains(WidgetState.pressed)) return 0;
          return 0; // Default
        }),
        backgroundColor: WidgetStateProperty.all(AppColors.primary),
        foregroundColor: WidgetStateProperty.all(Colors.white),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: AppBorderRadius.roundedLarge,
            side: const BorderSide(color: AppColors.primary),
          ),
        ),
        textStyle: WidgetStateProperty.all(
          const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Walsheim',
          ),
        ),
        minimumSize: WidgetStateProperty.all(const Size(double.infinity, 50)),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    ),

//************************ TextField Theming ***************************
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        fontSize: 16,
        color: AppColors.textSecondary,
        fontWeight: FontWeight.bold,
      ),
      filled: true,
      fillColor: Colors.transparent,
      border: OutlineInputBorder(
        borderRadius: AppBorderRadius.roundedLarge,
        borderSide: BorderSide(color: AppColors.textFieldBorder, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppBorderRadius.roundedLarge,
        borderSide: BorderSide(color: AppColors.textFieldBorder, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppBorderRadius.roundedLarge,
        borderSide: BorderSide(color: AppColors.textFieldBorder, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: AppBorderRadius.roundedLarge,
        borderSide: BorderSide(color: AppColors.error, width: 1),
      ),
      prefixIconColor: Colors.grey,
      suffixIconColor: Colors.grey,
    ),

//************************ BottomSheet Theming ***************************
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.background,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      elevation: 8,
      modalElevation: 12,
      clipBehavior: Clip.antiAliasWithSaveLayer,
    ),

//************************ List Tile Theming ***************************
    listTileTheme: ListTileThemeData(
      contentPadding: AppPaddings.all16,
      shape: RoundedRectangleBorder(
        borderRadius: AppBorderRadius.roundedMedium,
        side: BorderSide(
          color: AppColors.border,
        ),
      ),
      tileColor: AppColors.white,
      minTileHeight: 0,
      minLeadingWidth: 0,
      minVerticalPadding: 0,
      iconColor: AppColors.textSecondary,
      textColor: AppColors.textPrimary,
    ),

    //************************Bottom Nav Theming***************************
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.black,
      unselectedItemColor: AppColors.textSecondary,
      selectedLabelStyle: AppTextStyles.labelMedium.copyWith(fontWeight: FontWeight.w600, color: AppColors.black),
      unselectedLabelStyle: AppTextStyles.labelMedium.copyWith(color: AppColors.textSecondary),
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
  );
  static double bottomNavIconSize = 24.0;

}
