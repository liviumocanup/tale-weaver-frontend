import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';

class AppTitle extends StatelessWidget {
  final double size;

  const AppTitle({
    super.key,
    this.size = 25,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: cPrimaryColor,
        fontSize: size,
      ),
    );
  }
}
