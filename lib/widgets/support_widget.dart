import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle boldTextStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle lightTextStyle() {
    return TextStyle(
      color: Colors.black54,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle lightSmallTextStyle() {
    return TextStyle(
      color: Colors.black54,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle semiBoldTextStyle() {
    return TextStyle(
      color: Colors.black87,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle btnTextStyle() {
    return TextStyle(
      color: Colors.black87,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    );
  }
}
