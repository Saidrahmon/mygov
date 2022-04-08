import 'package:get/get.dart';
import 'package:mgov/pages/login/controllers/controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(LoginControler());
  }

}