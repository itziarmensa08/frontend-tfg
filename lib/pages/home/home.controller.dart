import 'package:frontend_tfg/data/models/airport_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  RxBool isAdmin = RxBool(false);

  RxList<AirportModel> airports = RxList<AirportModel>();
  RxList<AirportModel> filteredairports = RxList<AirportModel>();

}