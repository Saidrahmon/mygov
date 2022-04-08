import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:mgov/AppRoutes.dart';
import 'package:mgov/config/config.dart';
import 'package:mgov/models/user_model.dart';
import 'package:mgov/repo/user_repo.dart';
import 'package:mgov/services/storage_service.dart';

class FormAController extends GetxController {
  StorageService storageService = Get.find();
  DateTime? pickedDate;

  UserRepo userRepo = UserRepo();
  var progressing = false.obs;

  final formKeysurname = GlobalKey<FormState>();
  var surnameTextController = TextEditingController();
  final formKeyName = GlobalKey<FormState>();
  var nameTextController = TextEditingController();
  final formKeyFatherName = GlobalKey<FormState>();
  var fatherNameTextController = TextEditingController();
  final formKeySalary = GlobalKey<FormState>();
  var salaryTextController = TextEditingController();
  final formKeyBirthday = GlobalKey<FormState>();
  var birthdayTextController = TextEditingController();

  void sentPrivateInfo() async {
    try {
      progressing.value = true;
      UserModel userModel = await userRepo.updateUserInfo(storageService.userId, surnameTextController.text, nameTextController.text, fatherNameTextController.text, birthdayTextController.text, salaryTextController.text, "b");
      storageService.userModel = userModel;
      Get.offAndToNamed(AppRoutes.FORMB);
      progressing.value = false;
    } catch (e) {
      progressing.value = false;
      Logger().e(e);
    }
  }

  void validateInputs() {
    if (formKeysurname.currentState!.validate() && formKeyName.currentState!.validate() && formKeyFatherName.currentState!.validate() && formKeyBirthday.currentState!.validate() && formKeySalary.currentState!.validate()) {
      sentPrivateInfo();
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      // locale: Locale('ru'),
      firstDate: DateTime(1920),
      lastDate: DateTime(2023),
      builder: (context, child) => Theme(
          data: ThemeData().copyWith(
            colorScheme: ColorScheme.light(
              primary: Config.social_colorPrimary,
            ),
          ),
          child: child!),
    );
    birthdayTextController.text = pickedDate.toString().substring(0, 10);
    Logger().d(pickedDate);
  }
}
