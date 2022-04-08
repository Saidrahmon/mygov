import 'package:flutter/material.dart';
import 'package:mgov/config/config.dart';

class RecordButton extends StatelessWidget {
  VoidCallback? onPressed;
  bool videoIsRecording;

  RecordButton({
    required this.videoIsRecording,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: this.onPressed,
      child: SizedBox(
        height: 70,
        width: 70,
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          child: (videoIsRecording)
              ? Container(
                  child: Icon(
                    Icons.stop,
                    color: Colors.red,
                    size: 50,
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
