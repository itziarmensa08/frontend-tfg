
import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/aircraft_model.dart';
import 'package:frontend_tfg/data/models/airport_model.dart';
import 'package:frontend_tfg/data/models/isatable.model.dart';
import 'package:frontend_tfg/data/models/procedure.model.dart';
import 'package:frontend_tfg/data/models/rateofclimbgraphic.model.dart';
import 'package:frontend_tfg/data/models/v2table.model.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class NewAnalaysisController extends GetxController {

  final Rx<Procedure> newProcedure = Procedure().obs;

  final RxInt indexStepper = RxInt(0);

  final RxList<AircraftModel> aircrafts = RxList<AircraftModel>();
  final Rx<AircraftModel?> selectedAircraft = Rx<AircraftModel?>(null);
  final TextEditingController nameAircraft = TextEditingController();
  final TextEditingController metro = TextEditingController();
  final RxBool aircraftCorrect = RxBool(false);

  final RxList<AirportModel> airports = RxList<AirportModel>();
  final Rx<AirportModel?> selectedAirport = Rx<AirportModel?>(null);
  final TextEditingController name = TextEditingController();
  final TextEditingController elevation = TextEditingController();
  final TextEditingController oaciCode = TextEditingController();
  final TextEditingController iataCode = TextEditingController();
  final TextEditingController referenceTemperature = TextEditingController();
  final RxBool airportCorrect = RxBool(false);

  final Rx<String?> sidDoc = Rx<String?>(null);
  final Rx<String?> rwyDoc = Rx<String?>(null);

  final TextEditingController rwyName = TextEditingController();
  final TextEditingController sidName = TextEditingController();
  final TextEditingController dpName = TextEditingController();
  final TextEditingController dpDistance = TextEditingController();
  final TextEditingController dpAltitude = TextEditingController();
  final TextEditingController weight = TextEditingController();

  final Rx<V2TableModel> data = V2TableModel().obs;
  final RxList<V2TableRowData> obtainedData = RxList<V2TableRowData>();
  final TextEditingController velocityFirstSegment = TextEditingController();

  final Rx<ISATableModel> isatable = ISATableModel().obs;
  final RxList<ISATableData> obtainedISAData = RxList<ISATableData>();
  final TextEditingController densityFirstSegment = TextEditingController();
  final TextEditingController velocityFirstSegmentTAS = TextEditingController();

  final Rx<RateOfClimbGraphic> rateGraphic = RateOfClimbGraphic().obs;
  final RxMap<String, dynamic> resultRate = <String, dynamic>{}.obs;
  final TextEditingController timeFirstSegment = TextEditingController();
  final TextEditingController distanceFirstSegment = TextEditingController();
  final TextEditingController timeToDPFirstSegment = TextEditingController();
  final TextEditingController altitudeInDPFirstSegment = TextEditingController();

  final TextEditingController rateOfClimbFirstSegment = TextEditingController();

}

asignAirportData (NewAnalaysisController controller) {
  if (controller.selectedAirport.value != null) {
    controller.name.text = controller.selectedAirport.value!.name!;
    controller.elevation.text = controller.selectedAirport.value!.elevation!.toString();
    controller.oaciCode.text = controller.selectedAirport.value!.oaciCode!;
    controller.iataCode.text = controller.selectedAirport.value!.iataCode!;
    controller.referenceTemperature.text = controller.selectedAirport.value!.referenceTemperature!.toString();
  }
}

asignAircraftData (NewAnalaysisController controller) {
  if (controller.selectedAircraft.value != null) {
    controller.nameAircraft.text = controller.selectedAircraft.value!.name!;
    controller.metro.text = controller.selectedAircraft.value!.metro!;
  }
}

Future<void> launchForeFlight() async {
  await launchUrl(Uri.parse('https://plan.foreflight.com/'));
}

Future<void> launchAPG() async {
  launchUrl(Uri.parse('https://atlas.apgdata.com/winplan5/Login.aspx'));
}
