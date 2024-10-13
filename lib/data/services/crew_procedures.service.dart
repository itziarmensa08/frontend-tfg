import 'package:frontend_tfg/data/models/crew_procedure.dart';
import 'package:frontend_tfg/data/provider/api.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';
import 'package:get/get.dart';

class CrewProcedureService {

  static Future<CrewProcedure?> addCrewProc(CrewProcedure crewProcedure) async {
    ApiResponse response;

    try {
      response = await MyApi().post(
        '/crewProcedures',
        data: crewProcedure.toJson()
      );

      if (response.statusCode == 201) {
        dynamic data = response.data;
        CrewProcedure proc = CrewProcedure.fromJson(data);
        ToastUtils.showSuccessToast('succesAddCrewProc'.tr);
        return proc;
      } else {
        ToastUtils.showErrorToast('${response.data}'.tr);
        return null;
      }
    } catch (error) {
      ToastUtils.showErrorToast('Error AddCrewProc: $error');
      return null;
    }
  }

  static Future<dynamic> downloadCrewProc(String id) async {
    ApiResponse response;

    try {
      response = await MyApi().post(
        '/pdf/generate/crewProcedure/$id',
      );

      if (response.statusCode == 200) {

        return response.data;

      } else {
        ToastUtils.showErrorToast(response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast('Error Downloading Procedure: $error');
    }
    return null;
  }
}