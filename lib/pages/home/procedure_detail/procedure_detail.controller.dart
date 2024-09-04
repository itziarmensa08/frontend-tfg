import 'package:frontend_tfg/data/models/aircraft_model.dart';
import 'package:frontend_tfg/data/models/airport_model.dart';
import 'package:frontend_tfg/data/models/procedure.model.dart';
import 'package:frontend_tfg/data/models/v2table.model.dart';
import 'package:get/get.dart';

class ProcedureDetailController extends GetxController {

  Rx<AirportModel> airport = AirportModel().obs;
  Rx<AircraftModel> aircraft = AircraftModel().obs;
  Rx<Procedure> procedure = Procedure().obs;

  final Rx<V2TableModel> data = V2TableModel().obs;

}