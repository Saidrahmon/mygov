import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:mgov/helpers/network_helper.dart';
import 'package:mgov/models/user_model.dart';

class UserRepo {
  NetworkHelper networkHelper = NetworkHelper();

  Future<UserModel> registration(String phoneNumber, String password, String email, String pinfl, String userStatus) async {
    Map map = {"username": phoneNumber, "password": password, "email": email, "pinfl": pinfl, "userregisterstatus": userStatus};

    String errorMessage = "Internetga ulanishni tekshiring";

    Response response = await networkHelper.makePostRequest("auth/local/register", map);

    if (response.statusCode == 200) {
      UserModel userModel = UserModel.fromJson(jsonDecode(response.body)['user']);
      return userModel;
    }
    if (response.statusCode == 400) {
      errorMessage = jsonDecode(response.body)['error']['message'];
    }

    throw (errorMessage);
  }

  Future<UserModel> login(String login, String password) async {
    Map map = {"identifier": login, "password": password};

    String errorMessage = "Internetga ulanishni tekshiring";

    Response response = await networkHelper.makePostRequest("auth/local", map);
    if (response.statusCode == 200) {
      UserModel userModel = UserModel.fromJson(jsonDecode(response.body)['user']);
      return userModel;
    }
    if (response.statusCode == 400) {
      errorMessage = jsonDecode(response.body)['error']['message'];
    }

    throw (errorMessage);
  }

  Future<UserModel> updateUserInfo(int userId, String surname, String name, String fatherName, String birthday, String salary, String userStatus) async {
    Map map = {
      "surname": surname,
      "fathername": fatherName,
      "salary": salary,
      "birthday": birthday,
      "name": name,
      "userregisterstatus": userStatus,
    };
    Response response = await networkHelper.makePutRequest("users/$userId", map);
    if (response.statusCode == 200) {
      UserModel userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }

    throw ("Error");
  }

  Future<UserModel> updateUserInfoStatus(int userId, String userStatus) async {
    Map map = {
      "userregisterstatus": userStatus,
    };
    Response response = await networkHelper.makePutRequest("users/$userId", map);
    if (response.statusCode == 200) {
      UserModel userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }

    throw ("Error");
  }
}
