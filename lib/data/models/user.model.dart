// https://ashamp.github.io/jsonToDartModel/

class UserModel {
  String? id;
  String? name;
  String? surname;
  String? username;
  String? email;
  String? password;
  String? role;
  int? telephone;
  DateTime? dateBorn;
  String? profileImage;
  String? language;

  UserModel(
    { 
      this.id, 
      this.name,
      this.surname,
      this.username,
      this.email,
      this.password,
      this.role,
      this.telephone,
      this.dateBorn,
      this.profileImage,
      this.language
    }
  );

  UserModel.fromJson(Map<String, dynamic> json){
    name = json['name']?.toString();
    surname = json['surname']?.toString();
    username = json['username']?.toString();
    email = json['email']?.toString();
    password = json['password']?.toString();
    role = json['role']?.toString();
    id = json['_id']?.toString();
    telephone = json['telephone'];
    dateBorn = json['dateBorn'] != null ? DateTime.parse(json['dateBorn']) : null;
    profileImage = json['profileImage']?.toString();
    language = json['language']?.toString();
  }

  Map<String, dynamic> toJson(){
    final data = <String, dynamic>{};
    data['name'] = name;
    data['surname'] = surname;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['role'] = role;
    data['_id'] = id;
    data['telephone'] = telephone;
    if (dateBorn != null) {
      DateTime utcDateBorn = DateTime.utc(
        dateBorn!.year,
        dateBorn!.month,
        dateBorn!.day,
      );
      data['dateBorn'] = utcDateBorn.toIso8601String();
    } else {
      data['dateBorn'] = dateBorn;
    }
    data['profileImage'] = profileImage;
    data['language'] = language;
    return data;
  }
}