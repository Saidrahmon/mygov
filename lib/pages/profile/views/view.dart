import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgov/config/config.dart';
import 'package:mgov/pages/profile/controllers/controller.dart';
import 'package:mgov/services/storage_service.dart';
import 'package:mgov/widgets/CustomAppBar.dart';
import 'package:mgov/widgets/custom_title.dart';

class ProfilePage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.ligthPrimaryColor,
      appBar: CustomAppBar.render(
        title: "Ma'lumotlarim",
        leading: Center(
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(color: Config.social_colorPrimary, borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color(0x11000000),
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            children: [
              CustomTitle(label: "Umumiy ma'lumotlar"),
              ProfileItem(
                title: "F.I.O",
                text: "${controller.userModel.surname} ${controller.userModel.name} ${controller.userModel.fathername}",
              ),
              ProfileItem(
                title: "Tug'ilgan sana",
                text: controller.userModel.birthday,
              ),
              ProfileItem(
                title: "Telefon raqam",
                text: controller.userModel.username,
              ),
              ProfileItem(
                title: "PINFL",
                text: controller.userModel.pinFl,
              ),
              ProfileItem(
                title: "Email",
                text: controller.userModel.email,
              ),
              // ProfileItem(
              //   title: "Uylanganmi",
              //   text: controller.userModel.ismarried,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  String? title;
  String? text;

  ProfileItem({this.title, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          Text(title ?? ""),
          SizedBox(
            height: 4,
          ),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Config.ligthPrimaryColor,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    text ?? "",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
