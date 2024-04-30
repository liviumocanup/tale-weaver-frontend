import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';

// class TitleSection extends StatelessWidget {
//   final String title;
//
//   const TitleSection({
//     super.key,
//     required this.title,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return titleSection();
//   }
// }

Widget titleSection() => const Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: cPrimaryColor,
        fontSize: 25,
      ),
    );
