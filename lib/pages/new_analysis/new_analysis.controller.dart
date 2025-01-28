
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/aircraft_model.dart';
import 'package:frontend_tfg/data/models/airport_model.dart';
import 'package:frontend_tfg/data/models/gradientgraphic.model.dart';
import 'package:frontend_tfg/data/models/isatable.model.dart';
import 'package:frontend_tfg/data/models/procedure.model.dart';
import 'package:frontend_tfg/data/models/rateofclimbgraphic.model.dart';
import 'package:frontend_tfg/data/models/v2table.model.dart';
import 'package:frontend_tfg/data/models/vytable.model.dart';
import 'package:frontend_tfg/data/services/gradientgraphic.service.dart';
import 'package:frontend_tfg/data/services/isatable.service.dart';
import 'package:frontend_tfg/data/services/rateofclimbgraphic.service.dart';
import 'package:frontend_tfg/data/services/v2table.service.dart';
import 'package:frontend_tfg/data/services/vYtable.service.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class NewAnalaysisController extends GetxController {

  RxString username = RxString('');
  RxString profileImage = RxString('');

  final Rx<Procedure> newProcedure = Procedure().obs;

  final RxInt indexStepper = RxInt(0);

  // ------------------------- GENERAL DATA ----------------------------------

  final RxList<AircraftModel> aircrafts = RxList<AircraftModel>();
  final Rx<AircraftModel?> selectedAircraft = Rx<AircraftModel?>(null);
  final TextEditingController nameAircraft = TextEditingController();
  final TextEditingController metro = TextEditingController();
  final TextEditingController altitude1stSegmentN = TextEditingController();
  final TextEditingController altitude2ndSegmentN = TextEditingController();
  final TextEditingController altitude1stSegmentFailure = TextEditingController();
  final TextEditingController altitude2ndSegmentFailure = TextEditingController();
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

  final RxnBool ignoreFailure = RxnBool(null);

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
  final TextEditingController gradientAltitude = TextEditingController();
  final RxBool distanceChanged = RxBool(false);
  final RxBool altitudeChanged = RxBool(false);
  final RxBool gradientChanged = RxBool(false);

  final TextEditingController dpDistanceAltitude = TextEditingController();
  final TextEditingController dpAltitudeRestriction = TextEditingController();

  // ----------------------- ALTITUDE RESTRICTION ----------------------------------------

  // ----------------------- N - 1 MOTORS - 1st SEGMENT ----------------------------------------
  final Rx<Segment> firstSegmentN1 = Segment().obs;
  final TextEditingController elevationFirstSegmentN1 = TextEditingController();
  final RxList<V2TableRowData> obtainedDataN1 = RxList<V2TableRowData>();
  final TextEditingController velocityFirstSegmentN1 = TextEditingController();
  final RxList<ISATableData> obtainedISADataFirstSegmentN1 = RxList<ISATableData>();
  final TextEditingController densityFirstSegmentN1 = TextEditingController();
  final TextEditingController velocityFirstSegmentTASN1 = TextEditingController();
  final Rx<RateOfClimbGraphic> rateGraphicFirstSegmentN1 = RateOfClimbGraphic().obs;
  final Rx<GradientGraphic> gradientGraphicFirstSegmentN1 = GradientGraphic().obs;
  final RxMap<String, dynamic> resultRateFirstSegmentN1 = <String, dynamic>{}.obs;
  final RxMap<String, dynamic> resultGradientFirstSegmentN1 = <String, dynamic>{}.obs;
  final TextEditingController timeFirstSegmentN1 = TextEditingController();
  final TextEditingController distanceFirstSegmentN1 = TextEditingController();
  final TextEditingController timeToDPFirstSegmentN1 = TextEditingController();
  final TextEditingController altitudeInDPFirstSegmentN1 = TextEditingController();
  final TextEditingController gradientFirstSegmentN1 = TextEditingController();
  final TextEditingController totalAltitudeInDPFirstSegmentN1 = TextEditingController();

  // ----------------------- N - 1 MOTORS - 2nd SEGMENT ----------------------------------------
  final Rx<Segment> secondSegmentN1 = Segment().obs;
  final TextEditingController elevationSecondSegmentN1 = TextEditingController();
  final Rx<VYTableModel> vYtableN1 = VYTableModel().obs;
  final RxList<VYtableRowsPressures> obtainedDataVYN1 = RxList<VYtableRowsPressures>();
  final TextEditingController velocitySecondSegmentN1 = TextEditingController();
  final RxList<ISATableData> obtainedISADataSecondSegmentN1 = RxList<ISATableData>();
  final TextEditingController densitySecondSegmentN1 = TextEditingController();
  final TextEditingController velocitySecondSegmentTASN1 = TextEditingController();
  final Rx<RateOfClimbGraphic> rateGraphicSecondSegmentN1 = RateOfClimbGraphic().obs;
  final Rx<GradientGraphic> gradientGraphicSecondSegmentN1 = GradientGraphic().obs;
  final RxMap<String, dynamic> resultRateSecondSegmentN1 = <String, dynamic>{}.obs;
  final RxMap<String, dynamic> resultGradientSecondSegmentN1 = <String, dynamic>{}.obs;
  final TextEditingController timeSecondSegmentN1 = TextEditingController();
  final TextEditingController distanceSecondSegmentN1 = TextEditingController();
  final TextEditingController timeToDPSecondSegmentN1 = TextEditingController();
  final TextEditingController altitudeInDPSecondSegmentN1 = TextEditingController();
  final TextEditingController gradientSecondSegmentN1 = TextEditingController();
  final TextEditingController totalAltitudeInDPSecondSegmentN1 = TextEditingController();

  // ----------------------- N - 1 MOTORS - 3rd SEGMENT ----------------------------------------
  final Rx<Segment> thirdSegmentN1 = Segment().obs;
  final TextEditingController elevationThirdSegmentN1 = TextEditingController();
  final RxList<VYtableRowsPressures> obtainedDataThirdVYN1 = RxList<VYtableRowsPressures>();
  final TextEditingController velocityThirdSegmentN1 = TextEditingController();
  final RxList<ISATableData> obtainedISADataThirdSegmentN1 = RxList<ISATableData>();
  final TextEditingController densityThirdSegmentN1 = TextEditingController();
  final TextEditingController velocityThirdSegmentTASN1 = TextEditingController();
  final Rx<RateOfClimbGraphic> rateGraphicThirdSegmentN1 = RateOfClimbGraphic().obs;
  final Rx<GradientGraphic> gradientGraphicThirdSegmentN1 = GradientGraphic().obs;
  final RxMap<String, dynamic> resultRateThirdSegmentN1 = <String, dynamic>{}.obs;
  final RxMap<String, dynamic> resultGradientThirdSegmentN1 = <String, dynamic>{}.obs;
  final TextEditingController timeThirdSegmentN1 = TextEditingController();
  final TextEditingController distanceThirdSegmentN1 = TextEditingController();
  final TextEditingController timeToDPThirdSegmentN1 = TextEditingController();
  final TextEditingController altitudeInDPThirdSegmentN1 = TextEditingController();
  final TextEditingController rateOfClimbThirdSegmentN1 = TextEditingController();
  final TextEditingController totalAltitudeInDPThirdSegmentN1 = TextEditingController();
  final TextEditingController finalGradientN1 = TextEditingController();

  final TextEditingController precedureN = TextEditingController();
  final TextEditingController precedureN1 = TextEditingController();

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
    controller.altitude1stSegmentN.text = controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment!.toString();
    controller.altitude2ndSegmentN.text = controller.selectedAircraft.value!.profile!.nMotors!.heightSecondSegment!.toString();
    controller.altitude1stSegmentFailure.text = controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!.toString();
    controller.altitude2ndSegmentFailure.text = controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment!.toString();
  }
}

void clearGeneralValues(NewAnalaysisController controller) {
  // Resetear el procedimiento
  controller.newProcedure.value = Procedure();

  // Resetear índice del stepper
  controller.indexStepper.value = 0;

  // Limpiar datos de las aeronaves
  controller.aircrafts.clear();
  controller.selectedAircraft.value = null;
  controller.nameAircraft.clear();
  controller.metro.clear();
  controller.altitude1stSegmentN.clear();
  controller.altitude2ndSegmentN.clear();
  controller.altitude1stSegmentFailure.clear();
  controller.altitude2ndSegmentFailure.clear();
  controller.aircraftCorrect.value = false;

  // Limpiar datos de los aeropuertos
  controller.airports.clear();
  controller.selectedAirport.value = null;
  controller.name.clear();
  controller.elevation.clear();
  controller.oaciCode.clear();
  controller.iataCode.clear();
  controller.referenceTemperature.clear();
  controller.airportCorrect.value = false;

  // Limpiar documentos SID y RWY
  controller.sidDoc.value = null;
  controller.rwyDoc.value = null;

  // Limpiar otros valores
  controller.rwyName.clear();
  controller.sidName.clear();
  controller.dpName.clear();
  controller.dpDistance.clear();
  controller.dpAltitude.clear();
  controller.weight.clear();
}

