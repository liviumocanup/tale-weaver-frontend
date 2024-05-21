import 'package:flutter/cupertino.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/features/generate_story/screens/content_studio.dart';
import 'package:tale_weaver/features/home_tab/screens/home_tab_screen.dart';
import 'package:tale_weaver/features/library_tab/screens/library_screen.dart';
import 'package:tale_weaver/utils/auth_util.dart';
import 'package:tale_weaver/utils/logger.dart';

class HomeTabScaffold extends StatefulWidget {
  const HomeTabScaffold({super.key});

  @override
  State<HomeTabScaffold> createState() => _HomeTabScaffoldState();
}

class _HomeTabScaffoldState extends State<HomeTabScaffold> {
  late String username = '...';
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _fetchUsername();
  }

  void _fetchUsername() async {
    try {
      final username = await AuthUtil.getUsername();
      setState(() {
        this.username = username;
      });
    } catch (e) {
      AppLogger.error('Failed to fetch username: $e');
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  BottomNavigationBarItem _buildNavigationBarItem(
      IconData icon, IconData activeIcon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        _currentIndex == index ? activeIcon : icon,
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final double cardWidth =
        isLandscape ? size.width * 0.35 : size.width * 0.45;
    final double smallBlurCoverage = isLandscape ? 0.4 : 0.37;
    final double smallCardHeight = isLandscape ? 150 : 170;

    List<BottomNavigationBarItem> items = [
      _buildNavigationBarItem(
        CupertinoIcons.house,
        CupertinoIcons.house_fill,
        homeString,
        0,
      ),
      _buildNavigationBarItem(
        CupertinoIcons.create,
        CupertinoIcons.create_solid,
        contentStudioString,
        1,
      ),
      _buildNavigationBarItem(
        CupertinoIcons.book,
        CupertinoIcons.book_fill,
        libraryString,
        2,
      ),
    ];

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        backgroundColor: cGrayBackground,
        items: items,
        border: Border(top: BorderSide(color: cGrayColor.withOpacity(0.3))),
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 1:
            return CupertinoTabView(
              builder: (context) => const ContentStudio(),
            );
          case 2:
            return CupertinoTabView(
              builder: (context) => const LibraryScreen(),
            );
          case 0:
          default:
            return CupertinoTabView(
              builder: (context) => HomeTabPage(
                user: username,
                cardWidth: cardWidth,
                smallCardHeight: smallCardHeight,
                smallBlurCoverage: smallBlurCoverage,
              ),
            );
        }
      },
    );
  }
}
