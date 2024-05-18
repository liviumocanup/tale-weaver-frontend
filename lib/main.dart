import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/router/app_router.dart';

import 'amplifyconfiguration.dart';

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
  void initState() {
    super.initState();
    _configureAmplify();
  }

  Future<void> _configureAmplify() async {
    try {
      final auth = AmplifyAuthCognito();
      final storage = AmplifyStorageS3();
      await Amplify.addPlugin(auth);
      await Amplify.addPlugin(storage);

      await Amplify.configure(amplifyconfig);
      safePrint('Successfully configured Amplify');
    } on Exception catch (e) {
      safePrint('An error occurred configuring Amplify: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: CupertinoApp.router(
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
      ),
    );
  }
}
