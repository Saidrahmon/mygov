import 'package:get/get.dart';
import 'package:mgov/pages/formE/controllers/controller.dart';

class FormEBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(FormEController());
  }
  
}