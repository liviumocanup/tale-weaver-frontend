import 'package:flutter/cupertino.dart';

class Background extends StatelessWidget {
  final Widget child;
  static const String topImageAssetPath = 'assets/images/welcome_top.png';
  static const String bottomImageAssetPath = 'assets/images/welcome_bottom.png';

  const Background({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Widget topPicture = Positioned(
      top: 0,
      left: 0,
      child: Image.asset(topImageAssetPath),
    );

    Widget bottomPicture = Positioned(
      bottom: 0,
      left: 0,
      child: Image.asset(bottomImageAssetPath),
    );

    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          topPicture,
          bottomPicture,
          child,
        ],
      ),
    );
  }
}
