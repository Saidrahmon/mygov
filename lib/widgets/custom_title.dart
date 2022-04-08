import 'package:flutter/material.dart';
import 'package:mgov/config/config.dart';

class CustomTitle extends StatelessWidget {
  final String label;
  final Color color;
  final noBottomDash;

  const CustomTitle({required this.label, this.color = Config.social_colorPrimary, this.noBottomDash = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      constraints: BoxConstraints(minWidth: 300, maxWidth: 500),
      child: Column(
        children: [
          Text(
            this.label,
            style: TextStyle(color: color, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 13),
          if (!this.noBottomDash) Container(
            color: color,
            width: 50,
            height: 2,
          ),
        ],
      ),
    );
  }
}