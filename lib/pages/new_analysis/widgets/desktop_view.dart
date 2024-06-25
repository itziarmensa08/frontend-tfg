
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/services/isatable.service.dart';
import 'package:frontend_tfg/data/services/rateofclimbgraphic.service.dart';
import 'package:frontend_tfg/data/services/v2table.service.dart';
import 'package:frontend_tfg/data/services/vYtable.service.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';
import 'package:frontend_tfg/pages/new_analysis/new_analysis.controller.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/steps.dart';
import 'package:get/get.dart';

Widget desktopView(double height, BuildContext context, TickerProviderStateMixin page) {

  final NewAnalaysisController controller = Get.put(NewAnalaysisController());

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomTabBar(page: page, number: 1),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() => Stepper(
            type: StepperType.horizontal,
            currentStep: controller.indexStepper.value,
            onStepCancel: () {
              if (controller.indexStepper.value > 0) {
                controller.indexStepper.value -= 1;
              }
            },
            onStepContinue: () async {
              if (controller.indexStepper.value == 0) {

                // ---------------------- N MOTORES - 1 SEGMENTO -------------------------------------------
                controller.newProcedure.value.weight = double.parse(controller.weight.text);
                controller.newProcedure.value.dpDistance = double.parse(controller.dpDistance.text);
                controller.newProcedure.value.rwyName = controller.rwyName.text;
                controller.newProcedure.value.dpName = controller.dpName.text;
                controller.newProcedure.value.sidName = controller.sidName.text;
                var response = await V2TableService.getV2tableByAircraft(controller.selectedAircraft.value!.id!);
                if (response != null) {
                  controller.data.value = response;
                }
                var obtainedData = await V2TableService.getObtainedData(controller.selectedAircraft.value!.id!, controller.selectedAirport.value!.elevation!, double.parse(controller.weight.text), controller.selectedAirport.value!.referenceTemperature!, "V50");
                if (obtainedData != null) {
                  controller.obtainedData.value = obtainedData.dataList;
                  controller.velocityFirstSegment.text = obtainedData.velocityValue.toString();
                  controller.firstSegmentN.value.velocityIAS = obtainedData.velocityValue;
                }
                var isatableresponse = await ISATableService.getISATables();
                if (isatableresponse != null) {
                  controller.isatable.value = isatableresponse;
                }
                var obtainedDataISA = await ISATableService.getObtainedData(controller.selectedAirport.value!.elevation!);
                if (obtainedDataISA != null) {
                  controller.obtainedISAData.value = obtainedDataISA.dataList;
                  controller.densityFirstSegment.text = obtainedDataISA.densityValue.toString();
                  controller.firstSegmentN.value.density = obtainedDataISA.densityValue;
                }
                if (obtainedData != null && obtainedDataISA != null) {
                  double velocityTAS = obtainedData.velocityValue / sqrt(obtainedDataISA.densityValue);
                  controller.firstSegmentN.value.velocityTAS = velocityTAS;
                  controller.velocityFirstSegmentTAS.text = velocityTAS.toString();
                }
                var rateresponse = await RateOfClimbGraphicService.getRateByAircraft(controller.selectedAircraft.value!.id!, 1);
                if (rateresponse != null) {
                  controller.rateGraphic.value = rateresponse;
                }
                var resultrateresponse = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphic.value.id!, controller.selectedAirport.value!.referenceTemperature!, controller.selectedAirport.value!.elevation!, double.parse(controller.weight.text));
                if (resultrateresponse != null) {
                  controller.resultRate.value = resultrateresponse;
                  controller.firstSegmentN.value.rateClimb = resultrateresponse['finalPoint']['x']; // feet / minute
                  controller.rateOfClimbFirstSegment.text = resultrateresponse['finalPoint']['x'].toString();
                  controller.firstSegmentN.value.timeToFinish = (800 - 50) / resultrateresponse['finalPoint']['x']; // minutes
                  controller.timeFirstSegment.text = ((800 - 50) / resultrateresponse['finalPoint']['x']).toString();
                  if (controller.firstSegmentN.value.velocityTAS != null) {
                    controller.firstSegmentN.value.distanceToFinish = controller.firstSegmentN.value.velocityTAS! * (((800 - 50) / resultrateresponse['finalPoint']['x'])/60);
                    controller.distanceFirstSegment.text = (controller.firstSegmentN.value.velocityTAS! * (((800 - 50) / resultrateresponse['finalPoint']['x'])/60)).toString();
                  }
                }
                controller.nMotors.value.firstSegment = controller.firstSegmentN.value;

                // ---------------------- N MOTORES - 2 SEGMENTO -------------------------------------------

                var responseVY = await VYTableService.getVYtableByAircraft(controller.selectedAircraft.value!.id!);
                if (responseVY != null) {
                  controller.vYtableN.value = responseVY;
                }
                var obtainedDataVY = await VYTableService.getObtainedData(controller.selectedAircraft.value!.id!, (controller.selectedAirport.value!.elevation! + 800), double.parse(controller.weight.text));
                if (obtainedDataVY != null) {
                  controller.obtainedDataVYN.value = obtainedDataVY.dataList;
                  controller.velocitySecondSegmentN.text = obtainedDataVY.velocityValue.toString();
                  controller.secondSegmentN.value.velocityIAS = obtainedDataVY.velocityValue;
                }
                var obtainedDataISASecondSegment = await ISATableService.getObtainedData((controller.selectedAirport.value!.elevation! + 800));
                if (obtainedDataISASecondSegment != null) {
                  controller.obtainedISADataSecondSegmentN.value = obtainedDataISASecondSegment.dataList;
                  controller.densitySecondSegmentN.text = obtainedDataISASecondSegment.densityValue.toString();
                  controller.secondSegmentN.value.density = obtainedDataISASecondSegment.densityValue;
                }
                if (obtainedDataVY != null && obtainedDataISASecondSegment != null) {
                  double velocityTAS = obtainedDataVY.velocityValue / sqrt(obtainedDataISASecondSegment.densityValue);
                  controller.secondSegmentN.value.velocityTAS = velocityTAS;
                  controller.velocitySecondSegmentTASN.text = velocityTAS.toString();
                }
                var rateresponseSecondSegment = await RateOfClimbGraphicService.getRateByAircraft(controller.selectedAircraft.value!.id!, 2);
                if (rateresponseSecondSegment != null) {
                  controller.rateGraphicSecondSegmentN.value = rateresponseSecondSegment;
                }
                var resultrateresponseSecondSegment = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphicSecondSegmentN.value.id!, controller.selectedAirport.value!.referenceTemperature!, (controller.selectedAirport.value!.elevation! + 800), double.parse(controller.weight.text));
                if (resultrateresponseSecondSegment != null) {
                  controller.resultRateSecondSegmentN.value = resultrateresponseSecondSegment;
                  controller.secondSegmentN.value.rateClimb = resultrateresponseSecondSegment['finalPoint']['x'];
                  controller.rateOfClimbSecondSegmentN.text = resultrateresponseSecondSegment['finalPoint']['x'].toString();
                  controller.secondSegmentN.value.timeToFinish = (3000 - 800) / resultrateresponseSecondSegment['finalPoint']['x']; // Temps que tarda d'anar de 800ft a 3000ft
                  controller.timeSecondSegmentN.text = ((3000 - 800) / resultrateresponseSecondSegment['finalPoint']['x']).toString();
                  if (controller.secondSegmentN.value.velocityTAS != null) {
                    controller.secondSegmentN.value.distanceToFinish = controller.secondSegmentN.value.velocityTAS! * ((3000 - 800) / (resultrateresponseSecondSegment['finalPoint']['x']/60)); // Distància que recórre de 800ft a 3000ft
                    controller.distancSecondSegmentN.text = (controller.secondSegmentN.value.velocityTAS! * ((3000 - 800) / (resultrateresponseSecondSegment['finalPoint']['x']/60))).toString();
                  }
                }

                controller.nMotors.value.secondSegment = controller.secondSegmentN.value;

                // ---------------------- N MOTORES - 3 SEGMENTO -------------------------------------------

                var obtainedDataVYThirdSegment = await VYTableService.getObtainedData(controller.selectedAircraft.value!.id!, (controller.selectedAirport.value!.elevation! + 3000), double.parse(controller.weight.text));
                if (obtainedDataVYThirdSegment != null) {
                  controller.obtainedDataVYThirdSegmentN.value = obtainedDataVYThirdSegment.dataList;
                  controller.velocityThirdSegmentN.text = obtainedDataVYThirdSegment.velocityValue.toString();
                  controller.thirdSegmentN.value.velocityIAS = obtainedDataVYThirdSegment.velocityValue;
                }
                var obtainedDataISAThirdSegment = await ISATableService.getObtainedData((controller.selectedAirport.value!.elevation! + 3000));
                if (obtainedDataISAThirdSegment != null) {
                  controller.obtainedISADataThirdSegmentN.value = obtainedDataISAThirdSegment.dataList;
                  controller.densityThirdSegmentN.text = obtainedDataISAThirdSegment.densityValue.toString();
                  controller.thirdSegmentN.value.density = obtainedDataISAThirdSegment.densityValue;
                }
                if (obtainedDataVYThirdSegment != null && obtainedDataISAThirdSegment != null) {
                  double velocityTAS = obtainedDataVYThirdSegment.velocityValue / sqrt(obtainedDataISAThirdSegment.densityValue);
                  controller.thirdSegmentN.value.velocityTAS = velocityTAS;
                  controller.velocityThirdSegmentTASN.text = velocityTAS.toString();
                }
                if (controller.selectedAircraft.value?.metro == 'SA227AC 16000' || controller.selectedAircraft.value?.metro == 'SA227AC' || controller.selectedAircraft.value?.metro == 'SA227BC') {
                  var rateresponseThirdSegment = await RateOfClimbGraphicService.getRateByAircraft(controller.selectedAircraft.value!.id!, 2);
                  if (rateresponseThirdSegment != null) {
                    controller.rateGraphicThirdSegmentN.value = rateresponseThirdSegment;
                  }
                  var resultrateresponseThirdSegment = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphicThirdSegmentN.value.id!, controller.selectedAirport.value!.referenceTemperature!, (controller.selectedAirport.value!.elevation! + 3000), double.parse(controller.weight.text));
                  if (resultrateresponseThirdSegment != null) {
                    controller.resultRateThirdSegmentN.value = resultrateresponseThirdSegment;
                    controller.thirdSegmentN.value.rateClimb = resultrateresponseThirdSegment['finalPoint']['x'];
                    controller.rateOfClimbSecondSegmentN.text = resultrateresponseThirdSegment['finalPoint']['x'].toString();
                    controller.secondSegmentN.value.timeToFinish = (3000 - 800) / resultrateresponseThirdSegment['finalPoint']['x']; // Temps que tarda d'anar de 3000ft
                    controller.timeSecondSegmentN.text = ((3000 - 800) / resultrateresponseThirdSegment['finalPoint']['x']).toString();
                    if (controller.secondSegmentN.value.velocityTAS != null) {
                      controller.secondSegmentN.value.distanceToFinish = controller.secondSegmentN.value.velocityTAS! * (3000 - 800) / resultrateresponseThirdSegment['finalPoint']['x']; // Distància que recórre de 800ft a 3000ft
                      controller.distancSecondSegmentN.text = (controller.secondSegmentN.value.velocityTAS! * (3000 - 800) / resultrateresponseThirdSegment['finalPoint']['x']).toString();
                    }
                  }

                  controller.nMotors.value.secondSegment = controller.secondSegmentN.value;
                } else {
                  // -------------------------- RATE OF CLIMB SECCTION 6 FOR SA226 -----------------------
                }

                controller.newProcedure.value.nMotors = controller.nMotors.value;

              } else if (controller.indexStepper.value == 1) {
                var obtainedData = await V2TableService.getObtainedData(controller.selectedAircraft.value!.id!, controller.selectedAirport.value!.elevation!, double.parse(controller.weight.text), controller.selectedAirport.value!.referenceTemperature!, "V2");
                if (obtainedData != null) {
                  controller.obtainedDataN1.value = obtainedData.dataList;
                  controller.velocityFirstSegmentN1.text = obtainedData.velocityValue.toString();
                  //FirstSegment firstSegment = FirstSegment(velocityIAS: obtainedData.velocityValue);
                  //controller.newProcedure.value.firstSegment = firstSegment;
                }

              }
              final isLastSteo = controller.indexStepper.value == getSteps(controller).length - 1;
              if (isLastSteo) {
                print('completed');
              } else {
                controller.indexStepper.value += 1;
              }
            },
            onStepTapped: (int index) async {
              controller.indexStepper.value = index;
            },
            steps: getSteps(controller)
          ))
        ),
      ),
    ],
  );
}