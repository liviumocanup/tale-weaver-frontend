import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/views/home/tabs/create_new_tab.dart';
import 'package:tale_weaver/views/home/tabs/home_tab.dart';

@RoutePage(name: 'HomeRoute')
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.create),
            label: 'Create New',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book),
            label: 'Library',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return const HomeTabPage();
          case 1:
          // Replace with your Create New page
            return const CreateNewTabPage();
          case 2:
          // Replace with your Library page
            return Container();
          default:
            return const Center(child: Text('Page not found'));
        }
      },
    );
  }
}


