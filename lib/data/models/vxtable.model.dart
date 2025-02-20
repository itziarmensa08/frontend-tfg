///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class VXtableRowsWeights {
/*
{
  "pressureAltitude": 0,
  "velocityValue": 150
} 
*/

  int? weight;
  int? velocityValue;
  String? id;

  VXtableRowsWeights({
    this.weight,
    this.velocityValue,
    this.id
  });
  VXtableRowsWeights.fromJson(Map<String, dynamic> json) {
    weight = json['weight']?.toInt();
    velocityValue = json['velocityValue']?.toInt();
    id = json['_id']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['weight'] = weight;
    data['velocityValue'] = velocityValue;
    data['_id'] = id;
    return data;
  }
}

class VXtableRows {
/*
{
  "grossWeight": 16000,
  "pressures": [
    {
      "pressureAltitude": 0,
      "velocityValue": 150
    }
  ]
} 
*/

  int? pressure;
  String? id;
  List<VXtableRowsWeights>? weights;

  VXtableRows({
    this.pressure,
    this.weights,
    this.id
  });
  VXtableRows.fromJson(Map<String, dynamic> json) {
    pressure = json['pressure']?.toInt();
    id = json['_id']?.toString();
  if (json['weights'] != null) {
  final v = json['weights'];
  final arr0 = <VXtableRowsWeights>[];
  v.forEach((v) {
  arr0.add(VXtableRowsWeights.fromJson(v));
  });
    weights = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['pressure'] = pressure;
    data['_id'] = id;
    if (weights != null) {
      final v = weights;
      final arr0 = [];
  v?.forEach((v) {
  arr0.add(v.toJson());
  });
      data['weights'] = arr0;
    }
    return data;
  }
}

class VXTableModel {

  String? id;
  List<String>? aircraft;
  String? title;
  List<VXtableRows>? rows;
  String? createdAt;
  String? updatedAt;

  VXTableModel({
    this.id,
    this.aircraft,
    this.title,
    this.rows,
    this.createdAt,
    this.updatedAt,
  });
  VXTableModel.fromJson(Map<String, dynamic> json) {
    id = json['_id']?.toString();
  if (json['aircraft'] != null) {
  final v = json['aircraft'];
  final arr0 = <String>[];
  v.forEach((v) {
  arr0.add(v.toString());
  });
    aircraft = arr0;
    }
    title = json['title']?.toString();
  if (json['rows'] != null) {
  final v = json['rows'];
  final arr0 = <VXtableRows>[];
  v.forEach((v) {
  arr0.add(VXtableRows.fromJson(v));
  });
    rows = arr0;
    }
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    if (aircraft != null) {
      final v = aircraft;
      final arr0 = [];
  v?.forEach((v) {
  arr0.add(v);
  });
      data['aircraft'] = arr0;
    }
    data['title'] = title;
    if (rows != null) {
      final v = rows;
      final arr0 = [];
  v?.forEach((v) {
  arr0.add(v.toJson());
  });
      data['rows'] = arr0;
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
