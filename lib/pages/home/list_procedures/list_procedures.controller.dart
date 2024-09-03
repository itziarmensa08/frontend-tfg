import 'package:frontend_tfg/data/models/aircraft_model.dart';
import 'package:frontend_tfg/data/models/airport_model.dart';
import 'package:frontend_tfg/data/models/procedure.model.dart';
import 'package:get/get.dart';

class ListProceduresHomeController extends GetxController {

  Rx<AirportModel> airport = AirportModel().obs;
  Rx<AircraftModel> aircraft = AircraftModel().obs;
  RxList<Procedure> procedures = RxList<Procedure>();

}