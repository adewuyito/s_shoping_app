import 'package:flutter/material.dart';

@immutable
class CHelperFunctions {
  static void showSnackBar(String message, {required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static void showAlert({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            )
          ],
        );
      },
    );
  }

  static String truncateString({
    required String text,
    required int maxLenght,
  }) {
    if (text.length <= maxLenght) {
      return text;
    } else {
      return '${text.substring(0, maxLenght)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize({required BuildContext context}) {
    return MediaQuery.of(context).size;
  }

  static double screenHeight({required BuildContext context}) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth({required BuildContext context}) {
    return MediaQuery.of(context).size.width;
  }

  const CHelperFunctions._();
}
