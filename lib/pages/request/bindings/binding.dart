import 'package:get/get.dart';
import 'package:mgov/pages/request/controllers/controller.dart';

class RequestBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(RequestController());
  }

}