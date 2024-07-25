
import 'package:frontend_tfg/data/models/procedure.model.dart';
import 'package:frontend_tfg/data/provider/api.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';

class ProcedureService {
  static Future<dynamic> postProcedure(Procedure procedure) async {
    ApiResponse response;

    try {
      response = await MyApi().post(
        '/procedures',
        data: procedure.toJson()
      );

      if (response.statusCode == 201) {

        ToastUtils.showSuccessToast('El procedimiento se ha guardado correctament');

        return response.data;

      } else {
        ToastUtils.showErrorToast(response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast('Error Posting Procedure: $error');
    }
    return null;
  }

  static Future<dynamic> getAllProcedures() async {
    ApiResponse response;

    try {
      response = await MyApi().get(
        '/procedures',
      );

      if (response.statusCode == 200) {

        dynamic data = response.data;

        return data;

      } else {
        ToastUtils.showErrorToast(response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast('Error Getting Procedures: $error');
    }
    return null;
  }

}