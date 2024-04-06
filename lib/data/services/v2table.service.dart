
import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/v2table.model.dart';
import 'package:frontend_tfg/data/provider/api.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';

class ObtainedDataWithVelocity {
  final List<V2TableRowData> dataList;
  final double velocityValue;

  ObtainedDataWithVelocity({required this.dataList, required this.velocityValue});
}

class V2TableService {
  static Future<V2TableModel?> getV2tableByAircraft(BuildContext context, String id) async {
    ApiResponse response;
    ToastUtils.initFToast(context);

    try {
      response = await MyApi().get('/v2tables/aircraft/$id');

      if (response.statusCode == 200) {

        V2TableModel table = V2TableModel.fromJson(response.data);

        return table;

      } else {
        ToastUtils.showErrorToast(context, response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast(context, 'Error GetAircrafts: $error');
    }
    return null;
  }

  static Future<ObtainedDataWithVelocity?> getObtainedData(BuildContext context, String id, double pressure, double grossWeight, double temperature, String speedName) async {
    ApiResponse response;
    ToastUtils.initFToast(context);

    try {
      response = await MyApi().post('/v2tables/filterData',
        data: {
          "pressure": pressure,
          "grossWeight": grossWeight,
          "temperature": temperature,
          "speedName": speedName,
          "idAircraft": id
        }
      );

      if (response.statusCode == 200) {

        List<V2TableRowData> dataList = (response.data['cells'] as List<dynamic>)
          .map((item) => V2TableRowData.fromJson(item))
          .toList();

        var velocityValue = response.data['finalVelocity'];

        return ObtainedDataWithVelocity(dataList: dataList, velocityValue: velocityValue);

      } else {
        ToastUtils.showErrorToast(context, response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast(context, 'Error GetAircrafts: $error');
    }
    return null;
  }
}