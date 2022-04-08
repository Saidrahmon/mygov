import 'package:flutter/material.dart';
import 'package:mgov/config/config.dart';

class TitleText extends StatelessWidget {
  String text;
  var textSize;

  TitleText({required this.text, required this.textSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(
        fontSize: this.textSize,
        letterSpacing: 0.5,
        overflow: TextOverflow.ellipsis,
        color: Config.social_textColorSecondary,
        height: 1.5,
      ),
      textAlign: TextAlign.center,
    );
  }
}
