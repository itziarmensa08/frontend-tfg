import 'package:frontend_tfg/data/models/aircraft_model.dart';
import 'package:frontend_tfg/data/provider/api.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';
import 'package:get/get.dart';

class AircraftService {
  static Future<List<AircraftModel>?> getAircrafts() async {
    ApiResponse response;

    try {
      response = await MyApi().get('/aircrafts');

      if (response.statusCode == 200) {
        dynamic data = response.data;

        List<AircraftModel> aircrafts = [];
        for (var aircraft in data) {
          aircrafts.add(AircraftModel.fromJson(aircraft));
        }

        return aircrafts;

      } else {
        ToastUtils.showErrorToast(response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast('Error GetAircrafts: $error');
    }
    return null;
  }

  static Future<void> addAircraft(AircraftModel aircraft) async {
    ApiResponse response;

    try {
      response = await MyApi().post(
        '/aircrafts',
        data: aircraft.toJson()
      );

      if (response.statusCode == 201) {
        ToastUtils.showSuccessToast('succesAddAircraft'.tr);
      } else {
        ToastUtils.showErrorToast('${response.data}'.tr);
      }
    } catch (error) {
      ToastUtils.showErrorToast('Error AddAircraft: $error');
    }
  }

  static Future<void> deleteAircraft(String idAircraft) async {
    ApiResponse response;

    try {
      response = await MyApi().delete('/aircrafts/$idAircraft');

      if (response.statusCode == 200) {
        ToastUtils.showSuccessToast('aircraftDeleted'.tr);
      } else {
        ToastUtils.showErrorToast(response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast('Error DeleteAircraft: $error');
    }
  }

  static Future<AircraftModel?> getAircraftById(String idAircraft) async {
    ApiResponse response;

    try {
      response = await MyApi().get('/aircrafts/$idAircraft');

      if (response.statusCode == 200) {
        dynamic data = response.data;
        AircraftModel aircraft = AircraftModel.fromJson(data);
        return aircraft;
      } else {
        ToastUtils.showErrorToast(response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast('Error GetAircraft: $error');
    }
    return null;
  }

  static Future<bool?> updateAircraft(String idAircraft, AircraftModel aircraft) async {
    ApiResponse response;

    try {
      response = await MyApi().put(
        '/aircrafts/$idAircraft',
        data: aircraft.toJson()
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        ToastUtils.showErrorToast(response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast('Error UpdateAircraft: $error');
    }
    return null;
  }
}