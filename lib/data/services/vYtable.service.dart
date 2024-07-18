
import 'package:frontend_tfg/data/models/vytable.model.dart';
import 'package:frontend_tfg/data/provider/api.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';

class ObtainedDataVYWithVelocity {
  final List<VYtableRowsPressures> dataList;
  final double velocityValue;

  ObtainedDataVYWithVelocity({required this.dataList, required this.velocityValue});
}

class VYTableService {
  static Future<VYTableModel?> getVYtableByAircraft(String id, String state) async {
    ApiResponse response;

    try {
      response = await MyApi().get('/vYtables/aircraft/$id/$state');

      if (response.statusCode == 200) {

        VYTableModel table = VYTableModel.fromJson(response.data);

        return table;

      } else {
        ToastUtils.showErrorToast(response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast('Error GetVYTable: $error');
    }
    return null;
  }

  static Future<ObtainedDataVYWithVelocity?> getObtainedData(String id, double pressure, double grossWeight, String state) async {
    ApiResponse response;

    try {
      response = await MyApi().post('/vYtables/filterData',
        data: {
          "pressure": pressure,
          "grossWeight": grossWeight,
          "idAircraft": id,
          "state": state
        }
      );

      if (response.statusCode == 200) {

        List<VYtableRowsPressures> dataList = (response.data['cells'] as List<dynamic>)
          .map((item) => VYtableRowsPressures.fromJson(item))
          .toList();

        var velocityValue = response.data['finalVelocity'];

        return ObtainedDataVYWithVelocity(dataList: dataList, velocityValue: velocityValue);

      } else {
        ToastUtils.showErrorToast(response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast('Error GetClosetDataVY: $error');
    }
    return null;
  }
}