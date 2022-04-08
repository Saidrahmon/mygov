import 'package:camera/camera.dart' as Camera;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mgov/pages/camera/controllers/controller.dart';
import 'package:mgov/widgets/pause_button.dart';
import 'package:mgov/widgets/rounded_button.dart';

class CameraPage extends GetView<CameraController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => (controller.cameraIsAvailable.value)
            ? Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.black),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Camera.CameraPreview(controller.cameraController!),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.black,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: (controller.videoIsRecording.value)
                                  ? Center(
                                      child: PauseButton(
                                        videoIsPause: controller.videoIsPause.value,
                                        onPressed: (controller.videoIsPause.value) ? controller.resumeVideo: controller.pauseVideo,
                                      ),
                                    )
                                  : Container(),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: RecordButton(
                                videoIsRecording: controller.videoIsRecording.value,
                                onPressed: (controller.videoIsRecording.value) ? controller.stopVideo : controller.recordVideo,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Container(),
      ),
    );
  }
}
