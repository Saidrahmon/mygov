/* Mehribon va rahimli allohning nomi bilan boshlayman */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mgov/AppBinding.dart';
import 'package:mgov/AppPages.dart';
import 'package:mgov/config/config.dart';
import 'package:mgov/i18n/Messages.dart';
import 'AppRoutes.dart';

void main() async {
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "mgov",
      // translations: Messages(),
      // locale: Messages.defaultLang,
      getPages: AppPages.routes,
      initialRoute: AppRoutes.BASE,
      initialBinding: AppBinding(),

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Montserrat",
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.black12, statusBarBrightness: Brightness.dark),
          toolbarHeight: 80,
        ),
      ),
    );
  }
}
