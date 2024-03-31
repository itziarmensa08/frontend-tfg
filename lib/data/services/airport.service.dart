import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/airport_model.dart';
import 'package:frontend_tfg/data/provider/api.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';
import 'package:get/get.dart';

class AirportService {
  static Future<List<AirportModel>?> getAirports(BuildContext context) async {
    ApiResponse response;
    ToastUtils.initFToast(context);

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
        ToastUtils.showErrorToast(context, response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast(context, 'Error GetAirports: $error');
    }
    return null;
  }

  static Future<AirportModel?> addAirport(AirportModel airport, BuildContext context) async {
    ApiResponse response;
    ToastUtils.initFToast(context);

    try {
      response = await MyApi().post(
        '/airports',
        data: airport.toJson()
      );

      if (response.statusCode == 201) {
        dynamic data = response.data;
        AirportModel airportModel = AirportModel.fromJson(data);
        ToastUtils.showSuccessToast(context, 'succesAddAirport'.tr);
        return airportModel;
      } else {
        ToastUtils.showErrorToast(context, '${response.data}'.tr);
        return null;
      }
    } catch (error) {
      ToastUtils.showErrorToast(context, 'Error AddAirport: $error');
      return null;
    }
  }

  static Future<void> deleteAirport(BuildContext context, String idAirport) async {
    ApiResponse response;
    ToastUtils.initFToast(context);

    try {
      response = await MyApi().delete('/airports/$idAirport');

      if (response.statusCode == 200) {
        ToastUtils.showSuccessToast(context, 'airportDeleted'.tr);
      } else {
        ToastUtils.showErrorToast(context, response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast(context, 'Error DeleteAirport: $error');
    }
  }

  static Future<AirportModel?> getAirportById(BuildContext context, String idAirport) async {
    ApiResponse response;
    ToastUtils.initFToast(context);

    try {
      response = await MyApi().get('/airports/$idAirport');

      if (response.statusCode == 200) {
        dynamic data = response.data;
        AirportModel airport = AirportModel.fromJson(data);
        return airport;
      } else {
        ToastUtils.showErrorToast(context, response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast(context, 'Error GetAirport: $error');
    }
    return null;
  }

  static Future<bool?> updateAirport(BuildContext context, String idAirport, AirportModel airport) async {
    ApiResponse response;
    ToastUtils.initFToast(context);

    try {
      response = await MyApi().put(
        '/airports/$idAirport',
        data: airport.toJson()
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        ToastUtils.showErrorToast(context, response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast(context, 'Error UpdateAirport: $error');
    }
    return null;
  }
}