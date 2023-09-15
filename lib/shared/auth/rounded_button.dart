import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tale_weaver/constants.dart';

class RoundedButton extends StatelessWidget{
  final String text;
  final VoidCallback press;
  final Color color, textColor;

  const RoundedButton({
    super.key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  });
  
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: CupertinoButton(
        onPressed: press,
        color: color,
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      )
    );
  }

  
}