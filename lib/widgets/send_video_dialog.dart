import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgov/config/config.dart';
import 'package:mgov/widgets/custom_input.dart';

class SendVideoDialog extends StatelessWidget {
  TextEditingController titleTextController = TextEditingController();
  String name;
  Function(String, String) onPressed;

  SendVideoDialog({
    required this.name,
    required this.onPressed,
  });

  dialogContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
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
                  width: 16,
                ),
                Expanded(
                  child: Container(
                    child: Text(name.split('/').last),
                  ),
                )
              ],
            ),
            CustomInput(
              hint: "Sarlavha",
              controller: titleTextController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("Bekor qilish"),
                ),
                TextButton(
                  onPressed: (){
                    onPressed(name, titleTextController.text);
                    Get.back();
                  },
                  child: Text("Yuborish"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}
