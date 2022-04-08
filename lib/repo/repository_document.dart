import 'dart:convert';

import 'package:http/http.dart';
import 'package:mgov/helpers/network_helper.dart';
import 'package:mgov/models/custom_type.dart';
import 'package:mgov/models/video_model.dart';

class RepositoryDocument {
  NetworkHelper networkHelper = NetworkHelper();

  Future<bool> uploadDocument(int userId, String name, String url, int docType) async {
    Map map = {
      "data": {"userid": userId, "name": name, "url": url, "doctype": docType}
    };

    Response response = await networkHelper.makePostRequest("documents", map);

    if (response.statusCode == 200) {
      return true;
    }

    throw ("Error");
  }

  Future<String> uploadFile(String filePath) async {
    Response response = await networkHelper.makeMultipartRequest("upload", filePath: filePath);
    if (response.statusCode == 200) {
      String urlFile = "http://172.104.47.32:1337${jsonDecode(response.body)[0]["url"]}";
      return urlFile;
    }

    throw ("Error");
  }

  Future<List<CustomType>> getDocTypes() async {
    Response response = await networkHelper.makeGetRequest("doctypes");
    if (response.statusCode == 200) {
      List<CustomType> list = [];
      jsonDecode(response.body)['data'].forEach((element) {
        CustomType docType = CustomType.fromJson(element);
        docType.isSend = false;
        list.add(docType);
      });
      return list;
    }

    throw ("Error");
  }

  Future<VideoModel> uploadVideo(int userId, String title, String videoUrl, String path) async {
    Map map = {
      "data": {"userid": userId, "title": title, "url": videoUrl}
    };
    Response response = await networkHelper.makePostRequest("videoreports", map);

    if(response.statusCode == 200){
      VideoModel videoModel = VideoModel.fromJson(jsonDecode(response.body)['data']['attributes']);
      videoModel.path = path;
      return videoModel;
    }

    throw ("Error");
  }
}
