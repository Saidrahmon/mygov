import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgov/config/config.dart';
import 'package:mgov/models/request_model.dart';
import 'package:mgov/pages/request/controllers/controller.dart';
import 'package:mgov/widgets/CustomAppBar.dart';
import 'package:mgov/widgets/error_view_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RequestPage extends GetView<RequestController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: CustomAppBar.render(
          title: "Arizalarim",
          leading: Center(
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(color: Config.social_colorPrimary, borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Config.ligthPrimaryColor,
        body: ModalProgressHUD(
          inAsyncCall: controller.progressing.value,
          child: (controller.requests.isEmpty)
              ? (controller.progressing.value)
                  ? Container()
                  : ErrorViewWidget(
                      icon: Icons.search,
                      message: "Arizalar topilmadi",
                    )
              : ListView(
                  children: controller.requests
                      .map(
                        (element) => RequestWidget(
                          requestModel: element,
                        ),
                      )
                      .toList(),
                ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: controller.addRequest,
          backgroundColor: Config.social_colorPrimary,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class RequestWidget extends StatelessWidget {
  RequestModel requestModel;

  RequestWidget({required this.requestModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Bola saqlab olish to'g'risidagi ariza", style: TextStyle(fontWeight: FontWeight.bold)),
          Divider(height: 30, color: Color(0xFFE5E5E5)),
          Row(
            children: [
              Text('№: ${requestModel.id}'),
              SizedBox(width: 15),
              Expanded(
                child: Container(),
              ),
              RequestStatusBadge(code: 1, title: requestModel.name),
            ],
          )
        ],
      ),
    );
  }
}

class RequestStatusBadge extends StatelessWidget {
  final int code;
  final String title;

  const RequestStatusBadge({required this.code, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      decoration: BoxDecoration(
        color: this.getColorByStatus(this.code),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(3),
            child: Text(this.title, style: TextStyle(fontSize: 12, color: Colors.white)),
          )
        ],
      ),
    );
  }

  Color getColorByStatus(int code) {
    return Colors.green;
    // switch (code) {
    //   case 'process':
    //     return Color(0xFFEFB33F);
    //   case 'processed':
    //     return Color(0xFF7AC073);
    //   case 'not_active':
    //     return Config.grayColor;
    //   case 'rejected':
    //     return Config.redColor;
    //   default:
    //     return Colors.blue;
    // }
  }
}
