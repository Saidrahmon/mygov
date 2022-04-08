import 'package:get/get.dart';
import 'package:mgov/pages/formD/controllers/controller.dart';

class FormDBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(FormDController());
  }
  
}