
import 'package:frontend_tfg/data/models/vxtable.model.dart';
import 'package:frontend_tfg/data/provider/api.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';

class ObtainedDataVXWithVelocity {
  final List<VXtableRowsWeights> dataList;
  final double velocityValue;

  ObtainedDataVXWithVelocity({required this.dataList, required this.velocityValue});
}

class VXTableService {
  static Future<VXTableModel?> getVXtableByAircraft(String id, String state) async {
    ApiResponse response;

    try {
      response = await MyApi().get('/vXtables/aircraft/$id/$state');

      if (response.statusCode == 200) {

        VXTableModel table = VXTableModel.fromJson(response.data);

        return table;

      } else {
        ToastUtils.showErrorToast(response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast('Error GetVYTable: $error');
    }
    return null;
  }

  static Future<ObtainedDataVXWithVelocity?> getObtainedData(String id, double pressure, double grossWeight, String state) async {
    ApiResponse response;

    try {
      response = await MyApi().post('/vXtables/filterData',
        data: {
          "pressure": pressure,
          "grossWeight": grossWeight,
          "idAircraft": id,
          "state": state
        }
      );

      if (response.statusCode == 200) {

        List<VXtableRowsWeights> dataList = (response.data['cells'] as List<dynamic>)
          .map((item) => VXtableRowsWeights.fromJson(item))
          .toList();

        var velocityValue = response.data['finalVelocity'] ?? 0;

        return ObtainedDataVXWithVelocity(dataList: dataList, velocityValue: velocityValue);

      } else {
        ToastUtils.showErrorToast(response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast('Error GetClosetDataVY: $error');
    }
    return null;
  }
}