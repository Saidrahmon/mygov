class RequestModel {
  int id;
  int status;
  String name;

  RequestModel({required this.id, required this.status, required this.name});

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      id: json['id'],
      status: json['attributes']['requeststatus']['data']['id'],
      name: json['attributes']['requeststatus']['data']['attributes']['name'],
    );
  }

// Map<String, dynamic> toMap() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['id'] = this.id;
//   data['name'] = this.name;
//   data['isSend'] = this.isSend;
//   return data;
// }
}
