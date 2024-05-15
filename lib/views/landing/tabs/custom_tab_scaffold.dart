import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/views/landing/create_new/content_studio.dart';
import 'package:tale_weaver/views/landing/home/home_tab.dart';
import 'package:tale_weaver/views/landing/tabs/collapsing_app_bar.dart';

class CustomTabScaffold extends StatefulWidget {
  final String user;

  const CustomTabScaffold({super.key, required this.user});

  @override
  State<CustomTabScaffold> createState() => _CustomTabScaffoldState();
}

class _CustomTabScaffoldState extends State<CustomTabScaffold> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeTabPage(user: widget.user),
      const ContentStudio(),
      //TODO: Fetch signed URL for the s3 video
      Container(),
    ];

    Widget bottomNavigationBar = CupertinoTabBar(
      backgroundColor: cWhiteColor,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home),
          label: homeString,
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.create),
          label: createNewString,
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.book),
          label: libraryString,
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CollapsingAppBar(),
          SliverToBoxAdapter(
            child: pages[_selectedIndex],
          )
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
