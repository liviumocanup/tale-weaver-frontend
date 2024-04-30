import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/router/app_router.gr.dart';
import 'package:tale_weaver/shared/auth/rounded_button.dart';
import 'package:tale_weaver/shared/auth/rounded_input.dart';
import 'package:tale_weaver/views/auth/login/components/forgot_password_section.dart';

class LoginForm extends StatefulWidget {
  final Size size;

  const LoginForm({
    super.key,
    required this.size,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  FocusNode emailUsernameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  late Map<FocusNode, VoidCallback> focusCallbacks;

  @override
  void initState() {
    super.initState();

    focusCallbacks = {
      emailUsernameFocusNode: () =>
          _onFocusChange(emailUsernameFocusNode, emailUsernameString),
      passwordFocusNode: () =>
          _onFocusChange(passwordFocusNode, passwordString),
    };

    emailUsernameFocusNode.addListener(focusCallbacks[emailUsernameFocusNode]!);
    passwordFocusNode.addListener(focusCallbacks[passwordFocusNode]!);
  }

  @override
  void dispose() {
    emailUsernameFocusNode
        .removeListener(focusCallbacks[emailUsernameFocusNode]!);
    passwordFocusNode.removeListener(focusCallbacks[passwordFocusNode]!);

    emailUsernameFocusNode.dispose();
    passwordFocusNode.dispose();

    super.dispose();
  }

  void _onFocusChange(FocusNode node, String fieldName) {
    if (!node.hasFocus) {
      _formKey.currentState?.fields[fieldName]?.validate();
      node.unfocus();
    }
  }

  void pushPage(BuildContext context, user) {
    context.router.replaceAll([LandingRoute(user: user)]);
  }

  @override
  Widget build(BuildContext context) {
    Widget loginButton = Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: RoundedButton(
          color: cPrimaryColor,
          text: logInString,
          press: () {
            if (_formKey.currentState!.validate()) {
              var user = _formKey.currentState!.fields[emailUsernameString]!.value;
              print(user);
            //TODO: make backend request to see if credentials are okay
            pushPage(context, user);
            }
          }),
    );

    Widget emailUsernameInput = RoundedInput(
      iconData: CupertinoIcons.person,
      text: emailUsernameString,
      validator:
          FormBuilderValidators.compose([FormBuilderValidators.required()]),
      focusNode: emailUsernameFocusNode,
    );

    Widget passwordInput = RoundedInput(
      obscureText: true,
      iconData: CupertinoIcons.lock,
      text: passwordString,
      validator:
          FormBuilderValidators.compose([FormBuilderValidators.required()]),
      focusNode: passwordFocusNode,
    );

    return FormBuilder(
      key: _formKey,
      child: SizedBox(
        width: widget.size.width * 0.8,
        child: Column(
          children: [
            emailUsernameInput,
            passwordInput,
            Align(
              alignment: Alignment.centerRight,
              child: forgotPasswordSection(context),
            ),
            loginButton,
          ],
        ),
      ),
    );
  }
}
