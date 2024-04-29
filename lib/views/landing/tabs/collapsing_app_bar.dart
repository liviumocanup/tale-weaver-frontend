import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/router/app_router.gr.dart';
import 'package:tale_weaver/shared/auth/title_section.dart';

class CollapsingAppBar extends StatelessWidget {
  const CollapsingAppBar({super.key});

  void pushPage(BuildContext context, PageRouteInfo newPageRoute) {
    context.router.push(newPageRoute);
  }

  @override
  Widget build(BuildContext context) {
    Widget notifications = IconButton(
      icon: const Icon(CupertinoIcons.bell),
      onPressed: () {
        // TODO: Navigate to notifications
      },
    );

    Widget account = IconButton(
      icon: const Icon(CupertinoIcons.person_crop_circle),
      onPressed: () => pushPage(context, const AccountRoute()),
    );

    return SliverAppBar(
      backgroundColor: cWhiteColor,
      floating: true,
      snap: true,
      title: titleSection(),
      centerTitle: false,
      actions: <Widget>[notifications, account],
    );
  }
}
