
import 'package:frontend_tfg/data/models/aircraft_model.dart';
import 'package:frontend_tfg/data/models/airport_model.dart';
import 'package:frontend_tfg/data/models/procedure.model.dart';
import 'package:frontend_tfg/data/provider/api.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';
import 'package:get/get.dart';

class ProcedureService {
  static Future<dynamic> postProcedure(Procedure procedure) async {
    ApiResponse response;

    try {
      response = await MyApi().post(
        '/procedures',
        data: procedure.toJson()
      );

      if (response.statusCode == 201) {

        ToastUtils.showSuccessToast('El procedimiento se ha guardado correctament');

        return response.data;

      } else {
        ToastUtils.showErrorToast(response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast('Error Posting Procedure: $error');
    }
    return null;
  }

  static Future<dynamic> getAllProcedures() async {
    ApiResponse response;

    try {
      response = await MyApi().get(
        '/procedures',
      );

      if (response.statusCode == 200) {

        dynamic data = response.data;

        return data;

      } else {
        ToastUtils.showErrorToast(response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast('Error Getting Procedures: $error');
    }
    return null;
  }

  static Future<dynamic> updateProcedureFields(String id, {required String sidName, required String rwyName, required String dpName}) async {
    ApiResponse response;

    final Map<String, dynamic> data = {};

    data['sidName'] = sidName;
    data['rwyName'] = rwyName;
    data['dpName'] = dpName;

    try {
      response = await MyApi().put(
        '/procedures/$id',
        data: data,
      );

      if (response.statusCode == 200) {
        ToastUtils.showSuccessToast('successEdit'.tr);
        return response.data;
      } else {
        ToastUtils.showErrorToast(response.data);
      }
    } catch (error) {
      ToastUtils.showErrorToast('Error Actualizando Procedure: $error');
    }
    return null;
  }

  static Future<dynamic> deleteProcedure(String id) async {
    ApiResponse response;

    try {
      response = await MyApi().delete(
        '/procedures/$id',
      );

      if (response.statusCode == 200) {

        ToastUtils.showSuccessToast('deletedCorrectly'.tr);

      } else {
        ToastUtils.showErrorToast(response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast('Error Getting Procedures: $error');
    }
    return null;
  }

  static Future<dynamic> downloadPdfProcedure(String idProcedure) async {
    ApiResponse response;

    try {
      response = await MyApi().post(
        '/pdf/generate/$idProcedure',
      );

      if (response.statusCode == 200) {

        return response.data;

      } else {
        ToastUtils.showErrorToast(response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast('Error Downloading Procedure: $error');
    }
    return null;
  }

  static Future<dynamic> downloadPdfProcedureCombined(List<String?> idsProcedure) async {
    ApiResponse response;

    final Map<String, dynamic> requestData = {'ids': idsProcedure};

    try {
      response = await MyApi().post(
        '/pdf/generate',
        data: requestData
      );

      if (response.statusCode == 200) {

        return response.data;

      } else {
        ToastUtils.showErrorToast(response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast('Error Downloading Procedure: $error');
    }
    return null;
  }

  static Future<dynamic> getAirportsWithProcedures() async {
    ApiResponse response;

    try {
      response = await MyApi().get(
        '/procedures/list/airports',
      );

      if (response.statusCode == 200) {

        dynamic data = response.data;

        if (data is List) {
          List<AirportModel> airports = data.map((airportJson) => AirportModel.fromJson(airportJson)).toList();
          return airports;
        } else {
          ToastUtils.showErrorToast('Invalid data format');
        }

        return data;

      } else {
        ToastUtils.showErrorToast(response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast('Error Getting Airports: $error');
    }
    return null;
  }

  static Future<dynamic> getAircraftsByAirport(String id) async {
    ApiResponse response;

    try {
      response = await MyApi().get(
        '/procedures/list/aircrafts/$id',
      );

      if (response.statusCode == 200) {

        dynamic data = response.data;

        if (data is List) {
          List<AircraftModel> aircrafts = data.map((aircraftJson) => AircraftModel.fromJson(aircraftJson)).toList();
          return aircrafts;
        } else {
          ToastUtils.showErrorToast('Invalid data format');
        }

        return data;

      } else {
        ToastUtils.showErrorToast(response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast('Error Getting Aircrafts: $error');
    }
    return null;
  }

  static Future<dynamic> getProcedureByAirportnadAircraft(String idAirport, String idAircraft) async {
    ApiResponse response;

    try {
      response = await MyApi().get(
        '/procedures/list/airport/$idAirport/aircraft/$idAircraft',
      );

      if (response.statusCode == 200) {

        dynamic data = response.data;

        if (data is List) {
          List<Procedure> procedures = data.map((procedureJson) => Procedure.fromJson(procedureJson)).toList();
          return procedures;
        } else {
          ToastUtils.showErrorToast('Invalid data format');
        }

        return data;

      } else {
        ToastUtils.showErrorToast(response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast('Error Getting Procedures: $error');
    }
    return null;
  }

}