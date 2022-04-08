import 'package:flutter/material.dart';
import 'package:mgov/config/config.dart';

class ListTileText extends StatelessWidget {
  String title;

  ListTileText({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(letterSpacing: 0.5, fontSize: 18.0, fontWeight: FontWeight.w400, color: Config.social_colorPrimary),
    );
  }
}
