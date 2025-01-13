class AircraftModel {
  String? id;
  String? name;
  String? metro;
  bool? visible;
  String? createdAt;
  String? updatedAt;
  String? profileImage;
  String? elevationImage;
  Profile? profile;

  AircraftModel({
    this.id,
    this.name,
    this.metro,
    this.createdAt,
    this.updatedAt,
    this.profileImage,
    this.profile,
    this.elevationImage,
    this.visible
  });
  AircraftModel.fromJson(Map<String, dynamic> json) {
    id = json['_id']?.toString();
    name = json['name']?.toString();
    metro = json['metro']?.toString();
    visible = json['visible'];
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    profileImage = json['profileImage']?.toString();
    elevationImage = json['elevationImage']?.toString();
    profile = json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    data['metro'] = metro;
    data['visible'] = visible;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['profileImage'] = profileImage;
    data['elevationImage'] = elevationImage;
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    return data;
  }
}

class Profile {
  NMotorsProfile? nMotors;
  FailureProfile? failure;

  Profile({this.nMotors, this.failure});

  Profile.fromJson(Map<String, dynamic> json) {
    nMotors = json['nMotors'] != null ? NMotorsProfile.fromJson(json['nMotors']) : null;
    failure = json['failure'] != null ? FailureProfile.fromJson(json['failure']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (nMotors != null) {
      data['nMotors'] = nMotors!.toJson();
    }
    if (failure != null) {
      data['failure'] = failure!.toJson();
    }
    return data;
  }
}

class NMotorsProfile {
  double? heightFirstSegment;
  double? heightSecondSegment;

  NMotorsProfile({this.heightFirstSegment, this.heightSecondSegment});

  NMotorsProfile.fromJson(Map<String, dynamic> json) {
    heightFirstSegment = json['heightFirstSegment']?.toDouble();
    heightSecondSegment = json['heightSecondSegment']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['heightFirstSegment'] = heightFirstSegment;
    data['heightSecondSegment'] = heightSecondSegment;
    return data;
  }
}

class FailureProfile {
  double? heightFirstSegment;
  double? heightSecondSegment;

  FailureProfile({this.heightFirstSegment, this.heightSecondSegment});

  FailureProfile.fromJson(Map<String, dynamic> json) {
    heightFirstSegment = json['heightFirstSegment']?.toDouble();
    heightSecondSegment = json['heightSecondSegment']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['heightFirstSegment'] = heightFirstSegment;
    data['heightSecondSegment'] = heightSecondSegment;
    return data;
  }
}