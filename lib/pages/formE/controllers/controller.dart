import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mgov/AppRoutes.dart';
import 'package:mgov/models/request_model.dart';
import 'package:mgov/repo/requestRepo.dart';
import 'package:mgov/repo/user_repo.dart';
import 'package:mgov/services/storage_service.dart';

class FormEController extends GetxController {
  RequestRepo requestRepo = RequestRepo();
  UserRepo userRepo = UserRepo();
  StorageService storageService = Get.find();
  var statusMessage = "Arizangiz jo'natildi".obs;
  var progressing = false.obs;

  @override
  void onReady() {
    super.onReady();
    getRequestStatus();
  }

  void getRequestStatus() async {
    try {
      progressing.value = true;
      RequestModel requestModel = await requestRepo.getRequestStatus(storageService.requestCode);
      statusMessage.value = requestModel.name;
      if(requestModel.status == 4){
        userRepo.updateUserInfoStatus(storageService.userId, "done");
        Get.offAndToNamed(AppRoutes.HOME);
        progressing.value = false;
      }
      progressing.value = false;
    } catch (e) {
      progressing.value = false;
      Logger().e(e);
    }
  }
}
