import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:tale_weaver/constants.dart';

class RoundedInput extends StatefulWidget {
  final IconData iconData;
  final String text;
  final Color iconColor;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final bool obscureText;

  const RoundedInput({
    super.key,
    required this.iconData,
    required this.text,
    this.validator,
    this.focusNode,
    this.iconColor = cPrimaryColor,
    this.obscureText = false,
  });

  @override
  State<RoundedInput> createState() => _RoundedInputState();
}

class _RoundedInputState extends State<RoundedInput> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  void _toggleVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Material(
          type: MaterialType.transparency,
          child: FormBuilderTextField(
            name: widget.text,
            obscureText: _isObscured,
            validator: FormBuilderValidators.compose(
                [widget.validator ?? (value) => null]),
            focusNode: widget.focusNode,
            decoration: InputDecoration(
              icon: Icon(widget.iconData, color: widget.iconColor),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              suffixIcon: widget.obscureText
                  ? CupertinoButton(
                      onPressed: _toggleVisibility,
                      child: Icon(
                          _isObscured
                              ? CupertinoIcons.eye
                              : CupertinoIcons.eye_slash,
                          color: widget.iconColor),
                    )
                  : null,
              labelText: widget.text,
            ),
          ),
        ));
  }
}
