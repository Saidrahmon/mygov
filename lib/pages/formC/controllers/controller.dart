import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mgov/AppRoutes.dart';
import 'package:mgov/models/custom_type.dart';
import 'package:mgov/models/user_model.dart';
import 'package:mgov/repo/repository_document.dart';
import 'package:mgov/repo/user_repo.dart';
import 'package:mgov/services/storage_service.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';

class FormCController extends GetxController {
  StorageService storageService = Get.find();
  RepositoryDocument repositoryDocument = RepositoryDocument();
  UserRepo userRepo = UserRepo();

  var progressing = false.obs;

  Future getDocTypes() async {
    try {
      progressing.value = true;
      if (storageService.docTypes.isEmpty) {
        storageService.docTypes = await repositoryDocument.getDocTypes();
      }
      progressing.value = false;
    } catch (e) {
      progressing.value = false;
      Logger().e(e);
    }
  }

  void pickFile(CustomType docType) async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result != null) {
      PlatformFile file = result.files.first;
      try {
        progressing.value = true;
        String urlFile = await repositoryDocument.uploadFile(file.path!);
        uploadDocument(file.name, urlFile, docType);
      } catch (e) {
        Logger().e(e);
      }
    }
  }

  void uploadDocument(String name, String url, CustomType docType) async {
    try {
      await repositoryDocument.uploadDocument(storageService.userId, name, url, docType.id);
      docType.isSend = true;
      List<CustomType> tempList = [];
      tempList.addAll(storageService.docTypes);
      storageService.docTypes = tempList;
      progressing.value = false;
      Logger().d("File uploaded");
    } catch (e) {
      progressing.value = false;
      Logger().e(e);
    }
  }

  void pressNextButton(BuildContext context)async {
    try {
      progressing.value = true;
      UserModel userModel = await userRepo.updateUserInfoStatus(storageService.userId, "d");
      storageService.userModel = userModel;
      Get.offAndToNamed(AppRoutes.FORMD);
      progressing.value = false;
    } catch (e) {
      progressing.value = false;
      Logger().d(e);
    }
    return;
    bool temp = true;
    for (var element in storageService.docTypes) {
      if (!element.isSend) {
        temp = false;
      }
    }
    if (temp) {
      Get.toNamed(AppRoutes.FORMD);
    } else {
      showOkAlertDialog(context: context, title: "Ogohlantirish", message: "Barcha hujjatlar yuklanishi shart");
    }
  }

  @override
  void onReady() {
    if (storageService.docTypes.isEmpty) {
      getDocTypes();
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
