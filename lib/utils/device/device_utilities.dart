import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@immutable
class CDeviceUtils {
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: color));
  }

  static double getKeyboardHeight(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets;
    return viewInsets.bottom;
  }

  static Future<bool> isKeyboardVisible(BuildContext context) async {
    final viewInsets = MediaQuery.of(context).viewInsets;
    return viewInsets.bottom > 0;
  }

  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  }

  static Future<bool> hasInternetConnection() async {
    try {
      final results = await InternetAddress.lookup("google.com");
      return results.isNotEmpty && results[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  /* Uninitialised side */
  /* static void lunchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'could not lunch $url';
    }
  }
  */
  static bool isIOS() => Platform.isIOS;

  static bool isAndroid() => Platform.isAndroid;

  static double getScreenHeight(BuildContext context) => MediaQuery.of(context).size.height;

  static double getScreenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  static double getStatusBarHeight(BuildContext context) => MediaQuery.of(context).padding.top;

  static double getBottomNavigationBarHeight() => kBottomNavigationBarHeight;

  static double getAppBarHeight() => kToolbarHeight;

  const CDeviceUtils._();
}
