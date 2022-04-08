import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mgov/models/user_model.dart';
import 'package:mgov/services/storage_service.dart';

class ProfileController extends GetxController{

  StorageService storageService = Get.find();

  UserModel get userModel => storageService.userModel;

  @override
  void onInit() {
    super.onInit();
    Logger().d("${storageService.userModel.name}");
  }
}