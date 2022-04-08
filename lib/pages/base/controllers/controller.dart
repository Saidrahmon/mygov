import 'package:get/get.dart';
import 'package:mgov/AppRoutes.dart';
import 'package:mgov/services/storage_service.dart';

class BaseController extends GetxController {
  StorageService storageService = Get.find();

  @override
  void onReady() {
    super.onReady();
    _checkHasLogin();
  }

  void _checkHasLogin() {
    int userId = storageService.userId;
    String status = storageService.userModel.userstatus ?? "";
    //int requsetCode = storageService.requestCode;
    // Get.toNamed(AppRoutes.REGISTRATION);
    // return;
    if (userId > 0) {
      switch (status) {
        case "done":
          Get.offAndToNamed(AppRoutes.HOME);
          break;
        case "a":
          Get.offAndToNamed(AppRoutes.FORMA);
          break;
        case "b":
          Get.offAndToNamed(AppRoutes.FORMB);
          break;
        case "c":
          Get.offAndToNamed(AppRoutes.FORMC);
          break;
        case "d":
          Get.offAndToNamed(AppRoutes.FORMD);
          break;
        default:
          Get.offAndToNamed(AppRoutes.FORME);
      }
    } else {
      Get.offAndToNamed(AppRoutes.WELCOME);
    }
  }
}
