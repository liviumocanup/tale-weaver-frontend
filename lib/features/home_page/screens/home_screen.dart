import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/home_tab_scaffold.dart';

@RoutePage(name: 'Home')
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthenticatedView(child: HomeTabScaffold());
  }
}
