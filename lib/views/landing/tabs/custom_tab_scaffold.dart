import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tale_weaver/views/landing/create_new/components/fullscreen_state.dart';
import 'package:tale_weaver/views/landing/create_new/create_new_tab.dart';
import 'package:tale_weaver/views/landing/home/home_tab.dart';

class CustomTabScaffold extends StatefulWidget {
  const CustomTabScaffold({Key? key}) : super(key: key);

  @override
  State<CustomTabScaffold> createState() => _CustomTabScaffoldState();
}

class _CustomTabScaffoldState extends State<CustomTabScaffold> {
  int _selectedIndex = 0; // default index

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final fullscreen = Provider.of<FullscreenState>(context);
    final List<Widget> pages = [
      const HomeTabPage(),
      const CreateNewStoryTabPage(
          link:
              "https://cdn.flowplayer.com/a30bd6bc-f98b-47bc-abf5-97633d4faea0/hls/de3f6ca7-2db3-4689-8160-0f574a5996ad/playlist.m3u8"),
      Container(),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: fullscreen.isFullscreen
          ? null
          : BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
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
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
    );
  }
}
