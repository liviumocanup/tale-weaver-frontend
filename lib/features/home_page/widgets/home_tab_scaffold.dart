import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/features/generate_story/screens/content_studio.dart';
import 'package:tale_weaver/features/home_tab/screens/home_tab_screen.dart';

class HomeTabScaffold extends StatefulWidget {
  final String user;

  const HomeTabScaffold({super.key, required this.user});

  @override
  State<HomeTabScaffold> createState() => _HomeTabScaffoldState();
}

class _HomeTabScaffoldState extends State<HomeTabScaffold> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<BottomNavigationBarItem> _items = [
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home), label: homeString),
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.create), label: contentStudioString),
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.book), label: libraryString)
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        backgroundColor: cWhiteColor,
        items: _items,
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 1:
            return CupertinoTabView(
              builder: (context) => const ContentStudio(),
            );
          case 2:
            return CupertinoTabView(
              builder: (context) => Container(),
            );
          case 0:
          default:
            return CupertinoTabView(
              builder: (context) => HomeTabPage(user: widget.user),
            );
        }
      },
    );
  }
}
