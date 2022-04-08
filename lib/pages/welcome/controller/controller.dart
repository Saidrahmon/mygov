import 'package:get/get.dart';
import 'package:mgov/AppRoutes.dart';
import 'package:mgov/services/storage_service.dart';

class WelcomeController extends GetxController{

  void goLogin(){
    Get.toNamed(AppRoutes.LOGIN);
  }

  void goRegistration(){
    Get.toNamed(AppRoutes.REGISTRATION);
  }

}