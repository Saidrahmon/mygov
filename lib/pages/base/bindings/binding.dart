import 'package:get/get.dart';
import 'package:mgov/pages/base/controllers/controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BaseController());
  }
}
