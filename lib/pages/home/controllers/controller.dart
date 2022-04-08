import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mgov/AppRoutes.dart';
import 'package:mgov/models/video_model.dart';
import 'package:mgov/repo/repository_document.dart';
import 'package:mgov/services/storage_service.dart';
import 'package:mgov/widgets/send_video_dialog.dart';
import 'package:open_file/open_file.dart' as openFile;
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {
  GlobalKey<ScaffoldState> drawerKey = GlobalKey();

  RepositoryDocument repositoryDocument = RepositoryDocument();
  StorageService storageService = Get.find();

  var isProgressing = false.obs;

  void openDrawer() {
    drawerKey.currentState!.openDrawer();
  }

  void addVideo() async {
    if (await requestPermission([Permission.camera, Permission.microphone])) {
      String filePath = await Get.toNamed(AppRoutes.CAMERA);
      if (filePath != null) {
        openVideoDialog(filePath);
        Logger().d(filePath);
      }
    }
  }

  void openVideoDialog(String filePath) {
    var dialog = showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return SendVideoDialog(
          name: filePath,
          onPressed: (path, title) async {
            isProgressing.value = true;
            String url = await getVideoUrl(path);
            if(url.isNotEmpty){
              uploadVideo(title, url, path);
            }
          },
        );
      },
    );
  }

  Future<String> getVideoUrl(String filePath) async {
    String url = "";
    try {
      url = await repositoryDocument.uploadFile(filePath);
    } catch (e) {
      isProgressing.value = false;
      showOkAlertDialog(context: Get.context!, title: "Ogohlantirish", message: "Video jo'natilmadi, qayta urinib koring");
      Logger().d(e);
    }
    return url;
  }

  void uploadVideo(String title, String videoUrl, String path) async {
    try {
      VideoModel videoModel = await repositoryDocument.uploadVideo(storageService.userId, title, videoUrl, path);
      storageService.videos = [videoModel];
      isProgressing.value = false;
    } catch (e) {
      isProgressing.value = false;
      showOkAlertDialog(context: Get.context!, title: "Ogohlantirish", message: "Video jo'natilmadi, qayta urinib koring");
      Logger().d(e);
    }
  }

  void openVideo(VideoModel videoModel) {
    openFile.OpenFile.open(videoModel.path);
    Logger().d(videoModel.path);
  }

  Future<bool> requestPermission(List<Permission> permissions) async {
    bool isPermitted = true;
    for (Permission permission in permissions) {
      var status = await permission.request();
      if (status != PermissionStatus.granted) {
        isPermitted = false;
      }
    }
    return isPermitted;
  }
}
