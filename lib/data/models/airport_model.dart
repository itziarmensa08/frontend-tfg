class AirportModel {

  String? name;
  double? elevation;
  String? oaciCode;
  String? iataCode;
  String? id;
  String? createdAt;
  String? updatedAt;
  String? profileImage;
  double? referenceTemperature;

  AirportModel({
    this.name,
    this.elevation,
    this.oaciCode,
    this.iataCode,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.profileImage,
    this.referenceTemperature,
  });
  AirportModel.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    elevation = json['elevation']?.toDouble();
    referenceTemperature = json['referenceTemperature']?.toDouble();
    oaciCode = json['oaciCode']?.toString();
    iataCode = json['iataCode']?.toString();
    id = json['_id']?.toString();
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    profileImage = json['profileImage']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['elevation'] = elevation;
    data['referenceTemperature'] = referenceTemperature;
    data['oaciCode'] = oaciCode;
    data['iataCode'] = iataCode;
    data['_id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['profileImage'] = profileImage;
    return data;
  }
}
