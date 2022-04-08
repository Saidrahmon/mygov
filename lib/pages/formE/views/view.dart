import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgov/AppRoutes.dart';
import 'package:mgov/pages/formE/controllers/controller.dart';
import 'package:mgov/widgets/CustomAppBar.dart';
import 'package:mgov/widgets/primary_button_widget.dart';
import 'package:mgov/widgets/title_text.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class FormEView extends GetView<FormEController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.progressing.value,
        child: Scaffold(
          appBar: CustomAppBar.render(title: "Ariza qoldirish"),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    TitleText(
                      text: controller.statusMessage.value,
                      textSize: 20.0,
                    ),
                    //TitleText(text: "Arizangiz 30 kun ichida ko'rib chiqiladi", textSize: 16.0,),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                PrimaryButton(text: "Aloqa uchun", onPressed: () {
                  Get.toNamed(AppRoutes.HOME);
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
