import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/router/app_router.dart';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';

void main() {
  // runApp(const MyApp());

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return CupertinoApp.router(
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Tale Weaver',
      theme: const CupertinoThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: CupertinoColors.white,
      ),
      routerConfig: _appRouter.config(),
    );
  }
}

// class MyApp extends StatelessWidget {
//   MyApp({super.key});

//   final _appRouter = AppRouter();

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoApp.router(
//       localizationsDelegates: const [
//         DefaultMaterialLocalizations.delegate,
//         DefaultCupertinoLocalizations.delegate,
//         DefaultWidgetsLocalizations.delegate,
//       ],
//       locale: DevicePreview.locale(context),
//       builder: DevicePreview.appBuilder,
//       debugShowCheckedModeBanner: false,
//       title: 'Tale Weaver',
//       theme: const CupertinoThemeData(
//         primaryColor: kPrimaryColor,
//         scaffoldBackgroundColor: CupertinoColors.white,
//       ),
//       routerConfig: _appRouter.config(),
//     );
//   }
// }