void deleteDataSecondStep(NewAnalaysisController controller) {
  // Clear or reset the values for all the properties

  // Clearing `nMotors`
  controller.nMotors.value = NMotors();

  // First Segment N Motors
  controller.itemsNMotors.clear();
  controller.loadingAnalysisN.value = false;

  controller.firstSegmentN.value = Segment();
  controller.data.value = V2TableModel();
  controller.obtainedData.clear();
  controller.velocityFirstSegment.clear();

  controller.isatable.value = ISATableModel();
  controller.obtainedISAData.clear();
  controller.densityFirstSegment.clear();
  controller.velocityFirstSegmentTAS.clear();

  controller.rateGraphic.value = RateOfClimbGraphic();
  controller.resultRate.clear();
  controller.timeFirstSegment.clear();
  controller.distanceFirstSegment.clear();
  controller.timeToDPFirstSegment.clear();
  controller.altitudeInDPFirstSegment.clear();
  controller.rateOfClimbFirstSegment.clear();
  controller.totalAltitudeInDPFirstSegmentN.clear();

  // Second Segment N Motors
  controller.secondSegmentN.value = Segment();
  controller.elevationSecondSegmentN.clear();
  controller.vYtableN.value = VYTableModel();
  controller.obtainedDataVYN.clear();
  controller.velocitySecondSegmentN.clear();
  controller.obtainedISADataSecondSegmentN.clear();
  controller.densitySecondSegmentN.clear();
  controller.velocitySecondSegmentTASN.clear();
  controller.rateGraphicSecondSegmentN.value = RateOfClimbGraphic();
  controller.resultRateSecondSegmentN.clear();
  controller.timeSecondSegmentN.clear();
  controller.distancSecondSegmentN.clear();
  controller.timeToDPSecondSegmentN.clear();
  controller.altitudeInDPSecondSegmentN.clear();
  controller.totalAltitudeInDPSecondSegmentN.clear();
  controller.rateOfClimbSecondSegmentN.clear();

  // Third Segment N Motors
  controller.thirdSegmentN.value = Segment();
  controller.elevationThirdSegmentN.clear();
  controller.obtainedDataVYThirdSegmentN.clear();
  controller.velocityThirdSegmentN.clear();
  controller.obtainedISADataThirdSegmentN.clear();
  controller.densityThirdSegmentN.clear();
  controller.velocityThirdSegmentTASN.clear();
  controller.rateGraphicThirdSegmentN.value = RateOfClimbGraphic();
  controller.resultRateThirdSegmentN.clear();
  controller.timeThirdSegmentN.clear();
  controller.distancThirdSegmentN.clear();
  controller.timeToDPThirdSegmentN.clear();
  controller.altitudeInDPThirdSegmentN.clear();
  controller.rateOfClimbThirdSegmentN.clear();
  controller.totalAltitudeInDPThirdSegmentN.clear();
  controller.initialElevation.clear();
}

void deleteDataThirdStep(NewAnalaysisController controller) {
  // Clear or reset the values for all the properties

  // ----------------------- N -1 MOTORS ----------------------------------------
  controller.failure.value = Failure();
  controller.newProcedure.value.failure = controller.failure.value;
  controller.newProcedure.value.procedureN = null;
  controller.newProcedure.value.procedureN1 = null;
  controller.gradient.value = GradientModel();
  controller.altitude.value = Altitude();
  controller.gradientRestriction.value = false;
  controller.altitudeRestriction.value = false;

  controller.seeAnalysis.value = false;
  controller.loadingAnalysis.value = false;

  controller.dpDistanceGradient.clear();
  controller.gradientRestrictionValue.clear();
  controller.gradientAltitude.clear();
  controller.distanceChanged.value = false;
  controller.altitudeChanged.value = false;
  controller.gradientChanged.value = false;

  controller.dpDistanceAltitude.clear();
  controller.dpAltitudeRestriction.clear();

  // ----------------------- ALTITUDE RESTRICTION ----------------------------------------

  // ----------------------- N - 1 MOTORS - 1st SEGMENT ----------------------------------------
  controller.firstSegmentN1.value = Segment();
  controller.elevationFirstSegmentN1.clear();
  controller.obtainedDataN1.clear();
  controller.velocityFirstSegmentN1.clear();
  controller.obtainedISADataFirstSegmentN1.clear();
  controller.densityFirstSegmentN1.clear();
  controller.velocityFirstSegmentTASN1.clear();
  controller.rateGraphicFirstSegmentN1.value = RateOfClimbGraphic();
  controller.gradientGraphicFirstSegmentN1.value = GradientGraphic();
  controller.resultRateFirstSegmentN1.clear();
  controller.resultGradientFirstSegmentN1.clear();
  controller.timeFirstSegmentN1.clear();
  controller.distanceFirstSegmentN1.clear();
  controller.timeToDPFirstSegmentN1.clear();
  controller.altitudeInDPFirstSegmentN1.clear();
  controller.gradientFirstSegmentN1.clear();
  controller.totalAltitudeInDPFirstSegmentN1.clear();

  // ----------------------- N - 1 MOTORS - 2nd SEGMENT ----------------------------------------
  controller.secondSegmentN1.value = Segment();
  controller.elevationSecondSegmentN1.clear();
  controller.vYtableN1.value = VYTableModel();
  controller.obtainedDataVYN1.clear();
  controller.velocitySecondSegmentN1.clear();
  controller.obtainedISADataSecondSegmentN1.clear();
  controller.densitySecondSegmentN1.clear();
  controller.velocitySecondSegmentTASN1.clear();
  controller.rateGraphicSecondSegmentN1.value = RateOfClimbGraphic();
  controller.gradientGraphicSecondSegmentN1.value = GradientGraphic();
  controller.resultRateSecondSegmentN1.clear();
  controller.resultGradientSecondSegmentN1.clear();
  controller.timeSecondSegmentN1.clear();
  controller.distanceSecondSegmentN1.clear();
  controller.timeToDPSecondSegmentN1.clear();
  controller.altitudeInDPSecondSegmentN1.clear();
  controller.gradientSecondSegmentN1.clear();
  controller.totalAltitudeInDPSecondSegmentN1.clear();

  // ----------------------- N - 1 MOTORS - 3rd SEGMENT ----------------------------------------
  controller.thirdSegmentN1.value = Segment();
  controller.elevationThirdSegmentN1.clear();
  controller.obtainedDataThirdVYN1.clear();
  controller.velocityThirdSegmentN1.clear();
  controller.obtainedISADataThirdSegmentN1.clear();
  controller.densityThirdSegmentN1.clear();
  controller.velocityThirdSegmentTASN1.clear();
  controller.rateGraphicThirdSegmentN1.value = RateOfClimbGraphic();
  controller.gradientGraphicThirdSegmentN1.value = GradientGraphic();
  controller.resultRateThirdSegmentN1.clear();
  controller.resultGradientThirdSegmentN1.clear();
  controller.timeThirdSegmentN1.clear();
  controller.distanceThirdSegmentN1.clear();
  controller.timeToDPThirdSegmentN1.clear();
  controller.altitudeInDPThirdSegmentN1.clear();
  controller.rateOfClimbThirdSegmentN1.clear();
  controller.totalAltitudeInDPThirdSegmentN1.clear();
  controller.finalGradientN1.clear();
}

