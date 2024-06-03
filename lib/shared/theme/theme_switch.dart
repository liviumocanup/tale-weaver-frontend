import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'theme_manager.dart';

class ThemeToggleSwitch extends StatelessWidget {
  const ThemeToggleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(
      builder: (context, themeManager, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(CupertinoIcons.sun_max_fill, color: CupertinoColors.systemYellow),
            CupertinoSwitch(
              value: themeManager.isDarkMode,
              onChanged: (newValue) {
                themeManager.toggleTheme();
              },
              activeColor: CupertinoColors.systemBlue,
            ),
            const Icon(CupertinoIcons.moon_fill, color: CupertinoColors.systemGrey),
          ],
        );
      },
    );
  }
}
