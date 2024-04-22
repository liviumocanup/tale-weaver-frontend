import 'package:flutter/cupertino.dart';
import 'continue_with_row.dart';

Widget continueWihSection(Size size) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        continueWith('assets/icons/google.png', size, () {
          // Google login logic here
        }),
        continueWith('assets/icons/facebook.png', size, () {
          // Facebook login logic here
        }),
        continueWith('assets/icons/twitter.png', size, () {
          // Twitter login logic here
        }),
      ],
    );
