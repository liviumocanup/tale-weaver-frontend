import 'package:flutter/material.dart';
import 'package:tale_weaver/constants.dart';

class RoundedInputPassword extends StatefulWidget{
  final IconData iconData;
  final String text;
  final Color iconColor;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;

  const RoundedInputPassword({
    super.key,
    required this.iconData,
    required this.text,
    this.validator,
    this.focusNode,
    this.iconColor = kPrimaryColor,
  });

  @override
  State<RoundedInputPassword> createState() => _RoundedInputPasswordState();
}

class _RoundedInputPasswordState extends State<RoundedInputPassword>{
  bool _isObscured = true;

  void _toggleVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        obscureText: _isObscured,
        validator: widget.validator,
        focusNode: widget.focusNode,
        decoration: InputDecoration(
          icon: Icon(widget.iconData, color: widget.iconColor),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          suffixIcon: IconButton(
            onPressed: _toggleVisibility,
            icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off, color: widget.iconColor),
          ),
          labelText: widget.text,
        ),
      ),
    );
  }

}