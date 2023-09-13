import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/shared/continue_with_row.dart';

Widget continueWihSection(Size size) => Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
      continueWith('assets/icons/google_icon.png', size),
      continueWith('assets/icons/facebook_icon.png', size),
      continueWith('assets/icons/x_icon.png', size),
  ],
);