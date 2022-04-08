import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgov/config/config.dart';
import 'package:mgov/pages/formD/controllers/controller.dart';
import 'package:mgov/widgets/CustomAppBar.dart';
import 'package:mgov/widgets/bottom_widget.dart';
import 'package:mgov/widgets/custom_input.dart';
import 'package:mgov/widgets/custom_title.dart';
import 'package:mgov/widgets/title_text.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class FormDView extends GetView<FormDController> {
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
                    child: Obx(
                      () => Column(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x11000000),
                                    offset: Offset(5, 5),
                                    blurRadius: 7,
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(Config.spacing_standard_new),
                              margin: EdgeInsets.all(Config.spacing_standard_new),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTitle(label: "Farzandlikka olinadigan bola haqida"),
                                  SizedBox(
                                    height: Config.spacing_standard_new,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      TitleText(
                                        text: "Yoshi",
                                        textSize: 18.0,
                                      ),
                                      SizedBox(
                                        width: 60,
                                        child: Form(
                                          key: controller.formKeyMinAge,
                                          child: CustomInput(
                                            maxlength: 2,
                                            controller: controller.minAgeTextController,
                                            keyboardType: TextInputType.number,
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Yoshi kiritilishi shart'.tr;
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                      TitleText(text: "dan", textSize: 18.0),
                                      SizedBox(
                                        width: 60,
                                        child: Form(
                                          key: controller.formKeyMaxAge,
                                          child: CustomInput(
                                            maxlength: 2,
                                            controller: controller.maxAgeTextController,
                                            keyboardType: TextInputType.number,
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Yoshi kiritilishi shart'.tr;
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                      TitleText(text: "gacha", textSize: 18.0),
                                    ],
                                  ),
                                  TitleText(text: "Jinsi", textSize: 18.0),
                                  Row(
                                    children: <Widget>[
                                      Radio<int>(
                                        value: 1,
                                        groupValue: controller.genderRadio.value,
                                        onChanged: controller.handleGenderChange,
                                      ),
                                      Text("O'gil bola"),
                                      Radio<int>(
                                        value: 2,
                                        groupValue: controller.genderRadio.value,
                                        onChanged: controller.handleGenderChange,
                                      ),
                                      Text("Qiz bola"),
                                    ],
                                  ),
                                  TitleText(text: "Qo'shimcha", textSize: 18.0),
                                  CustomInput(
                                    controller: controller.extraTextController,
                                  )
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
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
