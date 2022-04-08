class FamilyMember {
  int? id;
  String? name;
  String? surname;
  String? fatherName;
  String? birthday;
  String? pinFl;
  String? workplace;
  String? salary;
  String? relation;

  FamilyMember({
    this.id,
    this.name,
    this.surname,
    this.fatherName,
    this.birthday,
    this.pinFl,
    this.workplace,
    this.salary,
    this.relation,
  });

  factory FamilyMember.fromJson(Map<String, dynamic> json) {
    String memberType = "kiritilmagan";
    if(json['membertype']['data'] != null){
      memberType = json['membertype']['data']['attributes']['name'];
    }

    return FamilyMember(
      name: json['name'],
      surname: json['surname'],
      fatherName: json['fathername'],
      birthday: json['birthday'],
      pinFl: json['pinfl'],
      workplace: json['workplace'],
      salary: json['salary'],
      relation: memberType,
    );
  }
//
//   Map<String, dynamic> toMap() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['username'] = this.username;
//     data['email'] = this.email;
//     return data;
//   }
}
