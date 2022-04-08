import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mgov/config/config.dart';
import 'package:mgov/pages/welcome/controller/controller.dart';
import 'package:mgov/widgets/custom_title.dart';
import 'package:mgov/widgets/primary_button_widget.dart';
import 'package:mgov/widgets/title_text.dart';

class WelcomePage extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: Config.spacing_standard_new, right: Config.spacing_standard_new),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage("assets/logo_title.png"),
              ),
              Text(
                "Biz katta o'zgarishlarni boshlaymiz. Har bitta bola oilada ulg'ayish huquqiga ega.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: Config.spacing_xxLarge,
              ),
              PrimaryButton(
                text: "Kirish",
                onPressed: () {
                  controller.goLogin();
                },
              ),
              const SizedBox(
                height: Config.spacing_xxLarge,
              ),
              GestureDetector(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Hali ro'yxatdan o'tmagan bolsangiz bu yerga bosing ",
                        style: TextStyle(color: Colors.grey, fontFamily: "Montserrat"),
                      ),
                      TextSpan(
                        text: "Ro'yxatdan o'tish",
                        style: TextStyle(color: Colors.blue, fontFamily: "Montserrat"),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  controller.goRegistration();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
