import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  Color cor;
  String text;
  Function onPressed;
  bool showProgress;

  AppButton(this.text, {this.onPressed, this.cor = Colors.blue, this.showProgress = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: RaisedButton(
        color: cor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
        ),
        child: showProgress ? Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),),):
        Text(
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