import 'package:flutter/material.dart';
import 'package:mgov/config/config.dart';

class PrimaryButton extends StatelessWidget {
  String text;
  VoidCallback onPressed;

  PrimaryButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: this.onPressed,
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(color: Config.social_white, fontFamily: "Montserrat"),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        padding: const EdgeInsets.all(0.0),
      ),
      child: Container(
        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.0)), color: Config.social_colorPrimary),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: this.text,
                    style: TextStyle(fontSize: Config.textSizeMedium, fontFamily: "Montserrat"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
