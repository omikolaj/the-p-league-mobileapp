import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({@required this.buttonText, this.onPressedCallback ,this.width: 300.0});  
  final String buttonText;
  final double width;
  final VoidCallback onPressedCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: RaisedButton(
        elevation: 8.0,
        onPressed: () => this.onPressedCallback,
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
            constraints: BoxConstraints(maxWidth: this.width, minHeight: 150.0),
            alignment: Alignment.center,
            child: Text(
              "${this.buttonText}",
              textAlign: TextAlign.center,
              style: Theme.of(context).primaryTextTheme.button
            ),
          ),
        ),
      ),
    );
  }
}
