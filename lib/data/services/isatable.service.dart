import 'package:frontend_tfg/data/models/isatable.model.dart';
import 'package:frontend_tfg/data/provider/api.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';

class ObtainedDataWithVelocity {
  final List<ISATableData> dataList;
  final double densityValue;

  ObtainedDataWithVelocity({required this.dataList, required this.densityValue});
}

class ISATableService {
    static Future<ISATableModel?> getISATables() async {
      ApiResponse response;

      try {
        response = await MyApi().get('/ISAtables');

        if (response.statusCode == 200) {

          ISATableModel table = ISATableModel.fromJson(response.data[0]);

          return table;

        } else {
          ToastUtils.showErrorToast(response.data);
        }

      } catch (error) {
        ToastUtils.showErrorToast('Error GetISATable: $error');
      }
      return null;
    }

    static Future<ObtainedDataWithVelocity?> getObtainedData(double altitud) async {
      ApiResponse response;

      try {
        response = await MyApi().post('/isatables/filterData',
          data: {
            "altitudeFeet": altitud,
          }
        );

        if (response.statusCode == 200) {

          List<ISATableData> dataList = (response.data['cells'] as List<dynamic>)
            .map((item) => ISATableData.fromJson(item))
            .toList();

          var densityValue = response.data['densityValue'];

          return ObtainedDataWithVelocity(dataList: dataList, densityValue: densityValue);

        } else {
          ToastUtils.showErrorToast(response.data);
        }

      } catch (error) {
        ToastUtils.showErrorToast('Error GetClosetDataISA: $error');
      }
      return null;
    }
}