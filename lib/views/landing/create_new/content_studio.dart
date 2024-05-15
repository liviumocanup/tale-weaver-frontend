import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/views/landing/create_new/components/content_studio_form.dart';

class ContentStudio extends StatelessWidget {
  const ContentStudio({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.2),
            ContentStudioForm(size: size),
          ],
        ),
      ),
    );
  }
}
