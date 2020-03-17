import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  SecondaryButton({@required this.buttonText, this.width: 300.0});  
  final String buttonText;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: FlatButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
            // gradient: LinearGradient(
            //     colors: [Colors.grey.shade300, Theme.of(context).buttonTheme.colorScheme.secondary],
            //     begin: Alignment.topLeft,
            //     end: Alignment.bottomRight,
            //   ),
            color: Theme.of(context).buttonTheme.colorScheme.secondary,
              borderRadius: BorderRadius.circular(8.0)),
          child: Container(
            constraints: BoxConstraints(maxWidth: this.width, minHeight: 150.0),
            alignment: Alignment.center,
            child: Text(
              "${this.buttonText}",
              textAlign: TextAlign.center,
              style: Theme.of(context).primaryTextTheme.button,  
          ),
        ),
      ),
      )
    );
  }
}
