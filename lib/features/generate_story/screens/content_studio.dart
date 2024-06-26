import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/shared/widgets/app_title.dart';

import '../widgets/content_studio_form.dart';

class ContentStudio extends StatelessWidget {
  const ContentStudio({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return CupertinoPageScaffold(
      backgroundColor: cGrayBackground,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: cGrayBackground,
        middle: AppTitle(),
      ),
      child: ContentStudioForm(size: size),
    );
  }
}
