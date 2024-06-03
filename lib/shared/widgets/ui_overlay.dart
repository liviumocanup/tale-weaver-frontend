import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tale_weaver/shared/theme/dark_theme.dart';
import 'package:tale_weaver/shared/theme/theme_manager.dart';

import '../../constants.dart';

SystemUiOverlayStyle uiOverlay(BuildContext context) {
  final themeManager = Provider.of<ThemeManager>(context, listen: false);

  return SystemUiOverlayStyle(
    statusBarColor: themeManager.isDarkMode ? cAlwaysBlackColor.withOpacity(0.5) : cGrayBackground.withOpacity(0.5),
    statusBarIconBrightness: themeManager.isDarkMode ? Brightness.light : Brightness.dark,
    statusBarBrightness: themeManager.isDarkMode ? Brightness.light : Brightness.dark,
  );
}