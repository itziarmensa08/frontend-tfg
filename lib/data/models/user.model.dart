class Event {
  DateTime? date;
  String? title;
  bool? isCompleted;
  String? id;

  Event({this.date, this.title, this.isCompleted, this.id});

  Event.fromJson(Map<String, dynamic> json) {
    date = json['date'] != null ? DateTime.parse(json['date']) : null;
    title = json['title']?.toString();
    isCompleted = json['isCompleted'];
    id = json['_id']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (date != null) {
      DateTime utcDate = DateTime.utc(
        date!.year,
        date!.month,
        date!.day,
        date!.hour,
        date!.minute,
        date!.second,
      );
      data['date'] = utcDate.toIso8601String();
    } else {
      data['date'] = date;
    }
    data['title'] = title;
    data['isCompleted'] = isCompleted;
    return data;
  }
}

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
  bool? validated;
  List<Event>? tasks;

  UserModel({
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
    this.language,
    this.validated,
    this.tasks,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
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
    validated = json['validated'];
    if (json['tasks'] != null) {
      tasks = [];
      json['tasks'].forEach((v) {
        tasks?.add(Event.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
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
    data['validated'] = validated;
    if (tasks != null) {
      data['tasks'] = tasks?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}