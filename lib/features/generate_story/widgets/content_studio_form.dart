import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/shared/widgets/push_page_func.dart';
import 'package:tale_weaver/router/app_router.gr.dart';

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
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _narratorController =
      TextEditingController(text: voices.keys.elementAt(3));
  final List<String> _voiceNames = voices.keys.toList();

  void _showVoicePicker() {
    int selectedIndex = _voiceNames.indexOf(_narratorController.text);
    if (selectedIndex == -1) selectedIndex = 3;
    var pickerController =
        FixedExtentScrollController(initialItem: selectedIndex);

    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext builder) => Container(
        height: MediaQuery.of(context).size.height * 0.3,
        padding: const EdgeInsets.only(top: 6),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SafeArea(
          top: false,
          child: CupertinoPicker(
            magnification: 1.2,
            squeeze: 1.2,
            itemExtent: 32.0,
            backgroundColor:
                CupertinoColors.systemBackground.resolveFrom(context),
            scrollController: pickerController,
            onSelectedItemChanged: (int index) {
              _narratorController.text = _voiceNames[index];
            },
            children: List<Widget>.generate(_voiceNames.length, (int index) {
              return Center(child: Text(_voiceNames[index]));
            }),
          ),
        ),
      ),
    );
  }

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
            String description = _descriptionController.text;
            String voiceId = voices[_narratorController.text] ?? '';
            pushPage(
                context,
                StudioPlayerRoute(
                  description: description,
                  voiceId: voiceId,
                ));
          }
        },
      ),
    );

    Widget descriptionRow = CupertinoFormRow(
      prefix: const Text(csDescriptionString),
      child: CupertinoTextFormFieldRow(
        keyboardAppearance: cLightBrightness,
        controller: _descriptionController,
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
        keyboardAppearance: cLightBrightness,
        placeholder: '$csLocationString*',
        textInputAction: TextInputAction.next,
      ),
    );

    Widget narratorRow = CupertinoFormRow(
      prefix: const Text(csNarratorString),
      child: CupertinoTextFormFieldRow(
        keyboardAppearance: cLightBrightness,
        placeholder: csNarratorPhString,
        readOnly: true,
        controller: _narratorController,
        onTap: () => _showVoicePicker(),
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
              backgroundColor: cGrayBackground,
              margin: const EdgeInsets.all(12),
              header: const Text(csStoryDetailsString,
                  style: TextStyle(color: cGrayColor)),
              footer: const Divider(),
              children: [
                descriptionRow,
                locationRow,
              ],
            ),
            CupertinoFormSection.insetGrouped(
              backgroundColor: cGrayBackground,
              header: const Text(csNarratorSettingsString,
                  style: TextStyle(color: cGrayColor)),
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
