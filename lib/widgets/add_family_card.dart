import 'package:flutter/material.dart';
import 'package:mgov/config/config.dart';
import 'package:mgov/widgets/simple_text.dart';
import 'package:mgov/widgets/title_text.dart';

class FamilyMemberCard extends StatelessWidget {
  String? name;
  String? surname;
  String? fatherName;
  String? birthday;
  String? pinfl;
  String? workPlace;
  String? salary;
  String? relation;

  FamilyMemberCard({this.name, this.surname, this.fatherName, this.pinfl, this.workPlace, this.salary, this.birthday, this.relation});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0x11000000),
            offset: Offset(5, 5),
            blurRadius: 7,
          ),
        ],
      ),
      padding: EdgeInsets.all(Config.spacing_standard_new),
      margin: EdgeInsets.only(bottom: Config.spacing_standard_new),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(),
          SimpleText(title: "Familiyasi", text: surname),
          SimpleText(title: "Ismi", text: name),
          SimpleText(title: "Otasining ismi", text: fatherName),
          SimpleText(title: "Qarindoshligi", text: relation),
          SimpleText(title: "Tug'ilgan sana", text: birthday),
          SimpleText(title: "PinFL", text: pinfl),
          SimpleText(title: "Ish joyi", text: workPlace),
          SimpleText(title: "Oylik maosh", text: salary),
        ],
      ),
    );
  }
}
