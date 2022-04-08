class CustomType {
  int id;
  String name;
  bool isSend;

  CustomType({required this.id, required this.name, required this.isSend});

  factory CustomType.fromJson(Map<String, dynamic> json) {
    return CustomType(id: json['id'], name: json['attributes']['name'], isSend: false);
  }

  factory CustomType.fromJson2(Map<String, dynamic> json) {
    return CustomType(id: json['id'], name: json['name'], isSend: json['isSend']);
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['isSend'] = this.isSend;
    return data;
  }
}
