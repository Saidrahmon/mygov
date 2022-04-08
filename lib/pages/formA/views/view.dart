import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgov/config/config.dart';
import 'package:mgov/pages/formA/controllers/controller.dart';
import 'package:mgov/widgets/CustomAppBar.dart';
import 'package:mgov/widgets/bottom_widget.dart';
import 'package:mgov/widgets/custom_dialog.dart';
import 'package:mgov/widgets/custom_input.dart';
import 'package:mgov/widgets/custom_title.dart';
import 'package:mgov/widgets/title_text.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class FormAView extends GetView<FormAController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.progressing.value,
        child: Scaffold(
          backgroundColor: Config.ligthPrimaryColor,
          appBar: CustomAppBar.render(title: "Ariza qoldirish"),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(Config.spacing_standard_new),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomTitle(label: "Shaxsiy ma'lumotlar"),
                                //TitleText(text: "Shaxsiy ma'lumotlar", textSize: 18.0),
                                Form(
                                  key: controller.formKeysurname,
                                  child: CustomInput(
                                    hint: "Familiya",
                                    controller: controller.surnameTextController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Familiya kiritilishi shart'.tr;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Form(
                                  key: controller.formKeyName,
                                  child: CustomInput(
                                    hint: "Ism",
                                    controller: controller.nameTextController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Ism kiritilishi shart';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Form(
                                  key: controller.formKeyFatherName,
                                  child: CustomInput(
                                    hint: "Otasining ismi",
                                    controller: controller.fatherNameTextController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Otasining ismi kiritilishi shart';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Form(
                                  key: controller.formKeyBirthday,
                                  child: CustomInput(
                                    focusNode: AlwaysDisabledFocusNode(),
                                    hint: "Tug'ilgan sana",
                                    controller: controller.birthdayTextController,
                                    onTap: (){
                                      controller.selectDate(context);
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Tug'ilgan sana kiritilishi shart'";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Form(
                                  key: controller.formKeySalary,
                                  child: CustomInput(
                                    hint: "Oylik maosh",
                                    controller: controller.salaryTextController,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Oylik maosh kiritilishi shart'.tr;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        BottomWidget(
                          onPress: controller.validateInputs,
                        ),
                      ],
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
