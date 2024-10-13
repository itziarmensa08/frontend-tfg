import 'package:frontend_tfg/data/models/aircraft_model.dart';
import 'package:frontend_tfg/data/models/crew_procedure.dart';
import 'package:frontend_tfg/data/models/procedure.model.dart';
import 'package:get/get.dart';

import '../../../data/models/airport_model.dart';

class WriteProcedureController extends GetxController {

  RxList<Procedure> procedures = RxList<Procedure>();
  Rx<AircraftModel> aircraft = AircraftModel().obs;
  Rx<AirportModel> airport = AirportModel().obs;
  Rx<CrewProcedure> crewProcedure = CrewProcedure().obs;

}