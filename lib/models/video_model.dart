class VideoModel {
  String title;
  String url;
  String? path;

  VideoModel({required this.title, required this.url, this.path});

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(title: json['title'], url: json['url']);
  }

  factory VideoModel.fromJson2(Map<String, dynamic> json) {
    return VideoModel(title: json['title'], url: json['url'], path: json['path']);
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['url'] = this.url;
    data['path'] = this.path;
    return data;
  }
}
