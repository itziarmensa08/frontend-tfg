import 'package:frontend_tfg/data/models/isatable.model.dart';
import 'package:frontend_tfg/data/provider/api.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';

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
          ToastUtils.showErrorToast('Error GetAircrafts: $error');
        }
        return null;
      }
}