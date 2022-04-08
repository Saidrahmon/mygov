import 'package:flutter/material.dart';
import 'package:mgov/config/config.dart';

class CustomAppBar {
  static AppBar render({required String title, showProfileButton = false, List<Widget>? actions, Widget? leading}) {
    if (actions == null || actions.isEmpty) {
      actions = [
        Container(),
      ];
    }
    //actions.add(Container(margin: EdgeInsets.only(right: 8)));
    return AppBar(
      elevation: 4,
      title: Text(
        title.toUpperCase(),
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: Config.textSizeLargeMedium, color: Color(0xFF757575), height: 1.5, letterSpacing: 0.5, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: leading,
      actions: actions,
    );
  }
}
