
import 'package:frontend_tfg/data/models/airport_model.dart';
import 'package:frontend_tfg/data/models/procedure.model.dart';
import 'package:frontend_tfg/data/provider/api.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';

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
      ToastUtils.showErrorToast('Error Getting Procedures: $error');
    }
    return null;
  }

}