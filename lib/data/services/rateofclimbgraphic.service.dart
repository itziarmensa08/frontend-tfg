
import 'package:frontend_tfg/data/models/rateofclimbgraphic.model.dart';
import 'package:frontend_tfg/data/provider/api.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';

class RateOfClimbGraphicService {
  static Future<RateOfClimbGraphic?> getRateByAircraft(String id) async {
    ApiResponse response;

    try {
      response = await MyApi().get('/rateOfClimb/aircraft/$id');

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
}