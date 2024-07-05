import 'package:flutter/material.dart';

extension ToTextWidget on String {
  Widget toText({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    bool baseline = false,
  }) {
    if (baseline) {
      return Text(
        this,
        style: TextStyle(
          textBaseline: TextBaseline.alphabetic,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      );
    } else {
      return Text(
        this,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      );
    }
  }
}
