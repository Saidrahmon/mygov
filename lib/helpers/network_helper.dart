import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  String domain = "http://172.104.47.32:1337";
  Map<String, String> headers = {
    "Authorization":
        "Bearer 4ae1c2698f5d683e1e6b6f573fbf946e39ef56648e384f952913a52789f0d55e4b4f69664830c4c039c215818310f6609f9f3b28d6f1f8eb965d2fec5190b512ed190800e2e47daea67e62b26643a54cbf6ffc0ad8164432fde26024bf853162ce2199d6092c85b9057f857f49d5288df37e63ecf1f09891e7b128503d53e08a",
    "Content-Type": "application/json"
  };

  String buildUrl(String url) {
    return "$domain/api/$url";
  }

  Future makePostRequest(String url, body) async {
    http.Response response = await http.post(
      Uri.parse("$domain/api/$url"),
      body: jsonEncode(body),
      headers: {
        "Authorization":
            "Bearer 4ae1c2698f5d683e1e6b6f573fbf946e39ef56648e384f952913a52789f0d55e4b4f69664830c4c039c215818310f6609f9f3b28d6f1f8eb965d2fec5190b512ed190800e2e47daea67e62b26643a54cbf6ffc0ad8164432fde26024bf853162ce2199d6092c85b9057f857f49d5288df37e63ecf1f09891e7b128503d53e08a",
        "Content-Type": "application/json"
      },
    );

    Logger().d("HTTP: ${response.statusCode.toString()}, URL: $url, ");
    Logger().w(utf8.decode(response.bodyBytes));

    return response;
  }

  Future makePutRequest(String url, body) async {
    http.Response response = await http.put(
      Uri.parse("$domain/api/$url"),
      body: jsonEncode(body),
      headers: headers,
    );

    Logger().d("HTTP: ${response.statusCode.toString()}, URL: $url, ");
    Logger().w(utf8.decode(response.bodyBytes));

    return response;
  }

  Future makeGetRequest(String url) async {
    http.Response response = await http.get(
      Uri.parse("$domain/api/$url"),
      headers: {
        "Authorization":
            "Bearer 4ae1c2698f5d683e1e6b6f573fbf946e39ef56648e384f952913a52789f0d55e4b4f69664830c4c039c215818310f6609f9f3b28d6f1f8eb965d2fec5190b512ed190800e2e47daea67e62b26643a54cbf6ffc0ad8164432fde26024bf853162ce2199d6092c85b9057f857f49d5288df37e63ecf1f09891e7b128503d53e08a"
      },
    );

    Logger().d("HTTP: ${response.statusCode.toString()}, URL: $url, ");
    Logger().w(utf8.decode(response.bodyBytes));

    return response;
  }

  Future makeMultipartRequest(String url, {required String filePath}) async {
    var request = http.MultipartRequest("POST", Uri.parse("$domain/api/$url"));
    request.headers.addAll({
      "Authorization":
          "Bearer 4ae1c2698f5d683e1e6b6f573fbf946e39ef56648e384f952913a52789f0d55e4b4f69664830c4c039c215818310f6609f9f3b28d6f1f8eb965d2fec5190b512ed190800e2e47daea67e62b26643a54cbf6ffc0ad8164432fde26024bf853162ce2199d6092c85b9057f857f49d5288df37e63ecf1f09891e7b128503d53e08a"
    });

    var pic = await http.MultipartFile.fromPath("files", filePath);
    request.files.add(pic);
    http.StreamedResponse stream = await request.send();
    http.Response response = await http.Response.fromStream(stream);

    Logger().d("HTTP: ${response.statusCode.toString()}, URL: $url, ");
    Logger().w(utf8.decode(response.bodyBytes));

    return response;
  }

// Future makeHttpRequest(
//   String url,
//   body, {
//   required HttpMethodTypes methodType,
//   Map<String, String>? headers,
// }) async {
//
//   url = buildUrl(url);
//   http.Request request = http.Request(methodType.toString().split('.').last, Uri.parse(url));
//
//   if (headers != null) {
//     request.headers.addAll(headers);
//   }
//
//   request.body = jsonEncode(body);
//
//   http.StreamedResponse streamedResponse = await request.send();
//   http.Response response = await http.Response.fromStream(streamedResponse);
//
//   Logger().d("${response.statusCode}");
//
//   return response;
// }
}
