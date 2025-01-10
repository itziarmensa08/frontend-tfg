import 'package:frontend_tfg/data/models/airport_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {

  late Rx<SharedPreferences> prefs;

  RxBool isAdmin = RxBool(false);

  RxList<AirportModel> airports = RxList<AirportModel>();
  RxList<AirportModel> filteredairports = RxList<AirportModel>();

}