void deleteDataFourthStep(NewAnalaysisController controller) {
  // Clear the TextEditingControllers for procedures
  controller.precedureN.clear();
  controller.precedureN1.clear();
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

Future<Map<String, bool>> calculateDataNMotors(NewAnalaysisController controller) async {
  controller.loadingAnalysisN.value = true;

  // ---------------------- N MOTORES - 1 SEGMENTO -------------------------------------------
  controller.newProcedure.value.weight = double.parse(controller.weight.text);
  if (controller.dpDistance.text.isNotEmpty) {
    controller.newProcedure.value.dpDistance = double.parse(controller.dpDistance.text);
  }
  controller.newProcedure.value.rwyName = controller.rwyName.text;
  controller.newProcedure.value.dpName = controller.dpName.text;
  controller.newProcedure.value.sidName = controller.sidName.text;
  controller.firstSegmentN.value.temperature = controller.selectedAirport.value!.referenceTemperature!;
  var response = await V2TableService.getV2tableByAircraft(controller.selectedAircraft.value!.id!);
  if (response != null) {
    controller.data.value = response;
  }
  var obtainedData = await V2TableService.getObtainedData(controller.selectedAircraft.value!.id!, controller.selectedAirport.value!.elevation!, double.parse(controller.weight.text), controller.firstSegmentN.value.temperature!, "V50");
  if (obtainedData != null) {
    controller.obtainedData.value = obtainedData.dataList;
    controller.velocityFirstSegment.text = obtainedData.velocityValue.toStringAsFixed(2);
    controller.firstSegmentN.value.velocityIAS = obtainedData.velocityValue;
  }
  var isatableresponse = await ISATableService.getISATables();
  if (isatableresponse != null) {
    controller.isatable.value = isatableresponse;
  }
  var obtainedDataISA = await ISATableService.getObtainedData(controller.selectedAirport.value!.elevation!);
  if (obtainedDataISA != null) {
    controller.obtainedISAData.value = obtainedDataISA.dataList;
    controller.densityFirstSegment.text = obtainedDataISA.densityValue.toStringAsFixed(2);
    controller.firstSegmentN.value.density = obtainedDataISA.densityValue;
  }
  if (obtainedData != null && obtainedDataISA != null) {
    double velocityTAS = obtainedData.velocityValue / sqrt(obtainedDataISA.densityValue);
    controller.firstSegmentN.value.velocityTAS = velocityTAS;
    controller.velocityFirstSegmentTAS.text = velocityTAS.toStringAsFixed(2);
  }
  var rateresponse = await RateOfClimbGraphicService.getRateByAircraft(controller.selectedAircraft.value!.id!, 1, 'nMotors');
  if (rateresponse != null) {
    controller.rateGraphic.value = rateresponse;
  }
  var resultrateresponse = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphic.value.id!, controller.firstSegmentN.value.temperature!, controller.selectedAirport.value!.elevation!, double.parse(controller.weight.text));
  if (resultrateresponse != null) {
    controller.resultRate.value = resultrateresponse;
    controller.firstSegmentN.value.rateClimb = resultrateresponse['finalPoint']['x']; // feet / minute
    controller.rateOfClimbFirstSegment.text = resultrateresponse['finalPoint']['x'].toStringAsFixed(2);
    controller.firstSegmentN.value.timeToFinish = (controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment! - 50) / resultrateresponse['finalPoint']['x']; // minutes
    controller.timeFirstSegment.text = ((controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment! - 50) / resultrateresponse['finalPoint']['x']).toStringAsFixed(2);
    if (controller.firstSegmentN.value.velocityTAS != null) {
      controller.firstSegmentN.value.distanceToFinish = controller.firstSegmentN.value.velocityTAS! * (((controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment! - 50) / resultrateresponse['finalPoint']['x'])/60);
      controller.distanceFirstSegment.text = (controller.firstSegmentN.value.velocityTAS! * (((controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment! - 50) / resultrateresponse['finalPoint']['x'])/60)).toStringAsFixed(2);
    }
  }
  var reachDP1 = false;
  var reachDP2 = false;
  var reachDP3 = false;
  if (controller.firstSegmentN.value.distanceToFinish != null && controller.newProcedure.value.dpDistance != null) {
    if (controller.firstSegmentN.value.distanceToFinish! < controller.newProcedure.value.dpDistance!) {
      controller.firstSegmentN.value.reachDP = false;
    } else {
      controller.firstSegmentN.value.reachDP = true;
      reachDP1 = true;
      controller.firstSegmentN.value.timeToDP = controller.newProcedure.value.dpDistance! / (controller.firstSegmentN.value.velocityTAS! / 60);
      controller.timeToDPFirstSegment.text = (controller.newProcedure.value.dpDistance! / (controller.firstSegmentN.value.velocityTAS! / 60)).toStringAsFixed(2);

      controller.firstSegmentN.value.altitudeInDP = controller.firstSegmentN.value.timeToDP! * controller.firstSegmentN.value.rateClimb!;
      controller.altitudeInDPFirstSegment.text = (controller.firstSegmentN.value.timeToDP! * controller.firstSegmentN.value.rateClimb!).toStringAsFixed(2);
      controller.totalAltitudeInDPFirstSegmentN.text = (controller.firstSegmentN.value.timeToDP! * controller.firstSegmentN.value.rateClimb! + controller.selectedAirport.value!.elevation!).toStringAsFixed(2);
      controller.initialElevation.text = controller.totalAltitudeInDPFirstSegmentN.text;
      controller.failure.value.initialElevation = controller.firstSegmentN.value.timeToDP! * controller.firstSegmentN.value.rateClimb! + controller.selectedAirport.value!.elevation!;

      if ((controller.firstSegmentN.value.altitudeInDP! + controller.selectedAirport.value!.elevation!) > controller.newProcedure.value.dpAltitude!) {
        controller.firstSegmentN.value.clearDP = true;
      } else {
        controller.firstSegmentN.value.clearDP = false;
      }
    }
  } else if (controller.firstSegmentN.value.distanceToFinish != null && controller.newProcedure.value.dpDistance == null) {
    controller.firstSegmentN.value.clearDP = false;
    if (controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment! < controller.newProcedure.value.dpAltitude!) {
      controller.firstSegmentN.value.reachDP = false;
    } else {
      controller.firstSegmentN.value.reachDP = true;
      reachDP1 = true;
      controller.firstSegmentN.value.timeToDP = controller.newProcedure.value.dpAltitude! / controller.firstSegmentN.value.rateClimb!;
      controller.timeToDPFirstSegment.text = controller.firstSegmentN.value.timeToDP!.toStringAsFixed(2);
      controller.newProcedure.value.dpDistance = controller.firstSegmentN.value.timeToDP! * (controller.firstSegmentN.value.velocityTAS! / 60);
      controller.initialElevation.text = controller.newProcedure.value.dpAltitude!.toStringAsFixed(2);
      controller.failure.value.initialElevation = controller.newProcedure.value.dpAltitude!;
    }
  }
  controller.nMotors.value.firstSegment = controller.firstSegmentN.value;

  // ---------------------- N MOTORES - 2 SEGMENTO -------------------------------------------

  controller.elevationSecondSegmentN.text = (controller.selectedAirport.value!.elevation! + controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment!).toString();
  double initialElevation = controller.selectedAirport.value!.elevation!;
  double secondSegmentElevation = initialElevation + controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment!;

  double initialTemperature = controller.selectedAirport.value!.referenceTemperature!;

  double altitudeDifference = secondSegmentElevation - initialElevation;

  double temperatureChange = (altitudeDifference / 1000) * 2; // Cada 1000 pies baja 2ºC

  double equivalentTemperatureSecondSegment = initialTemperature - temperatureChange;

  controller.secondSegmentN.value.temperature = equivalentTemperatureSecondSegment;

  if (controller.firstSegmentN.value.reachDP == false) {
    var responseVY = await VYTableService.getVYtableByAircraft(controller.selectedAircraft.value!.id!, "nMotors");
    if (responseVY != null) {
      controller.vYtableN.value = responseVY;
    }
    var obtainedDataVY = await VYTableService.getObtainedData(controller.selectedAircraft.value!.id!, (controller.selectedAirport.value!.elevation! + controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment!), double.parse(controller.weight.text), "nMotors");
    if (obtainedDataVY != null) {
      controller.obtainedDataVYN.value = obtainedDataVY.dataList;
      controller.velocitySecondSegmentN.text = obtainedDataVY.velocityValue.toStringAsFixed(2);
      controller.secondSegmentN.value.velocityIAS = obtainedDataVY.velocityValue;
    }
    var obtainedDataISASecondSegment = await ISATableService.getObtainedData((controller.selectedAirport.value!.elevation! + controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment!));
    if (obtainedDataISASecondSegment != null) {
      controller.obtainedISADataSecondSegmentN.value = obtainedDataISASecondSegment.dataList;
      controller.densitySecondSegmentN.text = obtainedDataISASecondSegment.densityValue.toStringAsFixed(2);
      controller.secondSegmentN.value.density = obtainedDataISASecondSegment.densityValue;
    }
    if (obtainedDataVY != null && obtainedDataISASecondSegment != null) {
      double velocityTAS = obtainedDataVY.velocityValue / sqrt(obtainedDataISASecondSegment.densityValue);
      controller.secondSegmentN.value.velocityTAS = velocityTAS;
      controller.velocitySecondSegmentTASN.text = velocityTAS.toStringAsFixed(2);
    }
    var rateresponseSecondSegment = await RateOfClimbGraphicService.getRateByAircraft(controller.selectedAircraft.value!.id!, 2, 'nMotors');
    if (rateresponseSecondSegment != null) {
      controller.rateGraphicSecondSegmentN.value = rateresponseSecondSegment;
    }
    var resultrateresponseSecondSegment = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphicSecondSegmentN.value.id!, controller.secondSegmentN.value.temperature!, (controller.selectedAirport.value!.elevation! + controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment!), double.parse(controller.weight.text));
    if (resultrateresponseSecondSegment != null) {
      controller.resultRateSecondSegmentN.value = resultrateresponseSecondSegment;
      controller.secondSegmentN.value.rateClimb = resultrateresponseSecondSegment['finalPoint']['x']; // rate of climb
      controller.rateOfClimbSecondSegmentN.text = resultrateresponseSecondSegment['finalPoint']['x'].toStringAsFixed(2);
      controller.secondSegmentN.value.timeToFinish = (controller.selectedAircraft.value!.profile!.nMotors!.heightSecondSegment! - controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment!) / resultrateresponseSecondSegment['finalPoint']['x']; // Temps que tarda d'anar de 800ft a 3000ft
      controller.timeSecondSegmentN.text = ((controller.selectedAircraft.value!.profile!.nMotors!.heightSecondSegment! - controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment!) / resultrateresponseSecondSegment['finalPoint']['x']).toStringAsFixed(2);
      if (controller.secondSegmentN.value.velocityTAS != null) {
        controller.secondSegmentN.value.distanceToFinish = controller.secondSegmentN.value.velocityTAS! * (((controller.selectedAircraft.value!.profile!.nMotors!.heightSecondSegment! - controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment!) / resultrateresponseSecondSegment['finalPoint']['x'])/60); // Distància que recórre de 800ft a 3000ft
        controller.distancSecondSegmentN.text = (controller.secondSegmentN.value.velocityTAS! * (((controller.selectedAircraft.value!.profile!.nMotors!.heightSecondSegment! - controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment!) / resultrateresponseSecondSegment['finalPoint']['x'])/60)).toStringAsFixed(2);
      }
    }
    if (controller.secondSegmentN.value.distanceToFinish != null && controller.firstSegmentN.value.distanceToFinish != null && controller.newProcedure.value.dpDistance != null) {
      if ((controller.secondSegmentN.value.distanceToFinish! + controller.firstSegmentN.value.distanceToFinish!) < controller.newProcedure.value.dpDistance!) {
        controller.secondSegmentN.value.reachDP = false;
      } else {
        controller.secondSegmentN.value.reachDP = true;
        reachDP2 = true;
        // Temps que tarda desde 800 ft fins al descision point
        controller.secondSegmentN.value.timeToDP = ((controller.newProcedure.value.dpDistance! - controller.firstSegmentN.value.distanceToFinish!) / controller.secondSegmentN.value.velocityTAS!) * 60;
        controller.timeToDPSecondSegmentN.text = (((controller.newProcedure.value.dpDistance! - controller.firstSegmentN.value.distanceToFinish!) / controller.secondSegmentN.value.velocityTAS!) * 60).toStringAsFixed(2);

        // Altitud desde 800ft fins al decision point
        controller.secondSegmentN.value.altitudeInDP = controller.secondSegmentN.value.timeToDP! * controller.secondSegmentN.value.rateClimb!;
        controller.altitudeInDPSecondSegmentN.text = (controller.secondSegmentN.value.timeToDP! * controller.secondSegmentN.value.rateClimb!).toStringAsFixed(2);
        controller.totalAltitudeInDPSecondSegmentN.text = (controller.secondSegmentN.value.timeToDP! * controller.secondSegmentN.value.rateClimb! + controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment! + controller.selectedAirport.value!.elevation!).toStringAsFixed(2);
        controller.initialElevation.text = controller.totalAltitudeInDPSecondSegmentN.text;
        controller.failure.value.initialElevation = controller.secondSegmentN.value.timeToDP! * controller.secondSegmentN.value.rateClimb! + controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment! + controller.selectedAirport.value!.elevation!;

        if ((controller.secondSegmentN.value.altitudeInDP! + controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment! + controller.selectedAirport.value!.elevation!) > controller.newProcedure.value.dpAltitude!) {
          controller.secondSegmentN.value.clearDP = true;
        } else {
          controller.secondSegmentN.value.clearDP = false;
        }
      }
    } else if (controller.secondSegmentN.value.distanceToFinish != null && controller.firstSegmentN.value.distanceToFinish != null && controller.newProcedure.value.dpDistance == null) {
      controller.secondSegmentN.value.clearDP = false;
      if (controller.selectedAircraft.value!.profile!.nMotors!.heightSecondSegment! < controller.newProcedure.value.dpAltitude!) {
        controller.secondSegmentN.value.reachDP = false;
      } else {
        controller.secondSegmentN.value.reachDP = true;
        reachDP2 = true;
        controller.secondSegmentN.value.timeToDP = (controller.newProcedure.value.dpAltitude! - controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment!) / controller.secondSegmentN.value.rateClimb!;
        controller.timeToDPSecondSegmentN.text = controller.secondSegmentN.value.timeToDP!.toStringAsFixed(2);
        controller.newProcedure.value.dpDistance = controller.firstSegmentN.value.distanceToFinish! + controller.secondSegmentN.value.timeToDP! * (controller.secondSegmentN.value.velocityTAS! / 60);
        controller.initialElevation.text = controller.newProcedure.value.dpAltitude!.toStringAsFixed(2);
        controller.failure.value.initialElevation = controller.newProcedure.value.dpAltitude!;
      }
    }

    controller.nMotors.value.secondSegment = controller.secondSegmentN.value;
  }

  // ---------------------- N MOTORES - 3 SEGMENTO -------------------------------------------

  controller.elevationThirdSegmentN.text = (controller.selectedAirport.value!.elevation! + controller.selectedAircraft.value!.profile!.nMotors!.heightSecondSegment!).toString();
  double thirdSegmentElevation = initialElevation + controller.selectedAircraft.value!.profile!.nMotors!.heightSecondSegment!;

  double altitudeDifferenceThirdSegment = thirdSegmentElevation - initialElevation;

  double temperatureChangeThirdSegment = (altitudeDifferenceThirdSegment / 1000) * 2; // Cada 1000 pies baja 2ºC

  double equivalentTemperatureThirdSegment = initialTemperature - temperatureChangeThirdSegment;

  controller.thirdSegmentN.value.temperature = equivalentTemperatureThirdSegment;

  if (controller.secondSegmentN.value.reachDP == false) {
    var obtainedDataVYThirdSegment = await VYTableService.getObtainedData(controller.selectedAircraft.value!.id!, (controller.selectedAirport.value!.elevation! + controller.selectedAircraft.value!.profile!.nMotors!.heightSecondSegment!), double.parse(controller.weight.text), "nMotors");
    if (obtainedDataVYThirdSegment != null) {
      controller.obtainedDataVYThirdSegmentN.value = obtainedDataVYThirdSegment.dataList;
      controller.velocityThirdSegmentN.text = obtainedDataVYThirdSegment.velocityValue.toStringAsFixed(2);
      controller.thirdSegmentN.value.velocityIAS = obtainedDataVYThirdSegment.velocityValue;
    }
    var obtainedDataISAThirdSegment = await ISATableService.getObtainedData((controller.selectedAirport.value!.elevation! + controller.selectedAircraft.value!.profile!.nMotors!.heightSecondSegment!));
    if (obtainedDataISAThirdSegment != null) {
      controller.obtainedISADataThirdSegmentN.value = obtainedDataISAThirdSegment.dataList;
      controller.densityThirdSegmentN.text = obtainedDataISAThirdSegment.densityValue.toStringAsFixed(2);
      controller.thirdSegmentN.value.density = obtainedDataISAThirdSegment.densityValue;
    }
    if (obtainedDataVYThirdSegment != null && obtainedDataISAThirdSegment != null) {
      double velocityTAS = obtainedDataVYThirdSegment.velocityValue / sqrt(obtainedDataISAThirdSegment.densityValue);
      controller.thirdSegmentN.value.velocityTAS = velocityTAS;
      controller.velocityThirdSegmentTASN.text = velocityTAS.toStringAsFixed(2);
    }
    if (controller.selectedAircraft.value?.metro == 'SA227AC 16000' || controller.selectedAircraft.value?.metro == 'SA227AC' || controller.selectedAircraft.value?.metro == 'SA227BC') {
      var rateresponseThirdSegment = await RateOfClimbGraphicService.getRateByAircraft(controller.selectedAircraft.value!.id!, 2, 'nMotors');
      if (rateresponseThirdSegment != null) {
        controller.rateGraphicThirdSegmentN.value = rateresponseThirdSegment;
      }
      var resultrateresponseThirdSegment = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphicThirdSegmentN.value.id!, controller.thirdSegmentN.value.temperature!, (controller.selectedAirport.value!.elevation! + controller.selectedAircraft.value!.profile!.nMotors!.heightSecondSegment!), double.parse(controller.weight.text));
      if (resultrateresponseThirdSegment != null) {
        controller.resultRateThirdSegmentN.value = resultrateresponseThirdSegment;
        controller.thirdSegmentN.value.rateClimb = resultrateresponseThirdSegment['finalPoint']['x'];
        controller.rateOfClimbThirdSegmentN.text = resultrateresponseThirdSegment['finalPoint']['x'].toStringAsFixed(2);
      }
    } else {
      // -------------------------- RATE OF CLIMB SECCTION 6 FOR SA226 -----------------------
    }
    if (controller.newProcedure.value.dpDistance != null) {
      controller.thirdSegmentN.value.reachDP = true;
      reachDP3 = true;
      controller.thirdSegmentN.value.timeToDP = ((controller.newProcedure.value.dpDistance! - (controller.firstSegmentN.value.distanceToFinish! + controller.secondSegmentN.value.distanceToFinish!)) / controller.thirdSegmentN.value.velocityTAS!) * 60;
      controller.timeToDPThirdSegmentN.text = (((controller.newProcedure.value.dpDistance! - (controller.firstSegmentN.value.distanceToFinish! + controller.secondSegmentN.value.distanceToFinish!)) / controller.thirdSegmentN.value.velocityTAS!) * 60).toStringAsFixed(2);

      controller.thirdSegmentN.value.altitudeInDP = controller.thirdSegmentN.value.timeToDP! * controller.thirdSegmentN.value.rateClimb!;
      controller.altitudeInDPThirdSegmentN.text = (controller.thirdSegmentN.value.timeToDP! * controller.thirdSegmentN.value.rateClimb!).toStringAsFixed(2);
      controller.totalAltitudeInDPThirdSegmentN.text = (controller.thirdSegmentN.value.timeToDP! * controller.thirdSegmentN.value.rateClimb! + controller.selectedAircraft.value!.profile!.nMotors!.heightSecondSegment! + controller.selectedAirport.value!.elevation!).toStringAsFixed(2);
      controller.initialElevation.text = controller.totalAltitudeInDPThirdSegmentN.text;
      controller.failure.value.initialElevation = controller.thirdSegmentN.value.timeToDP! * controller.thirdSegmentN.value.rateClimb! + controller.selectedAircraft.value!.profile!.nMotors!.heightSecondSegment! + controller.selectedAirport.value!.elevation!;


      if ((controller.thirdSegmentN.value.timeToDP! * controller.thirdSegmentN.value.rateClimb! + controller.selectedAircraft.value!.profile!.nMotors!.heightSecondSegment! + controller.selectedAirport.value!.elevation!) > controller.newProcedure.value.dpAltitude!) {
        controller.thirdSegmentN.value.clearDP = true;
      } else {
        controller.thirdSegmentN.value.clearDP = false;
      }
    } else {
      controller.thirdSegmentN.value.reachDP = true;
      reachDP3 = true;
      controller.thirdSegmentN.value.clearDP = false;
      controller.thirdSegmentN.value.timeToDP = (controller.newProcedure.value.dpAltitude! - controller.selectedAircraft.value!.profile!.nMotors!.heightSecondSegment!) / controller.thirdSegmentN.value.rateClimb!;
      controller.timeToDPThirdSegmentN.text = controller.thirdSegmentN.value.timeToDP!.toStringAsFixed(2);
      controller.newProcedure.value.dpDistance = controller.firstSegmentN.value.distanceToFinish! + controller.secondSegmentN.value.distanceToFinish! + controller.thirdSegmentN.value.timeToDP! * (controller.thirdSegmentN.value.velocityTAS! / 60);
      controller.initialElevation.text = controller.newProcedure.value.dpAltitude!.toStringAsFixed(2);
      controller.failure.value.initialElevation = controller.newProcedure.value.dpAltitude!;
    }
    controller.nMotors.value.thirdSegment = controller.thirdSegmentN.value;
  }
  controller.newProcedure.value.nMotors = controller.nMotors.value;
  controller.loadingAnalysisN.value = false;

  return {
    'reachDP1': reachDP1,
    'reachDP2': reachDP2,
    'reachDP3': reachDP3,
  };
}

