import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;
  final double width;

  const RoundedButton({
    super.key,
    required this.text,
    required this.press,
    this.width = 175,
    this.color = cPrimaryColor,
    this.textColor = cWhiteColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: press,
          color: color,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ));
  }
}
