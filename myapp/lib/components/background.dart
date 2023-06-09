import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background(
      {super.key,
      this.topImage = 'assets/images/main_top.png',
      this.bottomImage = 'assets/images/login_bottom.png',
      required this.child});

  final String topImage, bottomImage;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                topImage,
                width: size.width * 0.3,
              ),
            ),
            // Positioned(
            //   right: 0,
            //   bottom: 0,
            //   child: Image.asset(
            //     bottomImage,
            //   ),
            // ),
            SafeArea(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
