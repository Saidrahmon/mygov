import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgov/i18n/oz_Oz.dart';

class Messages extends Translations{

  static get defaultLang => Locale('oz');

  @override
  Map<String, Map<String, String>> get keys => {
    'oz': oz_Oz.words
  };
}