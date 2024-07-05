import 'package:flutter/material.dart';
import 'package:s_shoping_app/utils/constants/colors.dart';
import 'package:s_shoping_app/utils/constants/sizes.dart';

class CAppBarTheme {
  CAppBarTheme._();

  /* LIGHT APPBAR THEME */
  static const lightTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: CColors.transparent,
    surfaceTintColor: CColors.transparent,
    iconTheme: IconThemeData(color: CColors.mainBlack, size: CSizes.iconLg),
    actionsIconTheme: IconThemeData(color: CColors.mainBlack, size: CSizes.iconLg),
    titleTextStyle: TextStyle(
      fontSize: CSizes.fontSizeLg,
      // fontWeight: FontWeight.w600,
      color: CColors.mainBlack,
    ),
  );

//   /* DARK APPBAR THEME */
//   static const darkTheme = AppBarTheme(
//     elevation: 0,
//     centerTitle: false,
//     scrolledUnderElevation: 0,
//     backgroundColor: BColors.transparent,
//     surfaceTintColor: BColors.transparent,
//     iconTheme: IconThemeData(color: BColors.black, size: BSizes.iconLg),
//     actionsIconTheme: IconThemeData(color: BColors.white, size: BSizes.iconLg),
//     titleTextStyle: TextStyle(
//       fontSize: BSizes.fontSizeLg,
//       fontWeight: FontWeight.w600,
//       color: BColors.white,
//     ),
//   );
}

