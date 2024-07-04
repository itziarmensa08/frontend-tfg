
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
  NMotors? nMotors;
  Failure? failure;
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
    this.nMotors,
    this.failure,
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
    nMotors = (json['nMotors'] != null) ? NMotors.fromJson(json['nMotors']) : null;
    failure = (json['failure'] != null) ? Failure.fromJson(json['failure']) : null;
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
    if (nMotors != null) {
      data['nMotors'] = nMotors?.toJson();
    }
    if (failure != null) {
      data['failure'] = failure?.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Segment {

  double? velocityIAS;
  double? density;
  double? velocityTAS;
  double? rateClimb;
  double? altitudeInDP;
  double? timeToDP;
  double? timeToFinish;
  double? distanceToFinish;
  bool? reachDP;
  bool? clearDP;
  String? id;

  Segment({
    this.velocityIAS,
    this.velocityTAS,
    this.rateClimb,
    this.altitudeInDP,
    this.id,
    this.density,
    this.timeToFinish,
    this.distanceToFinish,
    this.timeToDP,
    this.reachDP,
    this.clearDP
  });
  Segment.fromJson(Map<String, dynamic> json) {
    velocityIAS = json['velocityIAS']?.toDouble();
    density = json['density']?.toDouble();
    velocityTAS = json['velocityTAS']?.toDouble();
    rateClimb = json['rateClimb']?.toDouble();
    altitudeInDP = json['altitudeInDP']?.toDouble();
    timeToDP = json['timeToDP']?.toDouble();
    timeToFinish = json['timeToFinish']?.toDouble();
    distanceToFinish = json['distanceToFinish']?.toDouble();
    reachDP = json['reachDP'];
    clearDP = json['clearDP'];
    id = json['_id']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['velocityIAS'] = velocityIAS;
    data['density'] = density;
    data['velocityTAS'] = velocityTAS;
    data['rateClimb'] = rateClimb;
    data['altitudeInDP'] = altitudeInDP;
    data['timeToDP'] = timeToDP;
    data['timeToFinish'] = timeToFinish;
    data['distanceToFinish'] = distanceToFinish;
    data['reachDP'] = reachDP;
    data['clearDP'] = clearDP;
    data['_id'] = id;
    return data;
  }
}

class NMotors {

  Segment? firstSegment;
  Segment? secondSegment;
  Segment? thirdSegment;
  String? id;

  NMotors({
    this.id,
    this.firstSegment,
    this.secondSegment,
    this.thirdSegment
  });
  NMotors.fromJson(Map<String, dynamic> json) {
    firstSegment = (json['firstSegment'] != null) ? Segment.fromJson(json['firstSegment']) : null;
    secondSegment = (json['secondSegment'] != null) ? Segment.fromJson(json['secondSegment']) : null;
    thirdSegment = (json['thirdSegment'] != null) ? Segment.fromJson(json['thirdSegment']) : null;
    id = json['_id']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (firstSegment != null) {
      data['firstSegment'] = firstSegment?.toJson();
    }
    if (secondSegment != null) {
      data['secondSegment'] = secondSegment?.toJson();
    }
    if (thirdSegment != null) {
      data['thirdSegment'] = thirdSegment?.toJson();
    }
    data['_id'] = id;
    return data;
  }
}

class Failure {
  double? initialElevation;
  double? distanceToInitial;
  Segment? firstSegment;
  Segment? secondSegment;
  Segment? thirdSegment;
  String? id;

  Failure({
    this.id,
    this.firstSegment,
    this.secondSegment,
    this.thirdSegment,
    this.initialElevation,
    this.distanceToInitial
  });
  Failure.fromJson(Map<String, dynamic> json) {
    firstSegment = (json['firstSegment'] != null) ? Segment.fromJson(json['firstSegment']) : null;
    secondSegment = (json['secondSegment'] != null) ? Segment.fromJson(json['secondSegment']) : null;
    thirdSegment = (json['thirdSegment'] != null) ? Segment.fromJson(json['thirdSegment']) : null;
    initialElevation = json['initialElevation']?.toDouble();
    distanceToInitial = json['distanceToInitial']?.toDouble();
    id = json['_id']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (firstSegment != null) {
      data['firstSegment'] = firstSegment?.toJson();
    }
    if (secondSegment != null) {
      data['secondSegment'] = secondSegment?.toJson();
    }
    if (thirdSegment != null) {
      data['thirdSegment'] = thirdSegment?.toJson();
    }
    data['_id'] = id;
    data['initialElevation'] = initialElevation;
    data['distanceToInitial'] = distanceToInitial;
    return data;
  }
}

