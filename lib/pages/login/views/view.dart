import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgov/config/config.dart';
import 'package:mgov/pages/login/controllers/controller.dart';
import 'package:mgov/widgets/CustomAppBar.dart';
import 'package:mgov/widgets/custom_input.dart';
import 'package:mgov/widgets/primary_button_widget.dart';
import 'package:mgov/widgets/title_text.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:country_code_picker/country_code_picker.dart';

class LoginPage extends GetView<LoginControler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.ligthPrimaryColor,
      body: Obx(
        () => ModalProgressHUD(
          inAsyncCall: controller.progressing.value,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: Config.spacing_standard_new),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Kirish",
                            style: TextStyle(color: Config.social_colorPrimary, fontSize: 24, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: Config.spacing_xxLarge,
                          ),
                          Text(
                            "\"Vasiy\" mobil ilovasiga xush kelibsiz! Ilovadan foydalanishni boshlash uchun quyida login maʼlumotlaringizni kiriting",
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 48,
                          ),
                          Form(
                            key: controller.formKeyNumber,
                            child: CustomInput(
                              controller: controller.numberTextController,
                              hint: "Telefon raqam",
                              keyboardType: TextInputType.number,
                              inputFormatters: [controller.maskFormatter],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required field'.tr;
                                }
                                return null;
                              },
                            ),
                          ),
                          Form(
                            key: controller.formKeyPassword,
                            child: CustomInput(
                              controller: controller.passwordTextController,
                              hint: "Parol",
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required field'.tr;
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          PrimaryButton(
                            text: "Kirish",
                            onPressed: () {
                              controller.login();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
