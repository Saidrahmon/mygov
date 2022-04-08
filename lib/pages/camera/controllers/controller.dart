import 'package:camera/camera.dart' as Camera;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mgov/repo/repository_document.dart';

class CameraController extends GetxController {
  List<Camera.CameraDescription> cameras = <Camera.CameraDescription>[];
  Camera.CameraController? cameraController;
  var cameraIsAvailable = false.obs;
  var videoIsRecording = false.obs;
  var videoIsPause = false.obs;

  @override
  void onInit() async {
    super.onInit();
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await Camera.availableCameras();
    cameraController = Camera.CameraController(
      cameras[1],
      Camera.ResolutionPreset.medium,
    );
    cameraController!.initialize().then((value) => {cameraIsAvailable.value = true});
  }

  void recordVideo() async {
    Logger().d("Start recording");
    videoIsRecording.value = true;
    await cameraController!.prepareForVideoRecording();
    await cameraController!.startVideoRecording();
  }

  void pauseVideo() async {
    videoIsPause.value = true;
    await cameraController!.pauseVideoRecording();
  }

  void resumeVideo() async {
    videoIsPause.value = false;
    await cameraController!.resumeVideoRecording();
  }

  void stopVideo() async {
    videoIsRecording.value = false;
    videoIsPause.value = false;
    Camera.XFile file = await cameraController!.stopVideoRecording();
    Get.back(result: file.path);
    Logger().d(file.path);
  }
}
