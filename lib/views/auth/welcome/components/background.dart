import 'package:flutter/cupertino.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/images/welcome_top.png',
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/images/welcome_bottom.png',
            ),
          ),
          // Positioned(
          //   bottom: 0,
          //   right: 0,
          //   child: Image.asset(
          //     'assets/images/dandelion-book.png',
          //   ),
          // ),
          child,
        ],
      ),
    );
  }
}
