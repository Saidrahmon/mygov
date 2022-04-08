import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mgov/AppRoutes.dart';
import 'package:mgov/helpers/network_helper.dart';
import 'package:mgov/models/user_model.dart';
import 'package:mgov/repo/requestRepo.dart';
import 'package:mgov/repo/user_repo.dart';
import 'package:mgov/services/storage_service.dart';
import 'package:http/http.dart' as http;

class FormDController extends GetxController {
  StorageService storageService = Get.find();
  RequestRepo requestRepo = RequestRepo();
  UserRepo userRepo = UserRepo();
  var progressing = false.obs;
  bool isFirst = false;

  var genderRadio = 1.obs;

  final formKeyMinAge = GlobalKey<FormState>();
  var minAgeTextController = TextEditingController();
  final formKeyMaxAge = GlobalKey<FormState>();
  var maxAgeTextController = TextEditingController();
  final formKeyExtra = GlobalKey<FormState>();
  var extraTextController = TextEditingController();

  void handleGenderChange(int? value) {
    genderRadio.value = value!;
  }

  void sendRequest() async {
    try {
      progressing.value = true;
      int requestCode = await requestRepo.sendRequest(storageService.userId, minAgeTextController.text, maxAgeTextController.text, genderRadio.value, extraTextController.text);
      UserModel userModel = await userRepo.updateUserInfoStatus(storageService.userId, "e");
      storageService.userModel = userModel;
      storageService.requestCode = requestCode;
      if(isFirst){
        Get.offAllNamed(AppRoutes.HOME);
      }else{
        Get.offAndToNamed(AppRoutes.FORME);
      }
      progressing.value = false;
    } catch (e) {
      progressing.value = false;
      Logger().e(e);
    }
  }

  void validateInputs() {
    if (formKeyMinAge.currentState!.validate() && formKeyMaxAge.currentState!.validate()) {
      sendRequest();
    }
  }

  @override
  void onInit() {
    super.onInit();
    if(Get.arguments[0] != null){
      isFirst = Get.arguments[0];
    };
  }
}
