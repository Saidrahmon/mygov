import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgov/config/config.dart';
import 'package:mgov/pages/registration/controllers/controller.dart';
import 'package:mgov/widgets/custom_input.dart';
import 'package:mgov/widgets/primary_button_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegView extends GetView<RegController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.ligthPrimaryColor,
      body: SafeArea(
        child: Obx(
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
                            SizedBox(height: 16,),
                            Text(
                              "Ro'yxatdan o'tish",
                              style: TextStyle(color: Config.social_colorPrimary, fontSize: 24, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: Config.spacing_xxLarge,
                            ),
                            Text(
                              "Ko'rsatilgan shaklda kerakli maydonlarni to'ldiring. \"Vasiy\" mobile ilovasidan ro'yhatdan o'ting va biz bilan bog'lanin",
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            Form(
                              key: controller.formKeyNumber,
                              child: CustomInput(
                                keyboardType: TextInputType.number,
                                inputFormatters: [controller.maskFormatter],
                                controller: controller.numberTextController,
                                hint: "Telefon raqam",
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Telefon raqam kiritilishi shart'.tr;
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
                                    return 'Parol kiritilishi shart'.tr;
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Form(
                              key: controller.formKeyRePassword,
                              child: CustomInput(
                                controller: controller.rePasswordTextController,
                                hint: "Parolni tasdiqlash",
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Parol qayta kiritilishi shart'.tr;
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Form(
                              key: controller.formKeyPinFL,
                              child: CustomInput(
                                controller: controller.pinFLTextController,
                                keyboardType: TextInputType.number,
                                hint: "PinFL",
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'PinFL kiritilishi shart'.tr;
                                  }
                                  return null;
                                },
                              ),
                            ),
                            // Form(
                            //   key: controller.formKeyEmail,
                            //   child: CustomInput(
                            //     controller: controller.emailTextController,
                            //     hint: "E - mail",
                            //     validator: (value) {
                            //       if (value == null || value.isEmpty) {
                            //         return 'E - mail kiritilishi shart'.tr;
                            //       }
                            //       return null;
                            //     },
                            //   ),
                            // ),
                            SizedBox(
                              height: Config.spacing_xxLarge,
                            ),
                            PrimaryButton(
                              text: "Ro'yxatdan o'tish",
                              onPressed: () {
                                controller.validateInputs();
                              },
                            ),
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
      ),
    );
  }
}
