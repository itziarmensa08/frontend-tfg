
import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/aircraft_model.dart';
import 'package:frontend_tfg/data/models/airport_model.dart';
import 'package:frontend_tfg/data/models/isatable.model.dart';
import 'package:frontend_tfg/data/models/procedure.model.dart';
import 'package:frontend_tfg/data/models/rateofclimbgraphic.model.dart';
import 'package:frontend_tfg/data/models/v2table.model.dart';
import 'package:frontend_tfg/data/models/vytable.model.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class NewAnalaysisController extends GetxController {

  final Rx<Procedure> newProcedure = Procedure().obs;

  final RxInt indexStepper = RxInt(0);

  // ------------------------- GENERAL DATA ----------------------------------

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

  final Rx<NMotors> nMotors = NMotors().obs;

  // ------------------------- FIRST SEGMENT N MOTORS ----------------------------------

  final RxList<Item> itemsNMotors = <Item>[].obs;
  final RxBool loadingAnalysisN = RxBool(false);

  final Rx<Segment> firstSegmentN = Segment().obs;
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
  final TextEditingController totalAltitudeInDPFirstSegmentN = TextEditingController();

  // ------------------------- SECOND SEGMENT N MOTORS ----------------------------------

  final Rx<Segment> secondSegmentN = Segment().obs;
  final TextEditingController elevationSecondSegmentN = TextEditingController();
  final Rx<VYTableModel> vYtableN = VYTableModel().obs;
  final RxList<VYtableRowsPressures> obtainedDataVYN = RxList<VYtableRowsPressures>();
  final TextEditingController velocitySecondSegmentN = TextEditingController();
  final RxList<ISATableData> obtainedISADataSecondSegmentN = RxList<ISATableData>();
  final TextEditingController densitySecondSegmentN = TextEditingController();
  final TextEditingController velocitySecondSegmentTASN = TextEditingController();
  final Rx<RateOfClimbGraphic> rateGraphicSecondSegmentN = RateOfClimbGraphic().obs;
  final RxMap<String, dynamic> resultRateSecondSegmentN = <String, dynamic>{}.obs;
  final TextEditingController timeSecondSegmentN = TextEditingController();
  final TextEditingController distancSecondSegmentN = TextEditingController();
  final TextEditingController timeToDPSecondSegmentN = TextEditingController();
  final TextEditingController altitudeInDPSecondSegmentN = TextEditingController();
  final TextEditingController totalAltitudeInDPSecondSegmentN = TextEditingController();
  final TextEditingController rateOfClimbSecondSegmentN = TextEditingController();

  // ------------------------- THIRD SEGMENT N MOTORS ----------------------------------

  final Rx<Segment> thirdSegmentN = Segment().obs;
  final TextEditingController elevationThirdSegmentN = TextEditingController();
  final RxList<VYtableRowsPressures> obtainedDataVYThirdSegmentN = RxList<VYtableRowsPressures>();
  final TextEditingController velocityThirdSegmentN = TextEditingController();
  final RxList<ISATableData> obtainedISADataThirdSegmentN = RxList<ISATableData>();
  final TextEditingController densityThirdSegmentN = TextEditingController();
  final TextEditingController velocityThirdSegmentTASN = TextEditingController();
  final Rx<RateOfClimbGraphic> rateGraphicThirdSegmentN = RateOfClimbGraphic().obs;
  final RxMap<String, dynamic> resultRateThirdSegmentN = <String, dynamic>{}.obs;
  final TextEditingController timeThirdSegmentN = TextEditingController();
  final TextEditingController distancThirdSegmentN = TextEditingController();
  final TextEditingController timeToDPThirdSegmentN = TextEditingController();
  final TextEditingController altitudeInDPThirdSegmentN = TextEditingController();
  final TextEditingController rateOfClimbThirdSegmentN = TextEditingController();
  final TextEditingController totalAltitudeInDPThirdSegmentN = TextEditingController();


  // ----------------------- N -1 MOTORS ----------------------------------------

  final Rx<Failure> failure = Failure().obs;
  final Rx<GradientModel> gradient = GradientModel().obs;
  final Rx<Altitude> altitude = Altitude().obs;
  final RxBool gradientRestriction = RxBool(false);
  final RxBool altitudeRestriction = RxBool(false);

  final TextEditingController initialElevation = TextEditingController();
  final RxBool seeAnalysis = RxBool(false);
  final RxBool loadingAnalysis = RxBool(false);

  final TextEditingController dpDistanceGradient = TextEditingController();
  final TextEditingController gradientRestrictionValue = TextEditingController();

  final TextEditingController dpDistanceAltitude = TextEditingController();
  final TextEditingController dpAltitudeRestriction = TextEditingController();

  // ----------------------- ALTITUDE RESTRICTION ----------------------------------------

  // ----------------------- N - 1 MOTORS - 1st SEGMENT ----------------------------------------
  final Rx<Segment> firstSegmentN1 = Segment().obs;
  final RxList<V2TableRowData> obtainedDataN1 = RxList<V2TableRowData>();
  final TextEditingController velocityFirstSegmentN1 = TextEditingController();
  final RxList<ISATableData> obtainedISADataFirstSegmentN1 = RxList<ISATableData>();
  final TextEditingController densityFirstSegmentN1 = TextEditingController();
  final TextEditingController velocityFirstSegmentTASN1 = TextEditingController();
  final Rx<RateOfClimbGraphic> rateGraphicFirstSegmentN1 = RateOfClimbGraphic().obs;
  final RxMap<String, dynamic> resultRateFirstSegmentN1 = <String, dynamic>{}.obs;
  final TextEditingController timeFirstSegmentN1 = TextEditingController();
  final TextEditingController distanceFirstSegmentN1 = TextEditingController();
  final TextEditingController timeToDPFirstSegmentN1 = TextEditingController();
  final TextEditingController altitudeInDPFirstSegmentN1 = TextEditingController();
  final TextEditingController rateOfClimbFirstSegmentN1 = TextEditingController();

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

class Item {
  String headerValue;
  Widget body;
  bool isExpanded;

  Item({
    required this.headerValue,
    required this.body,
    this.isExpanded = false,
  });
}
