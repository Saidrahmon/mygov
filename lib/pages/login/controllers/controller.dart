import 'dart:convert';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mgov/AppRoutes.dart';
import 'package:http/http.dart' as http;
import 'package:mgov/models/user_model.dart';
import 'package:mgov/repo/user_repo.dart';
import 'package:mgov/services/storage_service.dart';

class LoginControler extends GetxController {
  var maskFormatter = MaskTextInputFormatter(
      mask: '+998 ## ### ## ##',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );
  UserRepo userRepo = UserRepo();

  StorageService storageService = Get.find();

  final formKeyNumber = GlobalKey<FormState>();
  var numberTextController = TextEditingController();
  final formKeyPassword = GlobalKey<FormState>();
  var passwordTextController = TextEditingController();

  var progressing = false.obs;

  void login() async {
    if (this.formKeyNumber.currentState!.validate() && this.formKeyPassword.currentState!.validate()) {
      try {
        progressing.value = true;
        UserModel userModel = await userRepo.login(numberTextController.text, passwordTextController.text);
        storageService.userId = userModel.id!;
        storageService.userModel = userModel;
        progressing.value = false;
        switch (userModel.userstatus) {
          case "done":
            Get.offAndToNamed(AppRoutes.HOME);
            break;
          case "a":
            Get.offAndToNamed(AppRoutes.FORMA);
            break;
          case "b":
            Get.offAndToNamed(AppRoutes.FORMB);
            break;
          case "c":
            Get.offAndToNamed(AppRoutes.FORMC);
            break;
          case "d":
            Get.offAndToNamed(AppRoutes.FORMD);
            break;
          default:
            Get.offAndToNamed(AppRoutes.FORME);
        }
      } catch (e) {
        progressing.value = false;
        showOkAlertDialog(context: Get.context!, title: "Ogohlantirish", message: e.toString());
        Logger().e(e);
      }
    }
  }
}