Future<Map<String, bool>> calculateDataFailureAltitude(NewAnalaysisController controller) async {
  var reachDP1 = false;
  var reachDP2 = false;
  var reachDP3 = false;
  controller.loadingAnalysis.value = true;
  if (double.parse(controller.initialElevation.text) < controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!) {
    if (controller.dpDistance.text.isNotEmpty) {
      var resultrateresponseN = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphic.value.id!, controller.selectedAirport.value!.referenceTemperature!, controller.selectedAirport.value!.elevation!, double.parse(controller.weight.text));
      if (resultrateresponseN != null) {
        if (controller.firstSegmentN.value.velocityTAS != null) {
          controller.failure.value.distanceToInitial = controller.firstSegmentN.value.velocityTAS! * (((controller.failure.value.initialElevation! - 50) / resultrateresponseN['finalPoint']['x'])/60);
        }
      }
    } else {
      controller.failure.value.distanceToInitial = controller.newProcedure.value.dpDistance;
    }
  } else if ((double.parse(controller.initialElevation.text) < controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! || (double.parse(controller.initialElevation.text) > controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! && double.parse(controller.initialElevation.text) < controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment!))) {
    if (controller.dpDistance.text.isNotEmpty) {
      var resultrateresponseN = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphic.value.id!, controller.selectedAirport.value!.referenceTemperature!, (controller.selectedAirport.value!.elevation! + controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment!), double.parse(controller.weight.text));
      if (resultrateresponseN != null) {
        if (controller.firstSegmentN.value.velocityTAS != null) {
          var distance = controller.firstSegmentN.value.velocityTAS! * (((controller.failure.value.initialElevation! - controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment!) / resultrateresponseN['finalPoint']['x'])/60);
          controller.failure.value.distanceToInitial = controller.firstSegmentN.value.distanceToFinish! + distance;
        }
      }
    } else {
      controller.failure.value.distanceToInitial = controller.newProcedure.value.dpDistance;
    }
    controller.firstSegmentN1.value.reachDP = false;
  } else {
    if (controller.dpDistance.text.isNotEmpty) {
      var resultrateresponseN = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphic.value.id!, controller.selectedAirport.value!.referenceTemperature!, (controller.selectedAirport.value!.elevation! + controller.selectedAircraft.value!.profile!.nMotors!.heightSecondSegment!), double.parse(controller.weight.text));
      if (resultrateresponseN != null) {
        if (controller.firstSegmentN.value.velocityTAS != null) {
          var distance = controller.firstSegmentN.value.velocityTAS! * (((controller.failure.value.initialElevation! - controller.selectedAircraft.value!.profile!.nMotors!.heightSecondSegment!) / resultrateresponseN['finalPoint']['x'])/60);
          controller.failure.value.distanceToInitial = controller.firstSegmentN.value.distanceToFinish! + controller.secondSegmentN.value.distanceToFinish! + distance;
        }
      }
    } else {
      controller.failure.value.distanceToInitial = controller.newProcedure.value.dpDistance;
    }
    controller.firstSegmentN1.value.reachDP = false;
    controller.secondSegmentN1.value.reachDP = false;
  }
  // ----------------------------- 1st SEGMENT -----------------------------
  if (double.parse(controller.initialElevation.text) < controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!) {
    controller.elevationFirstSegmentN1.text = (controller.failure.value.initialElevation!).toString();
    double elevationFirstSegmentN1 = controller.failure.value.initialElevation!;

    double altitudeDifferenceFirstSegmentN1 = elevationFirstSegmentN1 - controller.selectedAirport.value!.elevation!;

    double temperatureChangeFirstSegmentN1 = (altitudeDifferenceFirstSegmentN1 / 1000) * 2;

    double equivalentTemperatureFirstSegmentN1 = controller.selectedAirport.value!.referenceTemperature! - temperatureChangeFirstSegmentN1;

    controller.firstSegmentN1.value.temperature = equivalentTemperatureFirstSegmentN1;

    var obtainedData = await V2TableService.getObtainedData(controller.selectedAircraft.value!.id!, (controller.failure.value.initialElevation!), double.parse(controller.weight.text), controller.firstSegmentN1.value.temperature!, "V2");
    if (obtainedData != null) {
      controller.obtainedDataN1.value = obtainedData.dataList;
      controller.velocityFirstSegmentN1.text = obtainedData.velocityValue.toString();
      controller.firstSegmentN1.value.velocityIAS = obtainedData.velocityValue;
    }
    var obtainedDataISA = await ISATableService.getObtainedData((controller.failure.value.initialElevation!));
    if (obtainedDataISA != null) {
      controller.obtainedISADataFirstSegmentN1.value = obtainedDataISA.dataList;
      controller.densityFirstSegmentN1.text = obtainedDataISA.densityValue.toString();
      controller.firstSegmentN1.value.density = obtainedDataISA.densityValue;
    }
    if (obtainedData != null && obtainedDataISA != null) {
      double velocityTAS = obtainedData.velocityValue / sqrt(obtainedDataISA.densityValue);
      controller.firstSegmentN1.value.velocityTAS = velocityTAS;
      controller.velocityFirstSegmentTASN1.text = velocityTAS.toString();
    }
    var rateresponse = await RateOfClimbGraphicService.getRateByAircraft(controller.selectedAircraft.value!.id!, 1, "failure");
    if (rateresponse != null) {
      controller.rateGraphicFirstSegmentN1.value = rateresponse;
    }
    var gradientresponse = await GradientGraphicService.getGradientByAircraft(controller.selectedAircraft.value!.id!, 1);
    if (gradientresponse != null) {
      controller.gradientGraphicFirstSegmentN1.value = gradientresponse;
    }
    var resultrateresponse = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphicFirstSegmentN1.value.id!, controller.firstSegmentN1.value.temperature!, (controller.failure.value.initialElevation!), double.parse(controller.weight.text));
    if (resultrateresponse != null) {
      controller.resultRateFirstSegmentN1.value = resultrateresponse;
      controller.firstSegmentN1.value.rateClimb = resultrateresponse['finalPoint']['x'];
      controller.gradientFirstSegmentN1.text = resultrateresponse['finalPoint']['x'].toString();
      var resultgradientresponse = await GradientGraphicService.calculateDistance(controller.gradientGraphicFirstSegmentN1.value.id!, resultrateresponse['finalPoint']['x'], controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! - 35);
      if (resultgradientresponse != null) {
        controller.resultGradientFirstSegmentN1.value = resultgradientresponse;
        controller.firstSegmentN1.value.distanceToFinish = resultgradientresponse['thirdPoint']['x'];
        controller.distanceFirstSegmentN1.text = resultgradientresponse['thirdPoint']['x'].toString();
      }
    }
    if (controller.firstSegmentN1.value.distanceToFinish != null && controller.altitude.value.dpDistance != null) {
      if ((controller.firstSegmentN1.value.distanceToFinish! + controller.failure.value.distanceToInitial!) < controller.altitude.value.dpDistance!) {
        controller.firstSegmentN1.value.reachDP = false;
      } else {
        controller.firstSegmentN1.value.reachDP = true;
        reachDP1 = true;

        controller.firstSegmentN1.value.altitudeInDP = ((controller.altitude.value.dpDistance! - controller.failure.value.distanceToInitial!) * 6076.12 * controller.firstSegmentN1.value.rateClimb!) / 100;
        controller.altitudeInDPFirstSegmentN1.text = (((controller.altitude.value.dpDistance! - controller.failure.value.distanceToInitial!) * 6076.12 * controller.firstSegmentN1.value.rateClimb!) / 100).toString();
        controller.totalAltitudeInDPFirstSegmentN1.text = (controller.firstSegmentN1.value.altitudeInDP! + controller.failure.value.initialElevation!).toString();

        if ((controller.firstSegmentN1.value.altitudeInDP! + controller.failure.value.initialElevation!) > controller.altitude.value.dpElevation!) {
          controller.firstSegmentN1.value.clearDP = true;
        } else {
          controller.firstSegmentN1.value.clearDP = false;
        }
      }
    }
  }
  // ---------------------- 2 SEGMENT -------------------------------------------
  if ((double.parse(controller.initialElevation.text) < controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! || (double.parse(controller.initialElevation.text) > controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! && double.parse(controller.initialElevation.text) < controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment!))) {
    if (controller.failure.value.initialElevation! < controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!) {
      controller.elevationSecondSegmentN1.text = (controller.selectedAirport.value!.elevation! + controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!).toString();
    } else {
      controller.elevationSecondSegmentN1.text = (controller.failure.value.initialElevation!).toString();
    }
    double altitudeDifferenceSecondSegmentN1 = double.parse(controller.elevationSecondSegmentN1.text) - controller.selectedAirport.value!.elevation!;

    double temperatureChangeSecondSegmentN1 = (altitudeDifferenceSecondSegmentN1 / 1000) * 2;

    double equivalentTemperatureSecondSegmentN1 = controller.selectedAirport.value!.referenceTemperature! - temperatureChangeSecondSegmentN1;

    controller.secondSegmentN1.value.temperature = equivalentTemperatureSecondSegmentN1;

    if (controller.firstSegmentN1.value.reachDP == false) {
      var responseVY = await VYTableService.getVYtableByAircraft(controller.selectedAircraft.value!.id!, "failure");
      if (responseVY != null) {
        controller.vYtableN1.value = responseVY;
      }
      var obtainedDataVY = await VYTableService.getObtainedData(controller.selectedAircraft.value!.id!, double.parse(controller.elevationSecondSegmentN1.text), double.parse(controller.weight.text), "failure");
      if (obtainedDataVY != null) {
        controller.obtainedDataVYN1.value = obtainedDataVY.dataList;
        controller.velocitySecondSegmentN1.text = obtainedDataVY.velocityValue.toStringAsFixed(2);
        controller.secondSegmentN1.value.velocityIAS = obtainedDataVY.velocityValue;
      }
      var obtainedDataISASecondSegment = await ISATableService.getObtainedData(double.parse(controller.elevationSecondSegmentN1.text));
      if (obtainedDataISASecondSegment != null) {
        controller.obtainedISADataSecondSegmentN1.value = obtainedDataISASecondSegment.dataList;
        controller.densitySecondSegmentN1.text = obtainedDataISASecondSegment.densityValue.toStringAsFixed(2);
        controller.secondSegmentN1.value.density = obtainedDataISASecondSegment.densityValue;
      }
      if (obtainedDataVY != null && obtainedDataISASecondSegment != null) {
        double velocityTAS = obtainedDataVY.velocityValue / sqrt(obtainedDataISASecondSegment.densityValue);
        controller.secondSegmentN1.value.velocityTAS = velocityTAS;
        controller.velocitySecondSegmentTASN1.text = velocityTAS.toStringAsFixed(2);
      }
      var rateresponseSecond = await RateOfClimbGraphicService.getRateByAircraft(controller.selectedAircraft.value!.id!, 2, "failure");
      if (rateresponseSecond != null) {
        controller.rateGraphicSecondSegmentN1.value = rateresponseSecond;
      }
      var gradientresponseSecond = await GradientGraphicService.getGradientByAircraft(controller.selectedAircraft.value!.id!, 2);
      if (gradientresponseSecond != null) {
        controller.gradientGraphicSecondSegmentN1.value = gradientresponseSecond;
      }
      var resultrateresponseSecond = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphicSecondSegmentN1.value.id!, controller.secondSegmentN1.value.temperature!, double.parse(controller.elevationSecondSegmentN1.text), double.parse(controller.weight.text));
      if (resultrateresponseSecond != null) {
        controller.resultRateSecondSegmentN1.value = resultrateresponseSecond;
        controller.secondSegmentN1.value.rateClimb = resultrateresponseSecond['finalPoint']['x'];
        controller.gradientSecondSegmentN1.text = resultrateresponseSecond['finalPoint']['x'].toString();
        var resultgradientresponse = await GradientGraphicService.calculateDistance(controller.gradientGraphicSecondSegmentN1.value.id!, resultrateresponseSecond['finalPoint']['x'], controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment! - controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!);
        if (resultgradientresponse != null) {
          controller.resultGradientSecondSegmentN1.value = resultgradientresponse;
          controller.secondSegmentN1.value.distanceToFinish = resultgradientresponse['thirdPoint']['x'];
          controller.distanceSecondSegmentN1.text = resultgradientresponse['thirdPoint']['x'].toString();
        }
      }
      if (controller.secondSegmentN1.value.distanceToFinish != null && controller.altitude.value.dpDistance != null) {
        if ((controller.secondSegmentN1.value.distanceToFinish! + (controller.firstSegmentN1.value.distanceToFinish ?? 0) + controller.failure.value.distanceToInitial!) < controller.altitude.value.dpDistance!) {
          controller.secondSegmentN1.value.reachDP = false;
        } else {
          controller.secondSegmentN1.value.reachDP = true;
          reachDP2 = true;

          controller.secondSegmentN1.value.altitudeInDP = ((controller.altitude.value.dpDistance! - ((controller.firstSegmentN1.value.distanceToFinish ?? 0) + controller.failure.value.distanceToInitial!)) * 6076.12) * controller.secondSegmentN1.value.rateClimb! / 100;
          controller.altitudeInDPSecondSegmentN1.text = (((controller.altitude.value.dpDistance! - ((controller.firstSegmentN1.value.distanceToFinish ?? 0) + controller.failure.value.distanceToInitial!)) * 6076.12) * controller.secondSegmentN1.value.rateClimb! / 100).toString();

          if (controller.failure.value.initialElevation! < controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!) {
            controller.totalAltitudeInDPSecondSegmentN1.text = (controller.secondSegmentN1.value.altitudeInDP! + controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! + controller.selectedAirport.value!.elevation!).toString();
          } else {
            controller.totalAltitudeInDPSecondSegmentN1.text = (controller.secondSegmentN1.value.altitudeInDP! + controller.failure.value.initialElevation!).toString();
          }

          if (double.parse(controller.totalAltitudeInDPSecondSegmentN1.text) > controller.altitude.value.dpElevation!) {
            controller.secondSegmentN1.value.clearDP = true;
          } else {
            controller.secondSegmentN1.value.clearDP = false;
          }
        }
      }
    }
  }

  // ---------------------- 3 SEGMENT -------------------------------------------

  if (controller.failure.value.initialElevation! < controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment!) {
    controller.elevationThirdSegmentN1.text = (controller.selectedAirport.value!.elevation! + controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment!).toString();
  } else {
    controller.elevationThirdSegmentN1.text = (controller.failure.value.initialElevation!).toString();
  }

  double altitudeDifferenceThirdSegmentN1 = double.parse(controller.elevationThirdSegmentN1.text) - controller.selectedAirport.value!.elevation!;

  double temperatureChangeThirdSegmentN1 = (altitudeDifferenceThirdSegmentN1 / 1000) * 2;

  double equivalentTemperatureThirdSegmentN1 = controller.selectedAirport.value!.referenceTemperature! - temperatureChangeThirdSegmentN1;

  controller.thirdSegmentN1.value.temperature = equivalentTemperatureThirdSegmentN1;

  if (controller.secondSegmentN1.value.reachDP == false) {
    var responseVY = await VYTableService.getVYtableByAircraft(controller.selectedAircraft.value!.id!, "failure");
    if (responseVY != null) {
      controller.vYtableN1.value = responseVY;
    }
    var obtainedDataVY = await VYTableService.getObtainedData(controller.selectedAircraft.value!.id!, double.parse(controller.elevationThirdSegmentN1.text), double.parse(controller.weight.text), "failure");
    if (obtainedDataVY != null) {
      controller.obtainedDataThirdVYN1.value = obtainedDataVY.dataList;
      controller.velocityThirdSegmentN1.text = obtainedDataVY.velocityValue.toStringAsFixed(2);
      controller.thirdSegmentN1.value.velocityIAS = obtainedDataVY.velocityValue;
    }
    var obtainedDataISAThirdSegment = await ISATableService.getObtainedData(double.parse(controller.elevationThirdSegmentN1.text));
    if (obtainedDataISAThirdSegment != null) {
      controller.obtainedISADataThirdSegmentN1.value = obtainedDataISAThirdSegment.dataList;
      controller.densityThirdSegmentN1.text = obtainedDataISAThirdSegment.densityValue.toStringAsFixed(2);
      controller.thirdSegmentN1.value.density = obtainedDataISAThirdSegment.densityValue;
    }
    if (obtainedDataVY != null && obtainedDataISAThirdSegment != null) {
      double velocityTAS = obtainedDataVY.velocityValue / sqrt(obtainedDataISAThirdSegment.densityValue);
      controller.thirdSegmentN1.value.velocityTAS = velocityTAS;
      controller.velocityThirdSegmentTASN1.text = velocityTAS.toStringAsFixed(2);
    }
    var rateresponseThird = await RateOfClimbGraphicService.getRateByAircraft(controller.selectedAircraft.value!.id!, 3, "failure");
    if (rateresponseThird != null) {
      controller.rateGraphicThirdSegmentN1.value = rateresponseThird;
    }
    var gradientresponseThird = await GradientGraphicService.getGradientByAircraft(controller.selectedAircraft.value!.id!, 2);
    if (gradientresponseThird != null) {
      controller.gradientGraphicThirdSegmentN1.value = gradientresponseThird;
    }
    var resultrateresponseThird = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphicThirdSegmentN1.value.id!, controller.thirdSegmentN1.value.temperature!, double.parse(controller.elevationThirdSegmentN1.text), double.parse(controller.weight.text));
    if (resultrateresponseThird != null) {
      controller.resultRateThirdSegmentN1.value = resultrateresponseThird;
      controller.thirdSegmentN1.value.rateClimb = resultrateresponseThird['finalPoint']['x'];
      controller.rateOfClimbThirdSegmentN1.text = resultrateresponseThird['finalPoint']['x'].toStringAsFixed(2);
    }
    if (controller.altitude.value.dpDistance != null) {
      controller.thirdSegmentN1.value.reachDP = true;
      reachDP3 = true;
      controller.thirdSegmentN1.value.timeToDP = ((controller.altitude.value.dpDistance! - (controller.failure.value.distanceToInitial! + (controller.firstSegmentN1.value.distanceToFinish ?? 0) + (controller.secondSegmentN1.value.distanceToFinish ?? 0))) / controller.thirdSegmentN1.value.velocityTAS!) * 60;
      controller.timeToDPThirdSegmentN1.text = (((controller.altitude.value.dpDistance! - (controller.failure.value.distanceToInitial! + (controller.firstSegmentN1.value.distanceToFinish ?? 0) + (controller.secondSegmentN1.value.distanceToFinish ?? 0))) / controller.thirdSegmentN1.value.velocityTAS!) * 60).toStringAsFixed(2);

      controller.thirdSegmentN1.value.altitudeInDP = controller.thirdSegmentN1.value.timeToDP! * controller.thirdSegmentN1.value.rateClimb!;
      controller.altitudeInDPThirdSegmentN1.text = (controller.thirdSegmentN1.value.timeToDP! * controller.thirdSegmentN1.value.rateClimb!).toStringAsFixed(2);

      if (controller.failure.value.initialElevation! < controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment!) {
        controller.totalAltitudeInDPThirdSegmentN1.text = (controller.thirdSegmentN1.value.altitudeInDP! + controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment! + controller.selectedAirport.value!.elevation!).toString();
      } else {
        controller.totalAltitudeInDPThirdSegmentN1.text = (controller.thirdSegmentN1.value.altitudeInDP! + controller.failure.value.initialElevation!).toString();
      }
      if (double.parse(controller.totalAltitudeInDPThirdSegmentN1.text) > controller.altitude.value.dpElevation!) {
        controller.thirdSegmentN1.value.clearDP = true;
      } else {
        controller.thirdSegmentN1.value.clearDP = false;
      }
    }
  }
  controller.altitude.value.firstSegment = controller.firstSegmentN1.value;
  controller.altitude.value.secondSegment = controller.secondSegmentN1.value;
  controller.altitude.value.thirdSegment = controller.thirdSegmentN1.value;
  controller.failure.value.altitude = controller.altitude.value;
  controller.newProcedure.value.failure = controller.failure.value;
  controller.seeAnalysis.value = true;
  controller.loadingAnalysis.value = false;
  return {
    'reachDP1': reachDP1,
    'reachDP2': reachDP2,
    'reachDP3': reachDP3,
  };
}

