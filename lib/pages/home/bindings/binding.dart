import 'package:get/get.dart';
import 'package:mgov/pages/home/controllers/controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}