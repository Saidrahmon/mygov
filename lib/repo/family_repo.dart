import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:mgov/helpers/network_helper.dart';
import 'package:mgov/models/custom_type.dart';
import 'package:mgov/models/family_member.dart';

class FamilyRepo {
  NetworkHelper networkHelper = NetworkHelper();

  Future<List<FamilyMember>> getFamilyMembersByUserId(int userId) async {
    Response response = await networkHelper.makeGetRequest("familymembers?populate=*&filters[userid][id][\$eq]=$userId");

    if (response.statusCode == 200) {
      List<FamilyMember> list = [];
      jsonDecode(response.body)['data'].forEach((element) {
        FamilyMember familyMember = FamilyMember.fromJson(element['attributes']);
        familyMember.id = element['id'];
        list.add(familyMember);
      });

      return list;
    }

    throw ("Error");
  }

  Future<List<CustomType>> getFamilyMemberType() async {
    Response response = await networkHelper.makeGetRequest("familymembertypes");

    if (response.statusCode == 200) {
      List<CustomType> list = [];
      jsonDecode(response.body)['data'].forEach((element) {
        list.add(CustomType.fromJson(element));
      });

      return list;
    }

    throw ("Error");
  }

  Future<FamilyMember> addFamilyMember(int userId, String name, String surname, String fatherName, String birthday, String pinfl, String workplace, String salary, int memberType) async {
    Map map = {
      "data": {"userid": userId, "name": name, "surname": surname, "fathername": fatherName, "birthday": birthday, "pinfl": pinfl, "workplace": workplace, "salary": salary, "membertype": memberType}
    };

    Response response = await networkHelper.makePostRequest("familymembers?populate=*", map);
    if (response.statusCode == 200) {
      FamilyMember familyMember = FamilyMember.fromJson(jsonDecode(response.body)['data']['attributes']);
      familyMember.id = jsonDecode(response.body)['data']['id'];
      return familyMember;
    }

    throw ("Error");
  }
}
