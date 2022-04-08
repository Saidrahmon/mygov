import 'package:flutter/material.dart';

class PauseButton extends StatelessWidget {
  VoidCallback? onPressed;
  bool videoIsPause;

  PauseButton({
    required this.videoIsPause,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: this.onPressed,
      child: SizedBox(
        height: 50,
        width: 50,
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          child: (videoIsPause)
              ? Icon(Icons.play_arrow)
              : Icon(Icons.pause),
        ),
      ),
    );
  }
}
