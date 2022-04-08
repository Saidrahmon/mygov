import 'dart:convert';

import 'package:http/http.dart';
import 'package:mgov/helpers/network_helper.dart';
import 'package:mgov/models/custom_type.dart';
import 'package:mgov/models/request_model.dart';

class RequestRepo {
  NetworkHelper networkHelper = NetworkHelper();

  Future<int> sendRequest(int userId, String minAge, String maxAge, int gender, String comment) async {
    Map map = {
      "data": {"user": userId, "minAge": minAge, "maxAge": maxAge, "gender": gender, "comment": comment, "requeststatus": 1}
    };

    Response response = await networkHelper.makePostRequest("requests", map);
    if (response.statusCode == 200) {
      int requestCode = jsonDecode(response.body)['data']['id'];
      return requestCode;
    }

    throw ("Error");
  }

  Future<RequestModel> getRequestStatus(int requestCode) async {
    Response response = await networkHelper.makeGetRequest("requests/$requestCode?populate=*");
    if (response.statusCode == 200) {
      RequestModel requestModel = RequestModel.fromJson(jsonDecode(response.body)['data']);
      return requestModel;
    }

    throw ("Error");
  }

  Future<List<RequestModel>> getRequests(int userId) async {
    Response response = await networkHelper.makeGetRequest("requests?populate=*&filters[user][id][\$eq]=$userId");
    if (response.statusCode == 200) {
      List<RequestModel> list = [];
      jsonDecode(response.body)['data'].forEach((element) {
        RequestModel requestModel = RequestModel.fromJson(element);
        list.add(requestModel);
      });

      return list;
    }

    throw ("Error");
  }
}
