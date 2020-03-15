import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key key, this.title}) : super(key: key);
  final String title;

  final actionButtons = Column(
    children: <Widget>[
      RaisedButton(
        onPressed: () {},
        onLongPress: () {},
        textColor: Colors.black,
        padding: const EdgeInsets.all(0.0),
        child: Container(
            decoration: const BoxDecoration(
                // gradient: RadialGradient(
                //   center: Alignment.topLeft,
                //   colors: [Colors.grey, Colors.white]
                // ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.grey, Colors.white],
              )
            ),
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Let's Hoop",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
                fontSize: 20
                ),
            )),
      )
    ],
  );

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
          children: <Widget>[
            Image.asset('lib/images/logo.png',
                width: 600, height: 440, fit: BoxFit.contain),
            actionButtons
          ],
        ),
      ),
    );
  }
}
