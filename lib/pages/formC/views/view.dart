import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgov/config/config.dart';
import 'package:mgov/pages/formC/controllers/controller.dart';
import 'package:mgov/widgets/CustomAppBar.dart';
import 'package:mgov/widgets/bottom_widget.dart';
import 'package:mgov/widgets/custom_title.dart';
import 'package:mgov/widgets/error_view_widget.dart';
import 'package:mgov/widgets/file_widget.dart';
import 'package:mgov/widgets/title_text.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class FormCView extends GetView<FormCController> {
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
                          child: Column(
                            children: [
                              CustomTitle(label: "Xujjatlarni yuklash"),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    controller.storageService.docTypes.isEmpty
                                        ? (controller.progressing.value)
                                            ? Container()
                                            : ErrorViewWidget(icon: Icons.search, message: "Fayllar yuklanmadi")
                                        : Column(
                                            children: controller.storageService.docTypes.value
                                                .map(
                                                  (element) => FileWidget(
                                                    customType: element,
                                                    pickFile: controller.pickFile,
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        BottomWidget(
                          onPress: () {
                            controller.pressNextButton(context);
                          },
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
