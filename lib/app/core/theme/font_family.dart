import 'package:flutter/widgets.dart';

class AppFonts {
  static const String bold      = 'BoldFont';
  static const String regular   = 'RegularFont';
  static const String messaging = 'MessagingFont';

  static TextStyle regularStyle(double fontSize, {Color? color}) {
    return TextStyle(
      fontFamily: regular,
      fontSize: fontSize,
      color: color,
    );
  }

}
