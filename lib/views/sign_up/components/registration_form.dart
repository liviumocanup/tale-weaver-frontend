import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/shared/auth/rounded_button.dart';
import 'package:tale_weaver/shared/auth/rounded_input.dart';
import 'package:tale_weaver/views/sign_up/components/auth_validators.dart';

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
  final _formKey = GlobalKey<FormBuilderState>();

  FocusNode emailFocusNode = FocusNode();
  FocusNode usernameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode repeatPasswordFocusNode = FocusNode();

  late Map<FocusNode, VoidCallback> focusCallbacks;

  @override
  void initState() {
    super.initState();

    focusCallbacks = {
      emailFocusNode: () => _onFocusChange(emailFocusNode, emailString),
      usernameFocusNode: () => _onFocusChange(usernameFocusNode, usernameString),
      passwordFocusNode: () => _onFocusChange(passwordFocusNode, passwordString),
      repeatPasswordFocusNode: () => _onFocusChange(repeatPasswordFocusNode, repeatPassString),
    };

    emailFocusNode.addListener(focusCallbacks[emailFocusNode]!);
    usernameFocusNode.addListener(focusCallbacks[usernameFocusNode]!);
    passwordFocusNode.addListener(focusCallbacks[passwordFocusNode]!);
    repeatPasswordFocusNode.addListener(focusCallbacks[repeatPasswordFocusNode]!);
  }


  @override
  void dispose() {
    emailFocusNode.removeListener(focusCallbacks[emailFocusNode]!);
    usernameFocusNode.removeListener(focusCallbacks[usernameFocusNode]!);
    passwordFocusNode.removeListener(focusCallbacks[passwordFocusNode]!);
    repeatPasswordFocusNode.removeListener(focusCallbacks[repeatPasswordFocusNode]!);

    emailFocusNode.dispose();
    usernameFocusNode.dispose();
    passwordFocusNode.dispose();
    repeatPasswordFocusNode.dispose();

    super.dispose();
  }

  void _onFocusChange(FocusNode node, String fieldName) {
    if (!node.hasFocus) {
      _formKey.currentState?.fields[fieldName]?.validate();
    }
  }

  @override
  Widget build(BuildContext context) {

    Widget email = RoundedInput(
      iconData: Icons.email,
      text: emailString,
      validator: emailValidator,
      focusNode: emailFocusNode,
    );

    Widget username = RoundedInput(
      iconData: Icons.person,
      text: usernameString,
      validator: usernameValidator,
      focusNode: usernameFocusNode,
    );

    Widget password = RoundedInput(
      obscureText: true,
      iconData: Icons.lock,
      text: passwordString,
      validator: passwordValidator,
      focusNode: passwordFocusNode,
    );

    Widget repeatPassword = RoundedInput(
      obscureText: true,
      iconData: Icons.lock_outlined,
      text: repeatPassString,
      validator: repeatPasswordValidator(_formKey),
      focusNode: repeatPasswordFocusNode,
    );

    handleSignUp() {
      if (_formKey.currentState?.saveAndValidate() ?? false) {
        // Handle successful validation
        var email = _formKey.currentState?.fields[emailString]?.value;
        var username = _formKey.currentState?.fields[usernameString]?.value;
        var password = _formKey.currentState?.fields[passwordString]?.value;
        var repeatPassword = _formKey.currentState?.fields[repeatPassString]?.value;

        // send request to backend to check existance
      }
    }

    Widget signUpButton = Padding(
      padding: const EdgeInsets.only(bottom: 15, top: 15),
      child: RoundedButton(color: kPrimaryColor, text: 'Sign Up', press: handleSignUp)
    );

    return FormBuilder(
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