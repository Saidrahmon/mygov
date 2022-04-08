import 'dart:math';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mgov/AppRoutes.dart';
import 'package:mgov/models/user_model.dart';
import 'package:mgov/repo/user_repo.dart';
import 'package:mgov/services/storage_service.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegController extends GetxController {
  StorageService storageService = Get.find();

  final formKeyNumber = GlobalKey<FormState>();
  var numberTextController = TextEditingController();
  final formKeyPassword = GlobalKey<FormState>();
  var passwordTextController = TextEditingController();
  final formKeyRePassword = GlobalKey<FormState>();
  var rePasswordTextController = TextEditingController();
  final formKeyPinFL = GlobalKey<FormState>();
  var pinFLTextController = TextEditingController();
  final formKeyEmail = GlobalKey<FormState>();
  var emailTextController = TextEditingController();

  var maskFormatter = MaskTextInputFormatter(mask: '+998 ## ### ## ##', filter: {"#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.lazy);

  UserRepo userRepo = UserRepo();
  var progressing = false.obs;

  void validateInputs() async {
    if (formKeyNumber.currentState!.validate() && formKeyPassword.currentState!.validate() && formKeyRePassword.currentState!.validate() && formKeyPinFL.currentState!.validate()) {
      if (passwordTextController.text == rePasswordTextController.text) {
        registration(numberTextController.text, passwordTextController.text, pinFLTextController.text, emailTextController.text);
      } else {
        rePasswordTextController.clear();
      }
    }
  }

  void registration(String phoneNumber, String password, String pinFL, String email) async {
    try {
      String newString = generateRandomString(16) + "@gmail.com";

      progressing.value = true;
      UserModel userModel = await userRepo.registration(phoneNumber, password, newString, pinFL, "a");
      storageService.userId = userModel.id!;
      storageService.userModel = userModel;
      Get.offAndToNamed(AppRoutes.FORMA);
      progressing.value = false;
    } catch (e) {
      progressing.value = false;
      showOkAlertDialog(context: Get.context!, title: "Ogohlantirish", message: e.toString());
      Logger().e(e);
    }
  }

  String generateRandomString(int len) {
    var r = Random();
    const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
  }
}
