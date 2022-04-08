import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:mgov/AppRoutes.dart';
import 'package:mgov/models/custom_type.dart';
import 'package:mgov/models/family_member.dart';
import 'package:mgov/models/user_model.dart';
import 'package:mgov/repo/family_repo.dart';
import 'package:mgov/repo/user_repo.dart';
import 'package:mgov/services/storage_service.dart';
import 'package:mgov/widgets/custom_dialog.dart';

class FormBController extends GetxController {
  final formKeyName = GlobalKey<FormState>();
  var nameTextController = TextEditingController();
  final formKeySurname = GlobalKey<FormState>();
  var surnameTextController = TextEditingController();
  var fatherNameTextController = TextEditingController();
  final formKeyFatherName = GlobalKey<FormState>();
  var birthdayTextController = TextEditingController();
  final formKeyBirthday = GlobalKey<FormState>();
  var pinflTextController = TextEditingController();
  final formKeyPinfl = GlobalKey<FormState>();
  var workplaceTextController = TextEditingController();
  final formKeyWorkpace = GlobalKey<FormState>();
  var salaryTextController = TextEditingController();
  final formKeySalary = GlobalKey<FormState>();
  final formKeyRelation = GlobalKey<FormState>();
  var relationTextController = TextEditingController();

  StorageService storageService = Get.find();

  FamilyRepo familyRepo = FamilyRepo();
  UserRepo userRepo = UserRepo();

  var progressing = false.obs;

  RxList<CustomType> memberTypes = RxList(<CustomType>[]);
  RxList<FamilyMember> familyMembers = RxList(<FamilyMember>[]);

  @override
  void onReady() async {
    super.onReady();
    try {
      familyMembers.clear();
      progressing.value = true;
      familyMembers.addAll(await familyRepo.getFamilyMembersByUserId(storageService.userId));
      progressing.value = false;
    } catch (e) {
      progressing.value = false;
      Logger().e(e);
    }
  }

  void openAddFamilyDialog(BuildContext context) {
    var dialog = showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          nameTextController: nameTextController,
          formKeyName: formKeyName,
          surnameTextController: surnameTextController,
          formKeySurname: formKeySurname,
          fatherNameTextController: fatherNameTextController,
          formKeyFatherName: formKeyFatherName,
          birthdayTextController: birthdayTextController,
          formKeyBirthday: formKeyBirthday,
          pinflTextController: pinflTextController,
          formKeyPinfl: formKeyPinfl,
          workplaceTextController: workplaceTextController,
          formKeyWorkplace: formKeyWorkpace,
          salaryTextController: salaryTextController,
          formKeySalary: formKeySalary,
          relationTextController: relationTextController,
          formKeyRelation: formKeyRelation,
          memberType: memberTypes,
          onPressAdd: (name, surname, fatherName, birthday, pinfl, workplace, salary, relation) {
            addFamilyMember(name, surname, fatherName, birthday, pinfl, workplace, salary, relation);
          },
        );
      },
    );
    getFamilyMemberTypes();
  }

  void getFamilyMemberTypes() async {
    try {
      memberTypes.clear();
      memberTypes.addAll(await familyRepo.getFamilyMemberType());
    } catch (e) {
      Logger().e(e);
    }
  }

  bool validateInputs() {
    if (formKeyName.currentState!.validate() &&
        formKeySurname.currentState!.validate() &&
        formKeyFatherName.currentState!.validate() &&
        formKeyBirthday.currentState!.validate() &&
        formKeyPinfl.currentState!.validate() &&
        formKeyWorkpace.currentState!.validate() &&
        formKeySalary.currentState!.validate() &&
        formKeyRelation.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  void addFamilyMember(String name, String surname, String fatherName, String birthday, String pinfl, String workpalce, String salary, String memberType) async {
    if (!validateInputs()) return;

    Get.back();
    nameTextController.clear();
    surnameTextController.clear();
    fatherNameTextController.clear();
    pinflTextController.clear();
    birthdayTextController.clear();
    workplaceTextController.clear();
    salaryTextController.clear();
    relationTextController.clear();

    int familyMemberCode = 1;
    memberTypes.forEach((element) {
      if (element.name == memberType) {
        familyMemberCode = element.id;
      }
    });

    try {
      progressing.value = true;
      FamilyMember familyMember = await familyRepo.addFamilyMember(storageService.userId, name, surname, fatherName, birthday, pinfl, workpalce, salary, familyMemberCode);
      familyMember.relation = memberType;
      familyMembers.add(familyMember);
      progressing.value = false;
    } catch (e) {
      progressing.value = false;
      Logger().d(e);
    }
  }

  void pressNextButton() async{
    try {
      progressing.value = true;
      UserModel userModel = await userRepo.updateUserInfoStatus(storageService.userId, "c");
      storageService.userModel = userModel;
      Get.offAndToNamed(AppRoutes.FORMC);
      progressing.value = false;
    } catch (e) {
      progressing.value = false;
      Logger().d(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
