import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/aircraft_model.dart';
import 'package:frontend_tfg/data/provider/api.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';
import 'package:get/get.dart';

class AircraftService {
  static Future<List<AircraftModel>?> getAircrafts(BuildContext context) async {
    ApiResponse response;
    ToastUtils.initFToast(context);

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
        ToastUtils.showErrorToast(context, response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast(context, 'Error GetAircrafts: $error');
    }
    return null;
  }

  static Future<void> addAircraft(AircraftModel aircraft, BuildContext context) async {
    ApiResponse response;
    ToastUtils.initFToast(context);

    try {
      response = await MyApi().post(
        '/aircrafts',
        data: aircraft.toJson()
      );

      if (response.statusCode == 201) {
        ToastUtils.showSuccessToast(context, 'succesAddAircraft'.tr);
      } else {
        ToastUtils.showErrorToast(context, '${response.data}'.tr);
      }
    } catch (error) {
      ToastUtils.showErrorToast(context, 'Error AddAircraft: $error');
    }
  }

  static Future<void> deleteAircraft(BuildContext context, String idAircraft) async {
    ApiResponse response;
    ToastUtils.initFToast(context);

    try {
      response = await MyApi().delete('/aircrafts/$idAircraft');

      if (response.statusCode == 200) {
        ToastUtils.showSuccessToast(context, 'aircraftDeleted'.tr);
      } else {
        ToastUtils.showErrorToast(context, response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast(context, 'Error DeleteAircraft: $error');
    }
  }

  static Future<AircraftModel?> getAircraftById(BuildContext context, String idAircraft) async {
    ApiResponse response;
    ToastUtils.initFToast(context);

    try {
      response = await MyApi().get('/aircrafts/$idAircraft');

      if (response.statusCode == 200) {
        dynamic data = response.data;
        AircraftModel aircraft = AircraftModel.fromJson(data);
        return aircraft;
      } else {
        ToastUtils.showErrorToast(context, response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast(context, 'Error GetAircraft: $error');
    }
    return null;
  }

  static Future<bool?> updateAircraft(BuildContext context, String idAircraft, AircraftModel aircraft) async {
    ApiResponse response;
    ToastUtils.initFToast(context);

    try {
      response = await MyApi().put(
        '/aircrafts/$idAircraft',
        data: aircraft.toJson()
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        ToastUtils.showErrorToast(context, response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast(context, 'Error UpdateAircraft: $error');
    }
    return null;
  }
}