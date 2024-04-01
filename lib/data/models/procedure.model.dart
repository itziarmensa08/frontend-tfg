class Procedure {

  String? id;
  String? airport;
  String? aircraft;
  String? sidDoc;
  String? rwyDoc;
  String? sidName;
  String? rwyName;
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
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
