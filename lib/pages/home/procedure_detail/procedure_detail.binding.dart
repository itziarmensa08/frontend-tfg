

import 'package:frontend_tfg/data/services/isatable.service.dart';
import 'package:frontend_tfg/data/services/rateofclimbgraphic.service.dart';
import 'package:frontend_tfg/data/services/v2table.service.dart';
import 'package:frontend_tfg/data/services/vYtable.service.dart';
import 'package:frontend_tfg/pages/home/procedure_detail/procedure_detail.controller.dart';
import 'package:get/get.dart';

class ProcedureDetailBinding implements Bindings {
  @override
  Future<void> dependencies() async {

    final ProcedureDetailController controller = Get.put(ProcedureDetailController());

    var response = await V2TableService.getV2tableByAircraft(controller.aircraft.value.id!);
    if (response != null) {
      controller.v2TableFirst.value = response;
    }

    var obtainedData = await V2TableService.getObtainedData(controller.aircraft.value.id!, controller.airport.value.elevation!, controller.procedure.value.weight!, controller.procedure.value.nMotors!.firstSegment!.temperature!, "V50");
    if (obtainedData != null) {
      controller.obtainedDatav2TableFirst.value = obtainedData.dataList;
    }

    var rateresponse = await RateOfClimbGraphicService.getRateByAircraft(controller.aircraft.value.id!, 1, 'nMotors');
    if (rateresponse != null) {
      controller.rateGraphicFirst.value = rateresponse;
    }

    var resultrateresponse = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphicFirst.value.id!, controller.procedure.value.nMotors!.firstSegment!.temperature!, controller.airport.value.elevation!, controller.procedure.value.weight!);
    if (resultrateresponse != null) {
      controller.resultRateFirst.value = resultrateresponse;
    }

    var isatableresponse = await ISATableService.getISATables();
    if (isatableresponse != null) {
      controller.isatable.value = isatableresponse;
    }

    var obtainedDataISA = await ISATableService.getObtainedData(controller.airport.value.elevation!);
    if (obtainedDataISA != null) {
      controller.obtainedISADataFirst.value = obtainedDataISA.dataList;
    }

    var responseVY = await VYTableService.getVYtableByAircraft(controller.aircraft.value.id!, "nMotors");
    if (responseVY != null) {
      controller.vYtableN.value = responseVY;
    }

    var obtainedDataVY = await VYTableService.getObtainedData(controller.aircraft.value.id!, (controller.airport.value.elevation! + controller.aircraft.value.profile!.nMotors!.heightFirstSegment!), controller.procedure.value.weight!, "nMotors");
    if (obtainedDataVY != null) {
      controller.obtainedDataVYN.value = obtainedDataVY.dataList;
    }

    var obtainedDataISASecondSegment = await ISATableService.getObtainedData((controller.airport.value.elevation! + controller.aircraft.value.profile!.nMotors!.heightFirstSegment!));
    if (obtainedDataISASecondSegment != null) {
      controller.obtainedISADataSecond.value = obtainedDataISASecondSegment.dataList;
    }

    var rateresponseSecondSegment = await RateOfClimbGraphicService.getRateByAircraft(controller.aircraft.value.id!, 2, 'nMotors');
    if (rateresponseSecondSegment != null) {
      controller.rateGraphicSecond.value = rateresponseSecondSegment;
    }
    var resultrateresponseSecondSegment = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphicSecond.value.id!, controller.procedure.value.nMotors!.secondSegment!.temperature!, (controller.airport.value.elevation! + controller.aircraft.value.profile!.nMotors!.heightFirstSegment!), controller.procedure.value.weight!);
    if (resultrateresponseSecondSegment != null) {
      controller.resultRateSecond.value = resultrateresponseSecondSegment;
    }

    var obtainedDataVYThirdSegment = await VYTableService.getObtainedData(controller.aircraft.value.id!, (controller.airport.value.elevation! + controller.aircraft.value.profile!.nMotors!.heightSecondSegment!), controller.procedure.value.weight!, "nMotors");
    if (obtainedDataVYThirdSegment != null) {
      controller.obtainedDataVYNThird.value = obtainedDataVYThirdSegment.dataList;
    }

    var obtainedDataISAThirdSegment = await ISATableService.getObtainedData((controller.airport.value.elevation! + controller.aircraft.value.profile!.nMotors!.heightSecondSegment!));
    if (obtainedDataISAThirdSegment != null) {
      controller.obtainedISADataThird.value = obtainedDataISAThirdSegment.dataList;
    }

    var rateresponseThirdSegment = await RateOfClimbGraphicService.getRateByAircraft(controller.aircraft.value.id!, 2, 'nMotors');
    if (rateresponseThirdSegment != null) {
      controller.rateGraphicThird.value = rateresponseThirdSegment;
    }
    var resultrateresponseThirdSegment = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphicThird.value.id!, controller.procedure.value.nMotors!.thirdSegment!.temperature!, (controller.airport.value.elevation! + controller.aircraft.value.profile!.nMotors!.heightSecondSegment!), controller.procedure.value.weight!);
    if (resultrateresponseThirdSegment != null) {
      controller.resultRateThird.value = resultrateresponseThirdSegment;
    }

  }
}