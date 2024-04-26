import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/shared/auth/title_section.dart';

class TopNavigationBar extends CupertinoNavigationBar {
  TopNavigationBar({
    super.key,
    String? previousPageTitle,
    Widget? middle,
    Color backgroundColor = cWhiteColor,
  }) : super(
          previousPageTitle: previousPageTitle ?? "",
          middle: middle ?? titleSection(),
          backgroundColor: backgroundColor,
        );
}
