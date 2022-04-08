import 'package:get/get.dart';
import 'package:mgov/services/storage_service.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StorageService());
  }
}
