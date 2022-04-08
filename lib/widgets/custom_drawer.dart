import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgov/AppRoutes.dart';
import 'package:mgov/config/config.dart';

class CustomDrawer extends StatelessWidget {
  final List<DrawerItem> menuItems = [
    DrawerItem("Malumotlarim", () => Get.toNamed(AppRoutes.PROFILE), Icons.person_outline),
    DrawerItem("Foydalanish", () => Get.toNamed(AppRoutes.USAGE), Icons.info_outline),
    DrawerItem("Arizalarim", () => Get.toNamed(AppRoutes.REQUEST), Icons.check_circle_outline),
    DrawerItem("Aloqa", () => {}, Icons.support_agent),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Config.social_colorPrimary,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Image.asset(
              'assets/logo_title_hori.png',
              color: Colors.white,
              // width: 200,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: this.menuItems.length,
                  itemBuilder: (context, index) {
                    DrawerItem item = this.menuItems[index];
                    return Container(
                      child: InkWell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            children: [
                              Icon(item.icon, color: Colors.white),
                              SizedBox(width: 16),
                              Text(
                                item.name,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Get.back();
                          item.action();
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            Column(
              children: [
                Dash(dashColor: Colors.white, length: 250),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LangBtn(lang: 'oz', label: 'o\'zb'),
                      // SizedBox(width: 10),
                      // LangBtn(lang: 'uz', label: 'ўзб'),
                      SizedBox(width: 10),
                      LangBtn(lang: 'ru', label: 'рус'),
                    ],
                  ),
                ),
                Dash(dashColor: Colors.white, length: 250),
                SizedBox(height: 10),
                // UzinfocomLogo(
                //   width: 200,
                //   lightVersion: true,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Dash extends StatelessWidget {
  const Dash({
    this.direction = Axis.horizontal,
    this.dashColor = Colors.black,
    this.length = 200,
    this.dashGap = 3,
    this.dashLength = 6,
    this.dashThickness = 1,
    this.dashBorderRadius = 0,
  });

  final Axis direction;
  final Color dashColor;
  final double length;
  final double dashGap;
  final double dashLength;
  final double dashThickness;
  final double dashBorderRadius;

  @override
  Widget build(BuildContext context) {
    var dashes = <Widget>[];
    double n = (length + dashGap) / (dashGap + dashLength);
    int newN = n.round();
    double newDashGap = (length - dashLength * newN) / (newN - 1);
    for (var i = newN; i > 0; i--) {
      dashes.add(step(i, newDashGap));
    }
    if (direction == Axis.horizontal) {
      return SizedBox(
          width: length,
          child: Row(
            children: dashes,
          ));
    } else {
      return Column(children: dashes);
    }
  }

  Widget step(int index, double newDashGap) {
    bool isHorizontal = direction == Axis.horizontal;
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, isHorizontal && index != 1 ? newDashGap : 0, isHorizontal || index == 1 ? 0 : newDashGap),
        child: SizedBox(
          width: isHorizontal ? dashLength : dashThickness,
          height: isHorizontal ? dashThickness : dashLength,
          child: DecoratedBox(
            decoration: BoxDecoration(color: dashColor, borderRadius: BorderRadius.all(Radius.circular(dashBorderRadius))),
          ),
        ));
  }
}

class LangBtn extends StatelessWidget {
  final String lang;
  final String label;

  const LangBtn({required this.lang, required this.label});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.white,
      onPressed: () {},
      child: Text(
        this.label,
        style: TextStyle(color: Config.social_colorPrimary),
      ),
      shape: new RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}

class DrawerItem {
  String name;
  VoidCallback action;
  IconData icon;

  DrawerItem(this.name, this.action, this.icon);
}
