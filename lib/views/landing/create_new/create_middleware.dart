import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tale_weaver/views/landing/create_new/create_new_tab.dart';

import 'components/custom_tab_middle.dart';
import 'components/fullscreen_state.dart';

@RoutePage(name: 'CreateNewStoryRoute')
class CreateNewMiddle extends StatelessWidget {
  final String description;

  const CreateNewMiddle({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FullscreenState>(
      create: (_) => FullscreenState(),
      child: CupertinoPageScaffold(
        child: CustomTabMiddleScaffold(
          description: description,
        ),
      ),
    );
  }
}
