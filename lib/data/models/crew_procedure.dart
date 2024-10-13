
class CrewProcedure {
  String? airport;
  String? aircraft;
  String? id;
  List<ProcedureRWY>? proceduresRWY;

  CrewProcedure({this.airport, this.aircraft, this.proceduresRWY, this.id});

  // Método para convertir un JSON en un objeto CrewProcedure
  CrewProcedure.fromJson(Map<String, dynamic> json) {
    airport = json['airport'];
    aircraft = json['aircraft'];
    id = json['_id']?.toString();
    if (json['proceduresRWY'] != null) {
      proceduresRWY = <ProcedureRWY>[];
      json['proceduresRWY'].forEach((v) {
        proceduresRWY?.add(ProcedureRWY.fromJson(v));
      });
    }
  }

  // Método para convertir un objeto CrewProcedure en JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['airport'] = airport;
    data['aircraft'] = aircraft;
    if (proceduresRWY != null) {
      data['proceduresRWY'] = proceduresRWY?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProcedureRWY {
  String? rwy;
  List<ProcedureDetails>? procedures;

  ProcedureRWY({this.rwy, this.procedures});

  // Método para convertir un JSON en un objeto ProcedureRWY
  ProcedureRWY.fromJson(Map<String, dynamic> json) {
    rwy = json['rwy'];
    if (json['procedures'] != null) {
      procedures = <ProcedureDetails>[];
      json['procedures'].forEach((v) {
        procedures?.add(ProcedureDetails.fromJson(v));
      });
    }
  }

  // Método para convertir un objeto ProcedureRWY en JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rwy'] = rwy;
    if (procedures != null) {
      data['procedures'] = procedures?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProcedureDetails {
  String? sids;
  String? procedure;

  ProcedureDetails({this.sids, this.procedure});

  // Método para convertir un JSON en un objeto ProcedureDetails
  ProcedureDetails.fromJson(Map<String, dynamic> json) {
    sids = json['sids'];
    procedure = json['procedure'];
  }

  // Método para convertir un objeto ProcedureDetails en JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sids'] = sids;
    data['procedure'] = procedure;
    return data;
  }
}
