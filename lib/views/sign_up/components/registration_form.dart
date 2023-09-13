import 'package:flutter/material.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/shared/rounded_button.dart';
import 'package:tale_weaver/views/login/components/rounded_input.dart';
import 'package:tale_weaver/views/login/components/rounded_input_password.dart';

class RegistrationForm extends StatefulWidget {
  final Size size;

  const RegistrationForm({
    super.key,
    required this.size,
  });
  
  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm>{
  final _formKey = GlobalKey<FormState>();

  FocusNode emailFocusNode = FocusNode();
  FocusNode usernameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode repeatPasswordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    emailFocusNode.addListener(_onEmailFocusChange);
    usernameFocusNode.addListener(_onUsernameFocusChange);
    passwordFocusNode.addListener(_onPasswordFocusChange);
    repeatPasswordFocusNode.addListener(_onRepeatPasswordFocusChange);
  }


  @override
  void dispose() {
    emailFocusNode.removeListener(_onEmailFocusChange);
    usernameFocusNode.removeListener(_onUsernameFocusChange);
    passwordFocusNode.removeListener(_onPasswordFocusChange);
    repeatPasswordFocusNode.removeListener(_onRepeatPasswordFocusChange);

    emailFocusNode.dispose();
    usernameFocusNode.dispose();
    passwordFocusNode.dispose();
    repeatPasswordFocusNode.dispose();
    super.dispose();
  }


  void _onEmailFocusChange() {
    if (!emailFocusNode.hasFocus) {
      _formKey.currentState?.validate();
    }
  }

  void _onUsernameFocusChange() {
    if (!usernameFocusNode.hasFocus) {
      _formKey.currentState?.validate();
    }
  }

  void _onPasswordFocusChange() {
    if (!passwordFocusNode.hasFocus) {
      _formKey.currentState?.validate();
    }
  }

  void _onRepeatPasswordFocusChange() {
    if (!repeatPasswordFocusNode.hasFocus) {
      _formKey.currentState?.validate();
    }
  }

  String? Function(String?) emailValidator = (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid email.';
    }
    return null;
  };

  String? Function(String?) usernameValidator = (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a username.';
    }
    return null;
  };

  String? Function(String?) passwordValidator = (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password.';
    }
    return null;
  };

  @override
  Widget build(BuildContext context) {

    Widget email = RoundedInput(
      iconData: Icons.email,
      text: 'Email',
      validator: emailValidator,
      focusNode: emailFocusNode,
    );

    Widget username = RoundedInput(
      iconData: Icons.person,
      text: 'Username',
      validator: usernameValidator,
      focusNode: usernameFocusNode,
    );

    Widget password = RoundedInputPassword(
      iconData: Icons.lock,
      text: 'Password',
      validator: passwordValidator,
      focusNode: passwordFocusNode,
    );

    Widget repeatPassword = RoundedInputPassword(
      iconData: Icons.lock_outlined,
      text: 'Repeat your password',
      validator: passwordValidator,
      focusNode: repeatPasswordFocusNode,
    );

    Widget signUpButton = Padding(
      padding: const EdgeInsets.only(bottom: 15, top: 15),
      child: RoundedButton(color: kPrimaryColor, text: 'Sign Up', press: (){})
    );

    return Form(
      key: _formKey,
      child: SizedBox(
        width: widget.size.width * 0.8,
        child: Column(
          children: [
            email,
            username,
            password,
            repeatPassword,
            signUpButton,
          ],
        ),
      ),
    );
  }

}