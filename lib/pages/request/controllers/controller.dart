import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mgov/AppRoutes.dart';
import 'package:mgov/models/request_model.dart';
import 'package:mgov/repo/requestRepo.dart';
import 'package:mgov/services/storage_service.dart';

class RequestController extends GetxController {
  RequestRepo requestRepo = RequestRepo();
  StorageService storageService = Get.find();
  RxList<RequestModel> requests = RxList();
  var progressing = false.obs;

  @override
  void onInit() {
    super.onInit();
    getRequests();
  }

  void getRequests() async {
    try {
      progressing.value = true;
      requests.clear();
      requests.addAll(await requestRepo.getRequests(storageService.userId));
      progressing.value = false;
    } catch (e) {
      progressing.value = false;
      Logger().d(e);
    }
  }

  void addRequest(){
    Get.offAndToNamed(AppRoutes.FORMD, arguments: [requests.isNotEmpty]);
  }
// http://172.104.47.32:1337/api/requests?populate=*&filters[user][id][$eq]=20
}
