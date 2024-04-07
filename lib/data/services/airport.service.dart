import 'package:frontend_tfg/data/models/airport_model.dart';
import 'package:frontend_tfg/data/provider/api.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';
import 'package:get/get.dart';

class AirportService {
  static Future<List<AirportModel>?> getAirports() async {
    ApiResponse response;

    try {
      response = await MyApi().get('/airports');

      if (response.statusCode == 200) {
        dynamic data = response.data;

        List<AirportModel> airports = [];
        for (var airport in data) {
          airports.add(AirportModel.fromJson(airport));
        }

        return airports;

      } else {
        ToastUtils.showErrorToast(response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast('Error GetAirports: $error');
    }
    return null;
  }

  static Future<AirportModel?> addAirport(AirportModel airport) async {
    ApiResponse response;

    try {
      response = await MyApi().post(
        '/airports',
        data: airport.toJson()
      );

      if (response.statusCode == 201) {
        dynamic data = response.data;
        AirportModel airportModel = AirportModel.fromJson(data);
        ToastUtils.showSuccessToast('succesAddAirport'.tr);
        return airportModel;
      } else {
        ToastUtils.showErrorToast('${response.data}'.tr);
        return null;
      }
    } catch (error) {
      ToastUtils.showErrorToast('Error AddAirport: $error');
      return null;
    }
  }

  static Future<void> deleteAirport(String idAirport) async {
    ApiResponse response;

    try {
      response = await MyApi().delete('/airports/$idAirport');

      if (response.statusCode == 200) {
        ToastUtils.showSuccessToast('airportDeleted'.tr);
      } else {
        ToastUtils.showErrorToast(response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast('Error DeleteAirport: $error');
    }
  }

  static Future<AirportModel?> getAirportById(String idAirport) async {
    ApiResponse response;

    try {
      response = await MyApi().get('/airports/$idAirport');

      if (response.statusCode == 200) {
        dynamic data = response.data;
        AirportModel airport = AirportModel.fromJson(data);
        return airport;
      } else {
        ToastUtils.showErrorToast(response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast('Error GetAirport: $error');
    }
    return null;
  }

  static Future<bool?> updateAirport(String idAirport, AirportModel airport) async {
    ApiResponse response;

    try {
      response = await MyApi().put(
        '/airports/$idAirport',
        data: airport.toJson()
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        ToastUtils.showErrorToast(response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast('Error UpdateAirport: $error');
    }
    return null;
  }
}