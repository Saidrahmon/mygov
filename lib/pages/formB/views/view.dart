import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgov/config/config.dart';
import 'package:mgov/pages/formB/controllers/controller.dart';
import 'package:mgov/widgets/CustomAppBar.dart';
import 'package:mgov/widgets/add_family_card.dart';
import 'package:mgov/widgets/bottom_widget.dart';
import 'package:mgov/widgets/custom_title.dart';
import 'package:mgov/widgets/error_view_widget.dart';
import 'package:mgov/widgets/primary_button_widget.dart';
import 'package:mgov/widgets/title_text.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class FormBView extends GetView<FormBController> {
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
                                CustomTitle(label: "Oila a'zolari"),
                                Spacer(),
                                controller.familyMembers.isEmpty
                                    ? (controller.progressing.value)
                                        ? Container()
                                        : ErrorViewWidget(icon: Icons.search, message: "Oila a'zo qo'shilmagan")
                                    : Column(
                                        children: controller.familyMembers
                                            .map(
                                              (element) => FamilyMemberCard(
                                                name: element.name,
                                                surname: element.surname,
                                                fatherName: element.fatherName,
                                                birthday: element.birthday,
                                                pinfl: element.pinFl,
                                                workPlace: element.workplace,
                                                salary: element.salary,
                                                relation: element.relation,
                                              ),
                                            )
                                            .toList(),
                                      ),
                                Spacer(),
                                PrimaryButton(
                                  text: "Qo'shish",
                                  onPressed: () {
                                    controller.openAddFamilyDialog(context);
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                        BottomWidget(
                          onPress: controller.pressNextButton,
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
