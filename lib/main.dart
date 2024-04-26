import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/router/app_router.dart';

void main() {
  runApp(const MyApp());
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
      debugShowCheckedModeBanner: false,
      title: title,
      theme: const CupertinoThemeData(
        primaryColor: cPrimaryColor,
        scaffoldBackgroundColor: cWhiteColor,
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
