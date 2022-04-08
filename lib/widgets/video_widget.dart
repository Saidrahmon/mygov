import 'package:flutter/material.dart';
import 'package:mgov/config/config.dart';
import 'package:mgov/models/video_model.dart';

class VideoWidget extends StatelessWidget {

  VideoModel videoModel;
  Function(VideoModel) onPressed;

  VideoWidget({required this.videoModel, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPressed(videoModel);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color(0x11000000),
              offset: Offset(5, 5),
              blurRadius: 7,
            ),
          ],
        ),
        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Row(
          children: [
            Container(
              child: SizedBox(
                child: Icon(
                  Icons.play_circle_outline,
                  size: 40,
                  color: Config.social_colorPrimary,
                ),
                height: 80,
                width: 80,
              ),
              decoration: BoxDecoration(
                color: Colors.black12,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              width: 24,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sarlavha: ${videoModel.title}",
                    style: TextStyle(color: Color(0xFF707070), fontWeight: FontWeight.normal, fontSize: 16),
                  ),
                  Text(
                    "Fayl nomi: ${videoModel.path!.split('/').last}",
                    style: TextStyle(color: Color(0xFF707070), fontWeight: FontWeight.normal, fontSize: 14, overflow: TextOverflow.clip),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}