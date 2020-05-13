import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  Color cor;
  String text;
  Function onPressed;

  AppButton(this.text, {this.onPressed, this.cor = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: RaisedButton(
        color: cor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}