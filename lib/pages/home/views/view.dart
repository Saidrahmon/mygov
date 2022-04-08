import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgov/AppRoutes.dart';
import 'package:mgov/config/config.dart';
import 'package:mgov/pages/home/controllers/controller.dart';
import 'package:mgov/widgets/CustomAppBar.dart';
import 'package:mgov/widgets/custom_drawer.dart';
import 'package:mgov/widgets/error_view_widget.dart';
import 'package:mgov/widgets/video_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.isProgressing.value,
        child: Scaffold(
          appBar: CustomAppBar.render(
            title: "Video hisobotlar",
            leading: Center(
              child: GestureDetector(
                onTap: controller.openDrawer,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(color: Config.social_colorPrimary, borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Icon(
                        Icons.add_alert,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          key: controller.drawerKey,
          backgroundColor: Config.ligthPrimaryColor,
          drawer: Drawer(child: CustomDrawer()),
          body: (controller.storageService.videos.isEmpty)
              ? (controller.isProgressing.value)
                  ? Container()
                  : ErrorViewWidget(
                      icon: Icons.search,
                      message: "Video hali jo'natilmagan",
                    )
              : ListView(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  children: controller.storageService.videos
                      .map((element) => VideoWidget(
                            videoModel: element,
                            onPressed: controller.openVideo,
                          ))
                      .toList(),
                ),
          floatingActionButton: FloatingActionButton(
            onPressed: controller.addVideo,
            backgroundColor: Config.social_colorPrimary,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
