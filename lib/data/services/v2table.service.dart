import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/v2table.moel.dart';
import 'package:frontend_tfg/data/provider/api.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';

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
}