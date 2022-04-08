import 'package:get/get.dart';
import 'package:mgov/pages/formC/controllers/controller.dart';

class FormCBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(FormCController());
  }
  
}