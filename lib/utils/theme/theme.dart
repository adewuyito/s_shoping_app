import 'package:flutter/material.dart';
import 'package:s_shoping_app/utils/constants/colors.dart';
import 'package:s_shoping_app/utils/theme/custom_theme/appbar_theme.dart';

class BAppTheme {
  BAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: CColors.mainBlack,
    scaffoldBackgroundColor: CColors.mainBody,
    // textTheme: BTextTheme.lightTextTheme,
    // elevatedButtonTheme: BElevatedButtonTheme.lightTheme,
    appBarTheme: CAppBarTheme.lightTheme,
    // bottomSheetTheme: BBottomSheetTheme.lightTheme,
    // checkboxTheme: BCheckBoxTheme.lightTheme,
    // chipTheme: BChipTheme.lightTheme,
    // outlinedButtonTheme: BOutlinedButtonTheme.lightTheme,
    // inputDecorationTheme: BTextField.lightTheme
  );

  // static ThemeData darkTheme = ThemeData(
  //   useMaterial3: true,
  //   // fontFamily: ,
  //   brightness: Brightness.dark,
  //   primaryColor: BColors.primary,
  //   scaffoldBackgroundColor: Colors.black,
  //   textTheme: BTextTheme.darkTextTheme,
  //   elevatedButtonTheme: BElevatedButtonTheme.darkTheme,
  //   appBarTheme: BAppBarTheme.darkTheme,
  //   bottomSheetTheme: BBottomSheetTheme.darkTheme,
  //   checkboxTheme: BCheckBoxTheme.darkTheme,
  //   chipTheme: BChipTheme.darkTheme,
  //   outlinedButtonTheme: BOutlinedButtonTheme.darkTheme,
  //   inputDecorationTheme: BTextField.darkTheme
  // );
}
