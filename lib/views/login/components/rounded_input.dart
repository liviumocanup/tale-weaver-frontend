import 'package:flutter/material.dart';
import 'package:tale_weaver/constants.dart';

class RoundedInput extends StatelessWidget{
  final IconData iconData;
  final String text;
  final Color iconColor;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;

  const RoundedInput({
    super.key,
    required this.iconData,
    required this.text,
    this.validator,
    this.focusNode,
    this.iconColor = kPrimaryColor,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        validator: validator,
        focusNode: focusNode,
        decoration: InputDecoration(
          icon: Icon(iconData, color: iconColor),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          labelText: text,
        ),
      ),
    );
  }

}