import 'package:get/get.dart';
import 'package:mgov/pages/registration/controllers/controller.dart';

class RegBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(RegController());
  }
}