Future<Map<String, bool>> calculateDataFailureGradient(NewAnalaysisController controller) async {
  var reachDP1 = false;
  var reachDP2 = false;
  var reachDP3 = false;
  controller.loadingAnalysis.value = true;
  if (double.parse(controller.initialElevation.text) < controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!) {
    var resultrateresponseN = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphic.value.id!, controller.selectedAirport.value!.referenceTemperature!, controller.selectedAirport.value!.elevation!, double.parse(controller.weight.text));
    if (resultrateresponseN != null) {
      if (controller.firstSegmentN.value.velocityTAS != null) {
        controller.failure.value.distanceToInitial = controller.firstSegmentN.value.velocityTAS! * (((controller.failure.value.initialElevation! - 50) / resultrateresponseN['finalPoint']['x'])/60);
      }
    }
  } else if ((double.parse(controller.initialElevation.text) < controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! || (double.parse(controller.initialElevation.text) > controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! && double.parse(controller.initialElevation.text) < controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment!))) {
    var resultrateresponseN = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphic.value.id!, controller.selectedAirport.value!.referenceTemperature!, (controller.selectedAirport.value!.elevation! + controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment!), double.parse(controller.weight.text));
    if (resultrateresponseN != null) {
      if (controller.firstSegmentN.value.velocityTAS != null) {
        var distance = controller.firstSegmentN.value.velocityTAS! * (((controller.failure.value.initialElevation! - controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment!) / resultrateresponseN['finalPoint']['x'])/60);
        controller.failure.value.distanceToInitial = controller.firstSegmentN.value.distanceToFinish! + distance;
      }
    }
    controller.firstSegmentN1.value.reachDP = false;
  } else {
    var resultrateresponseN = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphic.value.id!, controller.selectedAirport.value!.referenceTemperature!, (controller.selectedAirport.value!.elevation! + controller.selectedAircraft.value!.profile!.nMotors!.heightSecondSegment!), double.parse(controller.weight.text));
    if (resultrateresponseN != null) {
      if (controller.firstSegmentN.value.velocityTAS != null) {
        var distance = controller.firstSegmentN.value.velocityTAS! * (((controller.failure.value.initialElevation! - controller.selectedAircraft.value!.profile!.nMotors!.heightSecondSegment!) / resultrateresponseN['finalPoint']['x'])/60);
        controller.failure.value.distanceToInitial = controller.firstSegmentN.value.distanceToFinish! + controller.secondSegmentN.value.distanceToFinish! + distance;
      }
    }
    controller.firstSegmentN1.value.reachDP = false;
    controller.secondSegmentN1.value.reachDP = false;
  }
  // ----------------------------- 1st SEGMENT -----------------------------
  if (double.parse(controller.initialElevation.text) < controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!) {
    controller.elevationFirstSegmentN1.text = (controller.failure.value.initialElevation!).toString();
    double elevationFirstSegmentN1 = controller.failure.value.initialElevation!;

    double altitudeDifferenceFirstSegmentN1 = elevationFirstSegmentN1 - controller.selectedAirport.value!.elevation!;

    double temperatureChangeFirstSegmentN1 = (altitudeDifferenceFirstSegmentN1 / 1000) * 2;

    double equivalentTemperatureFirstSegmentN1 = controller.selectedAirport.value!.referenceTemperature! - temperatureChangeFirstSegmentN1;

    controller.firstSegmentN1.value.temperature = equivalentTemperatureFirstSegmentN1;
    var obtainedData = await V2TableService.getObtainedData(controller.selectedAircraft.value!.id!, (controller.failure.value.initialElevation!), double.parse(controller.weight.text), controller.firstSegmentN1.value.temperature!, "V2");
    if (obtainedData != null) {
      controller.obtainedDataN1.value = obtainedData.dataList;
      controller.velocityFirstSegmentN1.text = obtainedData.velocityValue.toString();
      controller.firstSegmentN1.value.velocityIAS = obtainedData.velocityValue;
    }
    var obtainedDataISA = await ISATableService.getObtainedData((controller.failure.value.initialElevation!));
    if (obtainedDataISA != null) {
      controller.obtainedISADataFirstSegmentN1.value = obtainedDataISA.dataList;
      controller.densityFirstSegmentN1.text = obtainedDataISA.densityValue.toString();
      controller.firstSegmentN1.value.density = obtainedDataISA.densityValue;
    }
    if (obtainedData != null && obtainedDataISA != null) {
      double velocityTAS = obtainedData.velocityValue / sqrt(obtainedDataISA.densityValue);
      controller.firstSegmentN1.value.velocityTAS = velocityTAS;
      controller.velocityFirstSegmentTASN1.text = velocityTAS.toString();
    }
    var rateresponse = await RateOfClimbGraphicService.getRateByAircraft(controller.selectedAircraft.value!.id!, 1, "failure");
    if (rateresponse != null) {
      controller.rateGraphicFirstSegmentN1.value = rateresponse;
    }
    var gradientresponse = await GradientGraphicService.getGradientByAircraft(controller.selectedAircraft.value!.id!, 1);
    if (gradientresponse != null) {
      controller.gradientGraphicFirstSegmentN1.value = gradientresponse;
    }
    var resultrateresponse = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphicFirstSegmentN1.value.id!, controller.firstSegmentN1.value.temperature!, (controller.failure.value.initialElevation!), double.parse(controller.weight.text));
    if (resultrateresponse != null) {
      controller.resultRateFirstSegmentN1.value = resultrateresponse;
      controller.firstSegmentN1.value.rateClimb = resultrateresponse['finalPoint']['x'];
      controller.gradientFirstSegmentN1.text = resultrateresponse['finalPoint']['x'].toString();
      var resultgradientresponse = await GradientGraphicService.calculateDistance(controller.gradientGraphicFirstSegmentN1.value.id!, resultrateresponse['finalPoint']['x'], controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! - 35);
      if (resultgradientresponse != null) {
        controller.resultGradientFirstSegmentN1.value = resultgradientresponse;
        controller.firstSegmentN1.value.distanceToFinish = resultgradientresponse['thirdPoint']['x'];
        controller.distanceFirstSegmentN1.text = resultgradientresponse['thirdPoint']['x'].toString();
      }
    }
    if (controller.firstSegmentN1.value.distanceToFinish != null && controller.gradient.value.dpDistance != null) {
      if ((controller.firstSegmentN1.value.distanceToFinish! + controller.failure.value.distanceToInitial!) < controller.gradient.value.dpDistance!) {
        controller.firstSegmentN1.value.reachDP = false;
      } else {
        controller.firstSegmentN1.value.reachDP = true;
        reachDP1 = true;

        controller.firstSegmentN1.value.altitudeInDP = ((controller.gradient.value.dpDistance! - controller.failure.value.distanceToInitial!) * 6076.12 * controller.firstSegmentN1.value.rateClimb!) / 100;
        controller.altitudeInDPFirstSegmentN1.text = (((controller.gradient.value.dpDistance! - controller.failure.value.distanceToInitial!) * 6076.12 * controller.firstSegmentN1.value.rateClimb!) / 100).toString();
        controller.totalAltitudeInDPFirstSegmentN1.text = (controller.firstSegmentN1.value.altitudeInDP! + controller.failure.value.initialElevation!).toString();
        var height = controller.firstSegmentN1.value.altitudeInDP! + controller.failure.value.initialElevation!;
        var distanceFeet = controller.gradient.value.dpDistance! * 6076.12;
        controller.gradient.value.finalGradient = (height / distanceFeet) * 100;
        controller.finalGradientN1.text = ((height / distanceFeet) * 100).toStringAsFixed(2);

        if (controller.gradient.value.finalGradient! > controller.gradient.value.gradientValue!) {
          controller.firstSegmentN1.value.clearDP = true;
        } else {
          controller.firstSegmentN1.value.clearDP = false;
        }
      }
    }
  }
  // ---------------------- 2 SEGMENT -------------------------------------------
  if ((double.parse(controller.initialElevation.text) < controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! || (double.parse(controller.initialElevation.text) > controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! && double.parse(controller.initialElevation.text) < controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment!))) {
    if (controller.failure.value.initialElevation! < controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!) {
      controller.elevationSecondSegmentN1.text = (controller.selectedAirport.value!.elevation! + controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!).toString();
    } else {
      controller.elevationSecondSegmentN1.text = (controller.failure.value.initialElevation!).toString();
    }
    double altitudeDifferenceSecondSegmentN1 = double.parse(controller.elevationSecondSegmentN1.text) - controller.selectedAirport.value!.elevation!;

    double temperatureChangeSecondSegmentN1 = (altitudeDifferenceSecondSegmentN1 / 1000) * 2;

    double equivalentTemperatureSecondSegmentN1 = controller.selectedAirport.value!.referenceTemperature! - temperatureChangeSecondSegmentN1;

    controller.secondSegmentN1.value.temperature = equivalentTemperatureSecondSegmentN1;
    if (controller.firstSegmentN1.value.reachDP == false) {
      var responseVY = await VYTableService.getVYtableByAircraft(controller.selectedAircraft.value!.id!, "failure");
      if (responseVY != null) {
        controller.vYtableN1.value = responseVY;
      }
      var obtainedDataVY = await VYTableService.getObtainedData(controller.selectedAircraft.value!.id!, double.parse(controller.elevationSecondSegmentN1.text), double.parse(controller.weight.text), "failure");
      if (obtainedDataVY != null) {
        controller.obtainedDataVYN1.value = obtainedDataVY.dataList;
        controller.velocitySecondSegmentN1.text = obtainedDataVY.velocityValue.toStringAsFixed(2);
        controller.secondSegmentN1.value.velocityIAS = obtainedDataVY.velocityValue;
      }
      var obtainedDataISASecondSegment = await ISATableService.getObtainedData(double.parse(controller.elevationSecondSegmentN1.text));
      if (obtainedDataISASecondSegment != null) {
        controller.obtainedISADataSecondSegmentN1.value = obtainedDataISASecondSegment.dataList;
        controller.densitySecondSegmentN1.text = obtainedDataISASecondSegment.densityValue.toStringAsFixed(2);
        controller.secondSegmentN1.value.density = obtainedDataISASecondSegment.densityValue;
      }
      if (obtainedDataVY != null && obtainedDataISASecondSegment != null) {
        double velocityTAS = obtainedDataVY.velocityValue / sqrt(obtainedDataISASecondSegment.densityValue);
        controller.secondSegmentN1.value.velocityTAS = velocityTAS;
        controller.velocitySecondSegmentTASN1.text = velocityTAS.toStringAsFixed(2);
      }
      var rateresponseSecond = await RateOfClimbGraphicService.getRateByAircraft(controller.selectedAircraft.value!.id!, 2, "failure");
      if (rateresponseSecond != null) {
        controller.rateGraphicSecondSegmentN1.value = rateresponseSecond;
      }
      var gradientresponseSecond = await GradientGraphicService.getGradientByAircraft(controller.selectedAircraft.value!.id!, 2);
      if (gradientresponseSecond != null) {
        controller.gradientGraphicSecondSegmentN1.value = gradientresponseSecond;
      }
      var resultrateresponseSecond = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphicSecondSegmentN1.value.id!, controller.secondSegmentN1.value.temperature!, double.parse(controller.elevationSecondSegmentN1.text), double.parse(controller.weight.text));
      if (resultrateresponseSecond != null) {
        controller.resultRateSecondSegmentN1.value = resultrateresponseSecond;
        controller.secondSegmentN1.value.rateClimb = resultrateresponseSecond['finalPoint']['x'];
        controller.gradientSecondSegmentN1.text = resultrateresponseSecond['finalPoint']['x'].toString();
        var resultgradientresponse = await GradientGraphicService.calculateDistance(controller.gradientGraphicSecondSegmentN1.value.id!, resultrateresponseSecond['finalPoint']['x'], controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment! - controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!);
        if (resultgradientresponse != null) {
          controller.resultGradientSecondSegmentN1.value = resultgradientresponse;
          controller.secondSegmentN1.value.distanceToFinish = resultgradientresponse['thirdPoint']['x'];
          controller.distanceSecondSegmentN1.text = resultgradientresponse['thirdPoint']['x'].toString();
        }
      }
      if (controller.secondSegmentN1.value.distanceToFinish != null && controller.gradient.value.dpDistance != null) {
        if ((controller.secondSegmentN1.value.distanceToFinish! + (controller.firstSegmentN1.value.distanceToFinish ?? 0) + controller.failure.value.distanceToInitial!) < controller.gradient.value.dpDistance!) {
          controller.secondSegmentN1.value.reachDP = false;
        } else {
          controller.secondSegmentN1.value.reachDP = true;
          reachDP2 = true;

          if (controller.failure.value.distanceToInitial! > controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!) {
            controller.secondSegmentN1.value.altitudeInDP = ((controller.gradient.value.dpDistance! - controller.failure.value.distanceToInitial!) * 6076.12 * controller.secondSegmentN1.value.rateClimb!) / 100;
            controller.altitudeInDPSecondSegmentN1.text = (((controller.gradient.value.dpDistance! - controller.failure.value.distanceToInitial!) * 6076.12 * controller.secondSegmentN1.value.rateClimb!) / 100).toString();
          } else {
            controller.secondSegmentN1.value.altitudeInDP = ((controller.gradient.value.dpDistance! - controller.failure.value.gradient!.firstSegment!.distanceToFinish! - controller.failure.value.distanceToInitial!) * 6076.12 * controller.secondSegmentN1.value.rateClimb!) / 100;
            controller.altitudeInDPSecondSegmentN1.text = (((controller.gradient.value.dpDistance! - controller.failure.value.gradient!.firstSegment!.distanceToFinish! - controller.failure.value.distanceToInitial!) * 6076.12 * controller.secondSegmentN1.value.rateClimb!) / 100).toString();
          }


          if (controller.failure.value.initialElevation! < controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!) {
            controller.totalAltitudeInDPSecondSegmentN1.text = (controller.secondSegmentN1.value.altitudeInDP! + controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! + controller.selectedAirport.value!.elevation!).toString();
          } else {
            controller.totalAltitudeInDPSecondSegmentN1.text = (controller.secondSegmentN1.value.altitudeInDP! + controller.failure.value.initialElevation!).toString();
          }
          var height = double.parse(controller.totalAltitudeInDPSecondSegmentN1.text);
          var distanceFeet = controller.gradient.value.dpDistance! * 6076.12;
          controller.gradient.value.finalGradient = (height / distanceFeet) * 100;
          controller.finalGradientN1.text = ((height / distanceFeet) * 100).toStringAsFixed(2);

          if (controller.gradient.value.finalGradient! > controller.gradient.value.gradientValue!) {
            controller.secondSegmentN1.value.clearDP = true;
          } else {
            controller.secondSegmentN1.value.clearDP = false;
          }
        }
      }
    }
  }

  // ---------------------- 3 SEGMENT -------------------------------------------

  if (controller.failure.value.initialElevation! < controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment!) {
    controller.elevationThirdSegmentN1.text = (controller.selectedAirport.value!.elevation! + controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment!).toString();
  } else {
    controller.elevationThirdSegmentN1.text = (controller.failure.value.initialElevation!).toString();
  }

  double altitudeDifferenceThirdSegmentN1 = double.parse(controller.elevationThirdSegmentN1.text) - controller.selectedAirport.value!.elevation!;

  double temperatureChangeThirdSegmentN1 = (altitudeDifferenceThirdSegmentN1 / 1000) * 2;

  double equivalentTemperatureThirdSegmentN1 = controller.selectedAirport.value!.referenceTemperature! - temperatureChangeThirdSegmentN1;

  controller.thirdSegmentN1.value.temperature = equivalentTemperatureThirdSegmentN1;
  if (controller.secondSegmentN1.value.reachDP == false) {
    var responseVY = await VYTableService.getVYtableByAircraft(controller.selectedAircraft.value!.id!, "failure");
    if (responseVY != null) {
      controller.vYtableN1.value = responseVY;
    }
    var obtainedDataVY = await VYTableService.getObtainedData(controller.selectedAircraft.value!.id!, double.parse(controller.elevationThirdSegmentN1.text), double.parse(controller.weight.text), "failure");
    if (obtainedDataVY != null) {
      controller.obtainedDataThirdVYN1.value = obtainedDataVY.dataList;
      controller.velocityThirdSegmentN1.text = obtainedDataVY.velocityValue.toStringAsFixed(2);
      controller.thirdSegmentN1.value.velocityIAS = obtainedDataVY.velocityValue;
    }
    var obtainedDataISAThirdSegment = await ISATableService.getObtainedData(double.parse(controller.elevationThirdSegmentN1.text));
    if (obtainedDataISAThirdSegment != null) {
      controller.obtainedISADataThirdSegmentN1.value = obtainedDataISAThirdSegment.dataList;
      controller.densityThirdSegmentN1.text = obtainedDataISAThirdSegment.densityValue.toStringAsFixed(2);
      controller.thirdSegmentN1.value.density = obtainedDataISAThirdSegment.densityValue;
    }
    if (obtainedDataVY != null && obtainedDataISAThirdSegment != null) {
      double velocityTAS = obtainedDataVY.velocityValue / sqrt(obtainedDataISAThirdSegment.densityValue);
      controller.thirdSegmentN1.value.velocityTAS = velocityTAS;
      controller.velocityThirdSegmentTASN1.text = velocityTAS.toStringAsFixed(2);
    }
    var rateresponseThird = await RateOfClimbGraphicService.getRateByAircraft(controller.selectedAircraft.value!.id!, 3, "failure");
    if (rateresponseThird != null) {
      controller.rateGraphicThirdSegmentN1.value = rateresponseThird;
    }
    var resultrateresponseThird = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphicThirdSegmentN1.value.id!, controller.thirdSegmentN1.value.temperature!, double.parse(controller.elevationThirdSegmentN1.text), double.parse(controller.weight.text));
    if (resultrateresponseThird != null) {
      controller.resultRateThirdSegmentN1.value = resultrateresponseThird;
      controller.thirdSegmentN1.value.rateClimb = resultrateresponseThird['finalPoint']['x'];
      controller.rateOfClimbThirdSegmentN1.text = resultrateresponseThird['finalPoint']['x'].toStringAsFixed(2);
    }
    if (controller.gradient.value.dpDistance != null) {
      controller.thirdSegmentN1.value.reachDP = true;
      reachDP3 = true;

      controller.thirdSegmentN1.value.timeToDP = ((controller.gradient.value.dpDistance! - (controller.failure.value.distanceToInitial! + (controller.firstSegmentN1.value.distanceToFinish ?? 0) + (controller.secondSegmentN1.value.distanceToFinish ?? 0))) / controller.thirdSegmentN1.value.velocityTAS!) * 60;
      controller.timeToDPThirdSegmentN1.text = (((controller.gradient.value.dpDistance! - (controller.failure.value.distanceToInitial! + (controller.firstSegmentN1.value.distanceToFinish ?? 0) + (controller.secondSegmentN1.value.distanceToFinish ?? 0))) / controller.thirdSegmentN1.value.velocityTAS!) * 60).toStringAsFixed(2);

      controller.thirdSegmentN1.value.altitudeInDP = controller.thirdSegmentN1.value.timeToDP! * controller.thirdSegmentN1.value.rateClimb!;
      controller.altitudeInDPThirdSegmentN1.text = (controller.thirdSegmentN1.value.timeToDP! * controller.thirdSegmentN1.value.rateClimb!).toStringAsFixed(2);

      if (controller.failure.value.initialElevation! < controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment!) {
        controller.totalAltitudeInDPThirdSegmentN1.text = (controller.thirdSegmentN1.value.altitudeInDP! + controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment! + controller.selectedAirport.value!.elevation!).toString();
      } else {
        controller.totalAltitudeInDPThirdSegmentN1.text = (controller.thirdSegmentN1.value.altitudeInDP! + controller.failure.value.initialElevation!).toString();
      }
      var height = double.parse(controller.totalAltitudeInDPThirdSegmentN1.text);
      var distanceFeet = controller.gradient.value.dpDistance! * 6076.12;
      controller.gradient.value.finalGradient = (height / distanceFeet) * 100;
      controller.finalGradientN1.text = ((height / distanceFeet) * 100).toStringAsFixed(2);

      if (controller.gradient.value.finalGradient! > controller.gradient.value.gradientValue!) {
        controller.thirdSegmentN1.value.clearDP = true;
      } else {
        controller.thirdSegmentN1.value.clearDP = false;
      }
    }
  }
  controller.gradient.value.firstSegment = controller.firstSegmentN1.value;
  controller.gradient.value.secondSegment = controller.secondSegmentN1.value;
  controller.gradient.value.thirdSegment = controller.thirdSegmentN1.value;
  controller.failure.value.gradient = controller.gradient.value;
  controller.newProcedure.value.failure = controller.failure.value;
  controller.seeAnalysis.value = true;
  controller.loadingAnalysis.value = false;
  return {
    'reachDP1': reachDP1,
    'reachDP2': reachDP2,
    'reachDP3': reachDP3,
  };
}
