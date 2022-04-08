import 'package:flutter/material.dart';
import 'package:mgov/config/config.dart';
import 'package:mgov/widgets/CustomAppBar.dart';

class UsagePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.render(title: "Foydalanish"),
      backgroundColor: Config.ligthPrimaryColor,
      body: Container(),
    );
  }
}
