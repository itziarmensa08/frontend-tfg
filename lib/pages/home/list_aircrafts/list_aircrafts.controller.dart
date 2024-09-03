import 'package:frontend_tfg/data/models/aircraft_model.dart';
import 'package:frontend_tfg/data/models/airport_model.dart';
import 'package:get/get.dart';

class ListAircraftsHomeController extends GetxController {

  RxList<AircraftModel> aircrafts = RxList<AircraftModel>();
  Rx<AirportModel> airport = AirportModel().obs;

}