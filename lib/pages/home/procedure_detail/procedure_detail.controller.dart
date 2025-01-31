import 'package:frontend_tfg/data/models/aircraft_model.dart';
import 'package:frontend_tfg/data/models/airport_model.dart';
import 'package:frontend_tfg/data/models/isatable.model.dart';
import 'package:frontend_tfg/data/models/procedure.model.dart';
import 'package:frontend_tfg/data/models/rateofclimbgraphic.model.dart';
import 'package:frontend_tfg/data/models/v2table.model.dart';
import 'package:frontend_tfg/data/models/vytable.model.dart';
import 'package:get/get.dart';

class ProcedureDetailController extends GetxController {

  Rx<AirportModel> airport = AirportModel().obs;
  Rx<AircraftModel> aircraft = AircraftModel().obs;
  Rx<Procedure> procedure = Procedure().obs;

  RxBool v2First = RxBool(false);
  RxBool isaFirst = RxBool(false);
  RxBool rateFirst = RxBool(false);
  RxBool v2Second = RxBool(false);
  RxBool isaSecond = RxBool(false);
  RxBool rateSecond = RxBool(false);
  RxBool v2Third = RxBool(false);
  RxBool isaThird = RxBool(false);
  RxBool rateThird = RxBool(false);

  final Rx<V2TableModel> v2TableFirst = V2TableModel().obs;
  final RxList<V2TableRowData> obtainedDatav2TableFirst = RxList<V2TableRowData>();

  final Rx<ISATableModel> isatable = ISATableModel().obs;
  final RxList<ISATableData> obtainedISADataFirst = RxList<ISATableData>();

  final Rx<RateOfClimbGraphic> rateGraphicFirst = RateOfClimbGraphic().obs;
  final RxMap<String, dynamic> resultRateFirst = <String, dynamic>{}.obs;

  final Rx<VYTableModel> vYtableN = VYTableModel().obs;
  final RxList<VYtableRowsPressures> obtainedDataVYN = RxList<VYtableRowsPressures>();

  final RxList<ISATableData> obtainedISADataSecond = RxList<ISATableData>();

  final Rx<RateOfClimbGraphic> rateGraphicSecond = RateOfClimbGraphic().obs;
  final RxMap<String, dynamic> resultRateSecond = <String, dynamic>{}.obs;

  final RxList<VYtableRowsPressures> obtainedDataVYNThird = RxList<VYtableRowsPressures>();

  final RxList<ISATableData> obtainedISADataThird = RxList<ISATableData>();

  final Rx<RateOfClimbGraphic> rateGraphicThird = RateOfClimbGraphic().obs;
  final RxMap<String, dynamic> resultRateThird = <String, dynamic>{}.obs;

}