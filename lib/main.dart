import 'package:flutter/material.dart';
import 'package:the_p_league_mobileapp/screens/landing-page/landing-page.dart';

import 'theme.dart' as PLeagueTheme;
import 'package:wakelock/wakelock.dart';

void main() => {
  Wakelock.enable(),
  runApp(PLeagueApp())
};

class PLeagueApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The P League',
      theme: PLeagueTheme.myTheme,
      home: LandingPage(title: 'The P League'),
    );
  }
}




