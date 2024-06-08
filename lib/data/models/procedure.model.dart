class Procedure {

  String? id;
  String? airport;
  String? aircraft;
  String? sidDoc;
  String? rwyDoc;
  String? sidName;
  String? rwyName;
  String? dpName;
  double? dpDistance;
  double? dpAltitude;
  double? weight;
  FirstSegment? firstSegment;
  SecondSegment? secondSegment;
  ThirdSegment? thirdSegment;
  String? createdAt;
  String? updatedAt;

  Procedure({
    this.id,
    this.airport,
    this.aircraft,
    this.sidDoc,
    this.rwyDoc,
    this.sidName,
    this.rwyName,
    this.dpName,
    this.dpDistance,
    this.dpAltitude,
    this.weight,
    this.firstSegment,
    this.secondSegment,
    this.thirdSegment,
    this.createdAt,
    this.updatedAt,
  });
  Procedure.fromJson(Map<String, dynamic> json) {
    id = json['_id']?.toString();
    airport = json['airport']?.toString();
    aircraft = json['aircraft']?.toString();
    sidDoc = json['sidDoc']?.toString();
    rwyDoc = json['rwyDoc']?.toString();
    sidName = json['sidName']?.toString();
    rwyName = json['rwyName']?.toString();
    dpName = json['dpName']?.toString();
    dpDistance = json['dpDistance']?.toDouble();
    dpAltitude = json['dpAltitude']?.toDouble();
    weight = json['weight']?.toDouble();
    firstSegment = (json['firstSegment'] != null) ? FirstSegment.fromJson(json['firstSegment']) : null;
    secondSegment = (json['secondSegment'] != null) ? SecondSegment.fromJson(json['secondSegment']) : null;
    thirdSegment = (json['thirdSegment'] != null) ? ThirdSegment.fromJson(json['thirdSegment']) : null;
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['airport'] = airport;
    data['aircraft'] = aircraft;
    data['sidDoc'] = sidDoc;
    data['rwyDoc'] = rwyDoc;
    data['sidName'] = sidName;
    data['rwyName'] = rwyName;
    data['dpName'] = dpName;
    data['dpDistance'] = dpDistance;
    data['dpAltitude'] = dpAltitude;
    data['weight'] = weight;
    if (firstSegment != null) {
      data['firstSegment'] = firstSegment?.toJson();
    }
    if (secondSegment != null) {
      data['secondSegment'] = secondSegment?.toJson();
    }
    if (thirdSegment != null) {
      data['thirdSegment'] = thirdSegment?.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class ThirdSegment {

  double? velocityIAS;
  double? density;
  double? velocityTAS;
  double? rateClimb;
  double? distanceToDP;
  String? id;

  ThirdSegment({
    this.velocityIAS,
    this.velocityTAS,
    this.rateClimb,
    this.distanceToDP,
    this.id,
    this.density
  });
  ThirdSegment.fromJson(Map<String, dynamic> json) {
    velocityIAS = json['velocityIAS']?.toDouble();
    density = json['density']?.toDouble();
    velocityTAS = json['velocityTAS']?.toDouble();
    rateClimb = json['rateClimb']?.toDouble();
    distanceToDP = json['distanceToDP']?.toDouble();
    id = json['_id']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['velocityIAS'] = velocityIAS;
    data['density'] = density;
    data['velocityTAS'] = velocityTAS;
    data['rateClimb'] = rateClimb;
    data['distanceToDP'] = distanceToDP;
    data['_id'] = id;
    return data;
  }
}

class SecondSegment {

  double? velocityIAS;
  double? density;
  double? velocityTAS;
  double? rateClimb;
  double? distanceToDP;
  String? id;

  SecondSegment({
    this.velocityIAS,
    this.velocityTAS,
    this.rateClimb,
    this.distanceToDP,
    this.id,
    this.density
  });
  SecondSegment.fromJson(Map<String, dynamic> json) {
    velocityIAS = json['velocityIAS']?.toDouble();
    density = json['density']?.toDouble();
    velocityTAS = json['velocityTAS']?.toDouble();
    rateClimb = json['rateClimb']?.toDouble();
    distanceToDP = json['distanceToDP']?.toDouble();
    id = json['_id']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['velocityIAS'] = velocityIAS;
    data['density'] = density;
    data['velocityTAS'] = velocityTAS;
    data['rateClimb'] = rateClimb;
    data['distanceToDP'] = distanceToDP;
    data['_id'] = id;
    return data;
  }
}

class FirstSegment {

  double? velocityIAS;
  double? density;
  double? velocityTAS;
  double? rateClimb;
  double? distanceToDP;
  double? timeToFinish;
  double? distanceToFinish;
  String? id;

  FirstSegment({
    this.velocityIAS,
    this.velocityTAS,
    this.rateClimb,
    this.distanceToDP,
    this.id,
    this.density,
    this.timeToFinish,
    this.distanceToFinish
  });
  FirstSegment.fromJson(Map<String, dynamic> json) {
    velocityIAS = json['velocityIAS']?.toDouble();
    density = json['density']?.toDouble();
    velocityTAS = json['velocityTAS']?.toDouble();
    rateClimb = json['rateClimb']?.toDouble();
    distanceToDP = json['distanceToDP']?.toDouble();
    timeToFinish = json['timeToFinish']?.toDouble();
    distanceToFinish = json['distanceToFinish']?.toDouble();
    id = json['_id']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['velocityIAS'] = velocityIAS;
    data['density'] = density;
    data['velocityTAS'] = velocityTAS;
    data['rateClimb'] = rateClimb;
    data['distanceToDP'] = distanceToDP;
    data['timeToFinish'] = timeToFinish;
    data['distanceToFinish'] = distanceToFinish;
    data['_id'] = id;
    return data;
  }
}


