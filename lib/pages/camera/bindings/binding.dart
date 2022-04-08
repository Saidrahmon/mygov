import 'package:get/get.dart';
import 'package:mgov/pages/camera/controllers/controller.dart';

class CameraBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(CameraController());
  }

}