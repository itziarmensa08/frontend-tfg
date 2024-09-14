
import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/aircraft_model.dart';
import 'package:frontend_tfg/data/models/airport_model.dart';
import 'package:frontend_tfg/data/models/gradientgraphic.model.dart';
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
