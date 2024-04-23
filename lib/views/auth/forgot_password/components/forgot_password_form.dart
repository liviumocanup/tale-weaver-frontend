import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/shared/auth/rounded_button.dart';
import 'package:tale_weaver/shared/auth/rounded_input.dart';

class ForgotPasswordForm extends StatefulWidget {
  final Size size;

  const ForgotPasswordForm({
    super.key,
    required this.size,
  });

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  FocusNode emailFocusNode = FocusNode();

  late Map<FocusNode, VoidCallback> focusCallbacks;

  @override
  void initState() {
    super.initState();

    focusCallbacks = {
      emailFocusNode: () => _onFocusChange(emailFocusNode, emailString),
    };

    emailFocusNode.addListener(focusCallbacks[emailFocusNode]!);
  }

  @override
  void dispose() {
    emailFocusNode.removeListener(focusCallbacks[emailFocusNode]!);

    emailFocusNode.dispose();

    super.dispose();
  }

  void _onFocusChange(FocusNode node, String fieldName) {
    if (!node.hasFocus) {
      _formKey.currentState?.fields[fieldName]?.validate();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget resetButton = Padding(
        padding: const EdgeInsets.only(top: 15),
        child: RoundedButton(
            color: kPrimaryColor,
            text: 'Reset',
            press: () {
              _formKey.currentState?.validate();
            }));

    return FormBuilder(
      key: _formKey,
      child: SizedBox(
        width: widget.size.width * 0.8,
        child: Column(
          children: [
            RoundedInput(
              iconData: CupertinoIcons.mail,
              text: emailString,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                    errorText: '$emailString is required.')
              ]),
              focusNode: emailFocusNode,
            ),
            resetButton,
          ],
        ),
      ),
    );
  }
}
