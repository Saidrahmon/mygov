import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgov/pages/base/controllers/controller.dart';

class BasePage extends GetView<BaseController> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
