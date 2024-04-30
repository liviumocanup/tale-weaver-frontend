import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:tale_weaver/router/app_router.gr.dart';
import 'package:tale_weaver/shared/auth/rounded_button.dart';
import 'package:tale_weaver/shared/auth/rounded_input.dart';

class ContentStudioForm extends StatefulWidget {
  final Size size;

  const ContentStudioForm({
    super.key,
    required this.size,
  });

  @override
  State<ContentStudioForm> createState() => _ContentStudioFormState();
}

class _ContentStudioFormState extends State<ContentStudioForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  FocusNode descriptionFocusNode = FocusNode();

  late Map<FocusNode, VoidCallback> focusCallbacks;

  @override
  void initState() {
    super.initState();

    focusCallbacks = {
      descriptionFocusNode: () =>
          _onFocusChange(descriptionFocusNode, 'Description'),
    };

    descriptionFocusNode.addListener(focusCallbacks[descriptionFocusNode]!);
  }

  @override
  void dispose() {
    descriptionFocusNode.removeListener(focusCallbacks[descriptionFocusNode]!);

    descriptionFocusNode.dispose();

    super.dispose();
  }

  void _onFocusChange(FocusNode node, String fieldName) {
    if (!node.hasFocus) {
      _formKey.currentState?.fields[fieldName]?.validate();
      node.unfocus();
    }
  }

  void pushPage(BuildContext context, String description) {
    context.router.replaceAll([CreateNewStoryRoute(description: description)]);
  }

  @override
  Widget build(BuildContext context) {
    Widget generateButton = Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: RoundedButton(
          color: CupertinoColors.activeGreen,
          text: 'Generate',
          press: () {
            if (_formKey.currentState!.validate()) {
              pushPage(context, _formKey.currentState!.fields['Description']!.value);
            }
          }),
    );

    Widget descriptionInput = RoundedInput(
      text: 'Description',
      validator:
          FormBuilderValidators.compose([FormBuilderValidators.required()]),
      focusNode: descriptionFocusNode,
    );

    return FormBuilder(
      key: _formKey,
      child: SizedBox(
        width: widget.size.width * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            descriptionInput,
            const SizedBox(height: 20),
            generateButton,
          ],
        ),
      ),
    );
  }
}
