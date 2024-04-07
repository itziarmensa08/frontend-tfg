
class Pressure {

  int? hPa;
  double? PSI;
  double? InHg;

  Pressure({
    this.hPa,
    this.PSI,
    this.InHg,
  });
  Pressure.fromJson(Map<String, dynamic> json) {
    hPa = json['hPa']?.toInt();
    PSI = json['PSI']?.toDouble();
    InHg = json['InHg']?.toDouble();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['hPa'] = hPa;
    data['PSI'] = PSI;
    data['InHg'] = InHg;
    return data;
  }
}

class ISATableData {

  Pressure? pressure;
  int? altitudeFeet;
  double? temperature;
  double? pressureRatio;
  double? density;
  int? speedSound;
  int? altitudeMeters;
  String? id;

  ISATableData({
    this.pressure,
    this.altitudeFeet,
    this.temperature,
    this.pressureRatio,
    this.density,
    this.speedSound,
    this.altitudeMeters,
    this.id,
  });
  ISATableData.fromJson(Map<String, dynamic> json) {
    pressure = (json['pressure'] != null) ? Pressure.fromJson(json['pressure']) : null;
    altitudeFeet = json['altitudeFeet']?.toInt();
    temperature = json['temperature']?.toDouble();
    pressureRatio = json['pressureRatio']?.toDouble();
    density = json['density']?.toDouble();
    speedSound = json['speedSound']?.toInt();
    altitudeMeters = json['altitudeMeters']?.toInt();
    id = json['_id']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (pressure != null) {
      data['pressure'] = pressure?.toJson();
    }
    data['altitudeFeet'] = altitudeFeet;
    data['temperature'] = temperature;
    data['pressureRatio'] = pressureRatio;
    data['density'] = density;
    data['speedSound'] = speedSound;
    data['altitudeMeters'] = altitudeMeters;
    data['_id'] = id;
    return data;
  }
}

class ISATableModel {

  String? id;
  String? title;
  List<ISATableData>? data;
  String? createdAt;
  String? updatedAt;

  ISATableModel({
    this.id,
    this.title,
    this.data,
    this.createdAt,
    this.updatedAt,
  });
  ISATableModel.fromJson(Map<String, dynamic> json) {
    id = json['_id']?.toString();
    title = json['title']?.toString();
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <ISATableData>[];
      v.forEach((v) {
        arr0.add(ISATableData.fromJson(v));
      });
      data = arr0;
    }
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['title'] = title;
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
      v?.forEach((v) {
        arr0.add(v.toJson());
      });
      data['data'] = arr0;
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
