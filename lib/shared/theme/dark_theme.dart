import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';

CupertinoThemeData lightTheme = CupertinoThemeData(
  brightness: Brightness.light,
  primaryColor: cPrimaryColor,
  primaryContrastingColor: cPrimaryLightColor,
  scaffoldBackgroundColor: CupertinoColors.white,
  barBackgroundColor: cGrayBackground.withOpacity(0.5),
);

CupertinoThemeData darkTheme = CupertinoThemeData(
  brightness: Brightness.dark,
  primaryColor: cPrimaryColor,
  primaryContrastingColor: cPrimaryLightColor,
  scaffoldBackgroundColor: CupertinoColors.black,
  barBackgroundColor: cAlwaysBlackColor.withOpacity(0.5),
);