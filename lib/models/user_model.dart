class UserModel{
  int? id;
  String? username;
  String? email;
  String? pinFl;
  String? surname;
  String? fathername;
  String? name;
  String? birthday;
  bool? ismarried;
  String? userstatus;


  UserModel({
    this.id,
    this.username,
    this.email,
    this.pinFl,
    this.surname,
    this.fathername,
    this.name,
    this.birthday,
    this.ismarried,
    this.userstatus
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      pinFl: json['pinfl'],
      surname: json['surname'],
      fathername: json['fathername'],
      name: json['name'],
      birthday: json['birthday'],
      ismarried: json['ismarried'],
      userstatus: json['userregisterstatus']
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['pinfl'] = this.pinFl;
    data['surname'] = this.surname;
    data['fathername'] = this.fathername;
    data['name'] = this.name;
    data['birthday'] = this.birthday;
    data['ismarried'] = this.ismarried;
    data['userregisterstatus'] = this.userstatus;
    return data;
  }
}