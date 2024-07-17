
import 'package:frontend_tfg/data/models/gradientgraphic.model.dart';
import 'package:frontend_tfg/data/provider/api.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';

class GradientGraphicService {
  static Future<GradientGraphic?> getGradientByAircraft(String id, int segment) async {
    ApiResponse response;

    try {
      response = await MyApi().get('/gradientGraphics/aircraft/$id/$segment');

      if (response.statusCode == 200) {

        GradientGraphic table = GradientGraphic.fromJson(response.data);

        return table;

      } else {
        ToastUtils.showErrorToast(response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast('Error GetGradientGraphic: $error');
    }
    return null;
  }

  static Future<Map<String, dynamic>?> calculateDistance(String id, double gradient, double altitud) async {
    ApiResponse response;

    try {
      response = await MyApi().post(
        '/gradientGraphics/calculate/gradient/$id',
        data: {
          "gradient": gradient,
          "altitud": altitud,
        }
      );

      if (response.statusCode == 200) {

        return response.data;

      } else {
        ToastUtils.showErrorToast(response.data);
      }

    } catch (error) {
      ToastUtils.showErrorToast('Error CalculateDistance: $error');
    }
    return null;
  }
}