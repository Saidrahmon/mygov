import 'package:get/get.dart';
import 'package:mgov/pages/profile/controllers/controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}
