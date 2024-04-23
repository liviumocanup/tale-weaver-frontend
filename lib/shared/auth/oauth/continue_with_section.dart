import 'package:flutter/cupertino.dart';
import 'continue_with_row.dart';

Widget continueWihSection(Size size, Function onFacebookLogin) => Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    continueWith('assets/icons/google.png', size, () {
      // Google login logic here
    }),
    continueWith('assets/icons/facebook.png', size, onFacebookLogin),
    continueWith('assets/icons/twitter.png', size, () {
      // Twitter login logic here
    }),
  ],
);
