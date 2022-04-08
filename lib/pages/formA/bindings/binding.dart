import 'package:get/get.dart';
import 'package:mgov/pages/formA/controllers/controller.dart';

class FormABinding extends Bindings{
  @override
  void dependencies() {
    Get.put(FormAController());
  }
  
}