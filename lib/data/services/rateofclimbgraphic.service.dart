
import 'package:frontend_tfg/data/models/rateofclimbgraphic.model.dart';
import 'package:frontend_tfg/data/provider/api.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';

class RateOfClimbGraphicService {
  static Future<RateOfClimbGraphic?> getRateByAircraft(String id, int segment, String state) async {
    ApiResponse response;

    try {
      response = await MyApi().get('/rateOfClimb/aircraft/$id/$segment/$state');

      if (response.statusCode == 200) {

        RateOfClimbGraphic table = RateOfClimbGraphic.fromJson(response.data);

        return table;

      } else {
        ToastUtils.showErrorToast(response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast('Error GetRateOfClimbGraphic: $error');
    }
    return null;
  }

  static Future<Map<String, dynamic>?> calculateRateOfClimb(String id, double temperature, double altitud, double weight) async {
    ApiResponse response;

    try {
      response = await MyApi().post(
        '/rateOfClimb/calculate/rate/$id',
        data: {
          "temperature": temperature,
          "altitud": altitud,
          "weight": weight
        }
      );

      if (response.statusCode == 200) {

        return response.data;

      } else {
        ToastUtils.showErrorToast(response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast('Error GetRateOfClimbGraphic: $error');
    }
    return null;
  }
}