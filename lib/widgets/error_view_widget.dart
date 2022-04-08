import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/config.dart';

class ErrorViewWidget extends StatelessWidget {
  final IconData icon;
  final String message;
  final Color color;

  const ErrorViewWidget({
    required this.icon,
    required this.message,
    this.color = Config.social_colorPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(this.icon, size: 100, color: this.color),
          SizedBox(height: 20),
          Text(
            this.message,
            style: TextStyle(fontSize: 20, color: this.color),
          ),
        ],
      ),
    );
  }
}
