import 'package:flutter/material.dart';
import 'package:the_p_league_mobileapp/screens/home-page/home-page.dart';
import 'package:the_p_league_mobileapp/widgets/buttons/primary-button.dart';
import 'package:the_p_league_mobileapp/widgets/buttons/secondary-button.dart';
import 'package:the_p_league_mobileapp/widgets/landing-page-logo.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key key, this.title}) : super(key: key);
  final String title;

  void onLoadHomePage(BuildContext context) {    
    Navigator.of(context).push(MaterialPageRoute(
        settings: RouteSettings(name: HomePage.routeName),
        builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.grey, Colors.white],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LandingPageLogo(),
            // using SizedBox to add extra space between logo and the button
            SizedBox(height: 50),
            PrimaryButton(
                buttonText: "Let's hoop",
                onPressedCallback: () {
                  this.onLoadHomePage(context);
                }),
            SizedBox(height: 15),
            SecondaryButton(buttonText: "Contact us"),
          ],
        ),
      ),
    );
  }
}
