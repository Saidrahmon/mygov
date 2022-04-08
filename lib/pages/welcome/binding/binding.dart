import 'package:get/get.dart';
import 'package:mgov/pages/welcome/controller/controller.dart';

class WelcomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(WelcomeController());
  }
}