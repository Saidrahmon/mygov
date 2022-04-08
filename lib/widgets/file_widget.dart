import 'package:flutter/material.dart';
import 'package:mgov/config/config.dart';
import 'package:mgov/models/custom_type.dart';
import 'package:mgov/widgets/title_text.dart';

class FileWidget extends StatelessWidget {
  Function(CustomType) pickFile;
  CustomType customType;

  FileWidget({required this.customType, required this.pickFile});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      margin: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              customType.name,
              style: TextStyle(fontSize: 16, letterSpacing: 0.5),
            ),
          ),
          GestureDetector(
            child: Icon(
              customType.isSend ? Icons.done : Icons.drive_folder_upload,
              color: Config.social_colorPrimary,
            ),
            onTap: () {
              pickFile(customType);
            },
          ),
        ],
      ),
    );
  }
}
