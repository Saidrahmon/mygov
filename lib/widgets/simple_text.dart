import 'package:flutter/material.dart';
import 'package:mgov/config/config.dart';

class SimpleText extends StatelessWidget {
  String? title;
  String? text;

  SimpleText({required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title!,
              style: TextStyle(
                letterSpacing: 0.5,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            child: Text(
              text ?? "",
              style: TextStyle(
                letterSpacing: 0.5,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: Config.social_colorPrimary
              ),
            ),
          ),
        ],
      ),
    );
  }
}
