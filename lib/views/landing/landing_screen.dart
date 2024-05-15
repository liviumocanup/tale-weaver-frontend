import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/views/landing/tabs/custom_tab_scaffold.dart';

@RoutePage(name: 'LandingRoute')
class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomTabScaffold();
  }
}
