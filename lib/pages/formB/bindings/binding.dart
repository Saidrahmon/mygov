import 'package:get/get.dart';
import 'package:mgov/pages/formB/controllers/controller.dart';

class FormBBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(FormBController());
  }
  
}