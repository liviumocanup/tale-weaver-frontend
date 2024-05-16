import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/features/welcome/widgets/push_page_func.dart';
import 'package:tale_weaver/router/app_router.gr.dart';
import 'package:tale_weaver/shared/widgets/app_title.dart';

class CollapsingAppBar extends StatelessWidget {
  const CollapsingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    Widget notifications = CupertinoButton(
      padding: EdgeInsets.zero,
      child: const Icon(CupertinoIcons.bell),
      onPressed: () {
        // TODO: Navigate to notifications
      },
    );

    Widget account = CupertinoButton(
      padding: const EdgeInsets.only(right: 15),
      child: const Icon(CupertinoIcons.person_crop_circle_fill),
      onPressed: () => pushPage(context, const AccountRoute()),
    );

    return SliverAppBar(
      backgroundColor: cWhiteColor,
      floating: true,
      snap: true,
      title: const AppTitle(),
      centerTitle: false,
      actions: <Widget>[notifications, account],
    );
  }
}
