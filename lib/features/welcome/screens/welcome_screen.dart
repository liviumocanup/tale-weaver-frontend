import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/router/app_router.gr.dart';
import 'package:tale_weaver/shared/widgets/app_title.dart';
import 'package:tale_weaver/shared/widgets/push_page_func.dart';
import 'package:tale_weaver/shared/widgets/ui_overlay.dart';
import 'package:tale_weaver/utils/auth_util.dart';

import '../widgets/background.dart';
import '../widgets/welcome_greeting.dart';
import '../widgets/log_in_button.dart';
import '../widgets/sign_up_button.dart';

@RoutePage(name: 'WelcomeRoute')
class WelcomeScreen extends StatefulWidget {
  static const String mainPictureAssetPath = 'assets/images/dandelion-lute.png';

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchSession();
  }

  void _fetchSession() async {
    try {
      await AuthUtil.getBearerToken();
      replaceAllPages(context, const Home());
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(uiOverlay);

    Widget mainPicture = Image.asset(
      WelcomeScreen.mainPictureAssetPath,
      height: size.height * 0.3,
    );

    return _isLoading
        ? const CupertinoPageScaffold(
            child: Center(
              child: CupertinoActivityIndicator(
                radius: 15,
                color: cBlackColor,
              ),
            ),
          )
        : CupertinoPageScaffold(
            child: Background(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const WelcomeGreeting(),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  const AppTitle(),
                  mainPicture,
                  const LogInButton(),
                  const SignUpButton(),
                ],
              ),
            ),
          );
  }
}
