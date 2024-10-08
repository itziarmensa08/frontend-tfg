
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
  String? procedureN;
  String? procedureN1;

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
    this.procedureN,
    this.procedureN1
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
    procedureN = json['procedureN']?.toString();
    procedureN1 = json['procedureN1']?.toString();
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
    data['procedureN'] = procedureN;
    data['procedureN1'] = procedureN1;
    return data;
  }
}

class Segment {
  double? temperature;
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
    this.temperature,
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
    temperature = json['temperature']?.toDouble();
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
    data['temperature'] = temperature;
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

class Altitude {
  bool? state;
  double? dpDistance;
  double? dpElevation;
  Segment? firstSegment;
  Segment? secondSegment;
  Segment? thirdSegment;

  Altitude({
    this.state,
    this.dpDistance,
    this.dpElevation,
    this.firstSegment,
    this.secondSegment,
    this.thirdSegment,
  });

  Altitude.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    dpDistance = json['dpDistance']?.toDouble();
    dpElevation = json['dpElevation']?.toDouble();
    firstSegment = (json['firstSegment'] != null) ? Segment.fromJson(json['firstSegment']) : null;
    secondSegment = (json['secondSegment'] != null) ? Segment.fromJson(json['secondSegment']) : null;
    thirdSegment = (json['thirdSegment'] != null) ? Segment.fromJson(json['thirdSegment']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['state'] = state;
    data['dpDistance'] = dpDistance;
    data['dpElevation'] = dpElevation;
    if (firstSegment != null) {
      data['firstSegment'] = firstSegment?.toJson();
    }
    if (secondSegment != null) {
      data['secondSegment'] = secondSegment?.toJson();
    }
    if (thirdSegment != null) {
      data['thirdSegment'] = thirdSegment?.toJson();
    }
    return data;
  }
}

class GradientModel {
  bool? state;
  double? dpDistance;
  double? gradientValue;
  double? finalGradient;
  Segment? firstSegment;
  Segment? secondSegment;
  Segment? thirdSegment;

  GradientModel({
    this.state,
    this.dpDistance,
    this.gradientValue,
    this.finalGradient,
    this.firstSegment,
    this.secondSegment,
    this.thirdSegment,
  });

  GradientModel.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    dpDistance = json['dpDistance']?.toDouble();
    gradientValue = json['gradientValue']?.toDouble();
    finalGradient = json['finalGradient']?.toDouble();
    firstSegment = (json['firstSegment'] != null) ? Segment.fromJson(json['firstSegment']) : null;
    secondSegment = (json['secondSegment'] != null) ? Segment.fromJson(json['secondSegment']) : null;
    thirdSegment = (json['thirdSegment'] != null) ? Segment.fromJson(json['thirdSegment']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['state'] = state;
    data['dpDistance'] = dpDistance;
    data['gradientValue'] = gradientValue;
    data['finalGradient'] = finalGradient;
    if (firstSegment != null) {
      data['firstSegment'] = firstSegment?.toJson();
    }
    if (secondSegment != null) {
      data['secondSegment'] = secondSegment?.toJson();
    }
    if (thirdSegment != null) {
      data['thirdSegment'] = thirdSegment?.toJson();
    }
    return data;
  }
}

class Failure {
  double? initialElevation;
  double? distanceToInitial;
  Altitude? altitude;
  GradientModel? gradient;
  String? id;

  Failure({
    this.id,
    this.altitude,
    this.gradient,
    this.initialElevation,
    this.distanceToInitial
  });

  Failure.fromJson(Map<String, dynamic> json) {
    initialElevation = json['initialElevation']?.toDouble();
    distanceToInitial = json['distanceToInitial']?.toDouble();
    altitude = (json['altitude'] != null) ? Altitude.fromJson(json['altitude']) : null;
    gradient = (json['gradient'] != null) ? GradientModel.fromJson(json['gradient']) : null;
    id = json['_id']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['initialElevation'] = initialElevation;
    data['distanceToInitial'] = distanceToInitial;
    if (altitude != null) {
      data['altitude'] = altitude?.toJson();
    }
    if (gradient != null) {
      data['gradient'] = gradient?.toJson();
    }
    data['_id'] = id;
    return data;
  }
}

