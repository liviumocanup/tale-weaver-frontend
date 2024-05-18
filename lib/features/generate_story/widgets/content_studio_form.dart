import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tale_weaver/constants.dart';

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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Widget generateButton = Container(
      margin: const EdgeInsets.all(12),
      width: widget.size.width * 0.5,
      child: CupertinoButton.filled(
        child: const Text(csGenerateString),
        onPressed: () {
          final form = _formKey.currentState!;

          if (form.validate()) {
            // form.save();
            // context.router.push(StoryDetailRoute(description: form.value[csDescriptionString]));
          }
        },
      ),
    );

    Widget descriptionRow = CupertinoFormRow(
          prefix: const Text(csDescriptionString),
          child: CupertinoTextFormFieldRow(
            placeholder: csDescriptionString,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return csDescriptionErrorString;
              }
              return null;
            },
            keyboardType: TextInputType.multiline,
            maxLines: null,
          ),
        );

    Widget locationRow = CupertinoFormRow(
      prefix: const Text(csLocationString),
      child: CupertinoTextFormFieldRow(
        placeholder: '$csLocationString*',
        textInputAction: TextInputAction.next,
      ),
    );

    Widget narratorRow = CupertinoFormRow(
      prefix: const Text(csNarratorString),
      child: CupertinoTextFormFieldRow(
        placeholder: '$csNarratorString*',
      ),
    );

    return Form(
      key: _formKey,
      child: SizedBox(
        width: widget.size.width,
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            CupertinoFormSection.insetGrouped(
              margin: const EdgeInsets.all(12),
              header: const Text(csStoryDetailsString),
              footer: const Divider(),
              children: [
                descriptionRow,
                locationRow,
              ],
            ),
            CupertinoFormSection.insetGrouped(
              header: const Text(csNarratorSettingsString),
              margin: const EdgeInsets.all(12),
              children: [
                narratorRow,
              ],
            ),
            generateButton,
          ],
        ),
      ),
    );
  }
}
