import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mgov/config/config.dart';
import 'package:mgov/models/custom_type.dart';
import 'package:mgov/widgets/title_text.dart';

import 'custom_input.dart';

class CustomDialog extends StatelessWidget {
  RxList<CustomType> memberType;

  Function(String, String, String, String, String, String, String, String) onPressAdd;

  CustomDialog({
    required this.memberType,
    required this.nameTextController,
    required this.surnameTextController,
    required this.fatherNameTextController,
    required this.birthdayTextController,
    required this.pinflTextController,
    required this.workplaceTextController,
    required this.salaryTextController,
    required this.relationTextController,
    required this.onPressAdd,
    required this.formKeyName,
    required this.formKeySurname,
    required this.formKeyFatherName,
    required this.formKeyBirthday,
    required this.formKeyPinfl,
    required this.formKeyWorkplace,
    required this.formKeySalary,
    required this.formKeyRelation,
  });

  TextEditingController nameTextController;
  GlobalKey formKeyName;
  TextEditingController surnameTextController;
  GlobalKey formKeySurname;
  TextEditingController fatherNameTextController;
  GlobalKey formKeyFatherName;
  TextEditingController birthdayTextController;
  GlobalKey formKeyBirthday;
  TextEditingController pinflTextController;
  GlobalKey formKeyPinfl;
  TextEditingController workplaceTextController;
  GlobalKey formKeyWorkplace;
  TextEditingController salaryTextController;
  GlobalKey formKeySalary;
  TextEditingController relationTextController;
  GlobalKey formKeyRelation;

  DateTime? pickedDate;

  dialogContent(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TitleText(text: "Oila a'zo qo'shish", textSize: 18.0),
              Form(
                key: formKeyName,
                child: CustomInput(
                  controller: nameTextController,
                  hint: "Ism",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ism kiritilishi shart'.tr;
                    }
                    return null;
                  },
                ),
              ),
              Form(
                key: formKeySurname,
                child: CustomInput(
                  controller: surnameTextController,
                  hint: "Familiya",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Familiya kiritilishi shart'.tr;
                    }
                    return null;
                  },
                ),
              ),
              Form(
                key: formKeyFatherName,
                child: CustomInput(
                  controller: fatherNameTextController,
                  hint: "Otasining ismi",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Otasining ismi kiritilishi shart';
                    }
                    return null;
                  },
                ),
              ),
              Form(
                key: formKeyBirthday,
                child: CustomInput(
                  controller: birthdayTextController,
                  hint: "Tug'ilgan kun",
                  onTap: () {
                    selectDate(context);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tug\'ilgan kun kiritilishi shart';
                    }
                    return null;
                  },
                ),
              ),
              Form(
                key: formKeyPinfl,
                child: CustomInput(
                  keyboardType: TextInputType.number,
                  controller: pinflTextController,
                  hint: "Pinfl",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Pinfl kiritilishi shart';
                    }
                    return null;
                  },
                ),
              ),
              Form(
                key: formKeyWorkplace,
                child: CustomInput(
                  controller: workplaceTextController,
                  hint: "Ish joyi",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ish joyi kiritilishi shart';
                    }
                    return null;
                  },
                ),
              ),
              Form(
                key: formKeySalary,
                child: CustomInput(
                  controller: salaryTextController,
                  keyboardType: TextInputType.number,
                  hint: "Oylik maosh",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Oylik maosh kiritilishi shart';
                    }
                    return null;
                  },
                ),
              ),
              Form(
                key: formKeyRelation,
                child: CustomInput(
                  controller: relationTextController,
                  focusNode: AlwaysDisabledFocusNode(),
                  hint: "Qarindoshligi",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Qarindoshligi kiritilishi shart'.tr;
                    }
                    return null;
                  },
                  suffixIcon: DropdownButton<String>(
                    elevation: 0,
                    underline: Container(),
                    //hint: Text("Qarindoshligi"),
                    items: memberType.value.map((CustomType items) {
                      return DropdownMenuItem(
                        value: items.name,
                        child: Text(items.name),
                      );
                    }).toList(),
                    onChanged: (item) {
                      relationTextController.text = item!;
                    },
                    //value: dropDownItemValue.value,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("Bekor qilish"),
                  ),
                  TextButton(
                    onPressed: () {
                      onPressAdd(
                        nameTextController.text,
                        surnameTextController.text,
                        fatherNameTextController.text,
                        birthdayTextController.text,
                        pinflTextController.text,
                        workplaceTextController.text,
                        salaryTextController.text,
                        relationTextController.text,
                      );
                    },
                    child: Text("Qo'shish"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1920),
      lastDate: DateTime(2023),
        builder: (context, child) => Theme(
            data: ThemeData().copyWith(
              colorScheme: ColorScheme.light(
                primary: Config.social_colorPrimary,
              ),
            ),
            child: child!)
    );
    birthdayTextController.text = pickedDate.toString().substring(0, 10);
    Logger().d(pickedDate);
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
