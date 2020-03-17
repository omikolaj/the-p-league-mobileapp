import 'package:flutter/material.dart';

class LandingPageLogo extends StatelessWidget {
  LandingPageLogo();

  @override
  Widget build(BuildContext context) {
    return Container(
              // margin: EdgeInsets.only(top: 65.0, bottom: 10.0),
              child: AspectRatio(
                aspectRatio: 2.2 / 2,
                child: Image.asset('lib/images/logo.png',
                    width: 500, height: 440, fit: BoxFit.contain),
              ),
            );
  }
}