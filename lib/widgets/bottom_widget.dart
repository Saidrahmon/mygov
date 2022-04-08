import 'package:flutter/material.dart';
import 'package:mgov/config/config.dart';
import 'package:mgov/widgets/primary_button_widget.dart';

class BottomWidget extends StatelessWidget {
  VoidCallback onPress;

  BottomWidget({required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Config.ligthPrimaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            child: PrimaryButton(text: "Keyingisi", onPressed: this.onPress),
            height: 50,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
