import 'package:flutter/material.dart';
import 'package:stuzonefinal/src/utils/theme/widget_themes/appbar_theme.dart';
import 'package:stuzonefinal/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:stuzonefinal/src/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:stuzonefinal/src/utils/theme/widget_themes/text_field_theme.dart';
import 'package:stuzonefinal/src/utils/theme/widget_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
