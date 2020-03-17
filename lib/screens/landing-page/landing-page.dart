import 'package:flutter/material.dart';
import 'package:the_p_league_mobileapp/main.dart';
import 'package:the_p_league_mobileapp/screens/home-page/home-page.dart';
import 'package:the_p_league_mobileapp/widgets/buttons/primary-button.dart';
import 'package:the_p_league_mobileapp/widgets/buttons/secondary-button.dart';
import 'package:the_p_league_mobileapp/widgets/landing-page-logo.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key key, this.title}) : super(key: key);
  final String title;

  void onLoadHomePage(BuildContext context){
    
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
            Container(
              height: 50.0,
              child: RaisedButton(
        elevation: 8.0,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            settings: RouteSettings(name: HomePage.routeName),
            builder: (context) => HomePage()
          ));
        },        
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
              gradient: LinearGradient(
                colors: [Theme.of(context).buttonTheme.colorScheme.primary, Colors.grey.shade300],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(8.0)),
          child: Container(
            constraints: BoxConstraints(maxWidth: 300, minHeight: 150.0),
            alignment: Alignment.center,
            child: Text(
              "Let's hoop",
              textAlign: TextAlign.center,
              style: Theme.of(context).primaryTextTheme.button
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),            
            SecondaryButton(buttonText: "Contact us"),            
          ],
        ),
      ),
    );
  }
}