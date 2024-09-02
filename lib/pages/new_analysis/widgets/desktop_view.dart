
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/services/isatable.service.dart';
import 'package:frontend_tfg/data/services/rateofclimbgraphic.service.dart';
import 'package:frontend_tfg/data/services/v2table.service.dart';
import 'package:frontend_tfg/data/services/vYtable.service.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';
import 'package:frontend_tfg/pages/new_analysis/new_analysis.controller.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/first_segment_first.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/second_segment_first.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/steps.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/third_segment_first.dart';
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
                controller.loadingAnalysisN.value = true;

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
                var resultrateresponse = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphic.value.id!, controller.selectedAirport.value!.referenceTemperature!, controller.selectedAirport.value!.elevation!, double.parse(controller.weight.text));
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
                    controller.firstSegmentN.value.timeToDP = controller.newProcedure.value.dpDistance! / (controller.firstSegmentN.value.velocityTAS! * 60);
                    controller.timeToDPFirstSegment.text = (controller.newProcedure.value.dpDistance! / (controller.firstSegmentN.value.velocityTAS! * 60)).toStringAsFixed(2);

                    controller.firstSegmentN.value.altitudeInDP = controller.firstSegmentN.value.timeToDP! * controller.firstSegmentN.value.rateClimb!;
                    controller.altitudeInDPFirstSegment.text = (controller.firstSegmentN.value.timeToDP! * controller.firstSegmentN.value.rateClimb!).toStringAsFixed(2);
                    controller.totalAltitudeInDPFirstSegmentN.text = (controller.firstSegmentN.value.timeToDP! * controller.firstSegmentN.value.rateClimb! + controller.selectedAirport.value!.elevation!).toStringAsFixed(2);
                    controller.initialElevation.text = (controller.firstSegmentN.value.timeToDP! * controller.firstSegmentN.value.rateClimb!).toStringAsFixed(2);
                    controller.failure.value.initialElevation = controller.firstSegmentN.value.timeToDP! * controller.firstSegmentN.value.rateClimb!;

                    if ((controller.firstSegmentN.value.altitudeInDP! + controller.selectedAirport.value!.elevation!) > controller.newProcedure.value.dpAltitude!) {
                      controller.firstSegmentN.value.clearDP = true;
                    } else {
                      controller.firstSegmentN.value.clearDP = false;
                    }
                  }
                }
                controller.nMotors.value.firstSegment = controller.firstSegmentN.value;

                // ---------------------- N MOTORES - 2 SEGMENTO -------------------------------------------

                controller.elevationSecondSegmentN.text = (controller.selectedAirport.value!.elevation! + controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment!).toString();

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
                  var resultrateresponseSecondSegment = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphicSecondSegmentN.value.id!, controller.selectedAirport.value!.referenceTemperature!, (controller.selectedAirport.value!.elevation! + controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment!), double.parse(controller.weight.text));
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
                      controller.initialElevation.text = (controller.secondSegmentN.value.timeToDP! * controller.secondSegmentN.value.rateClimb! + controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment!).toStringAsFixed(2);
                      controller.failure.value.initialElevation = controller.secondSegmentN.value.timeToDP! * controller.secondSegmentN.value.rateClimb! + controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment!;

                      if ((controller.secondSegmentN.value.altitudeInDP! + controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment! + controller.selectedAirport.value!.elevation!) > controller.newProcedure.value.dpAltitude!) {
                        controller.secondSegmentN.value.clearDP = true;
                      } else {
                        controller.secondSegmentN.value.clearDP = false;
                      }
                    }
                  }

                  controller.nMotors.value.secondSegment = controller.secondSegmentN.value;
                }

                // ---------------------- N MOTORES - 3 SEGMENTO -------------------------------------------

                controller.elevationThirdSegmentN.text = (controller.selectedAirport.value!.elevation! + controller.selectedAircraft.value!.profile!.nMotors!.heightSecondSegment!).toString();

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
                    var resultrateresponseThirdSegment = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphicThirdSegmentN.value.id!, controller.selectedAirport.value!.referenceTemperature!, (controller.selectedAirport.value!.elevation! + controller.selectedAircraft.value!.profile!.nMotors!.heightSecondSegment!), double.parse(controller.weight.text));
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
                    controller.initialElevation.text = (controller.thirdSegmentN.value.timeToDP! * controller.thirdSegmentN.value.rateClimb! + controller.selectedAircraft.value!.profile!.nMotors!.heightSecondSegment!).toStringAsFixed(2);
                    controller.failure.value.initialElevation = controller.thirdSegmentN.value.timeToDP! * controller.thirdSegmentN.value.rateClimb! + controller.selectedAircraft.value!.profile!.nMotors!.heightSecondSegment!;


                    if ((controller.thirdSegmentN.value.timeToDP! * controller.thirdSegmentN.value.rateClimb! + controller.selectedAircraft.value!.profile!.nMotors!.heightSecondSegment! + controller.selectedAirport.value!.elevation!) > controller.newProcedure.value.dpAltitude!) {
                      controller.thirdSegmentN.value.clearDP = true;
                    } else {
                      controller.thirdSegmentN.value.clearDP = false;
                    }
                  }
                  controller.nMotors.value.thirdSegment = controller.thirdSegmentN.value;
                }
                controller.newProcedure.value.nMotors = controller.nMotors.value;
                controller.itemsNMotors.clear();
                if (reachDP1 == true) {
                  controller.itemsNMotors.add(Item(
                      headerValue: 'segment1'.tr,
                      body: FirstSegmentFirstStep()
                  ));
                } else if (reachDP1 == false && reachDP2 == true) {
                  controller.itemsNMotors.add(Item(
                      headerValue: 'segment1'.tr,
                      body: FirstSegmentFirstStep()
                  ));
                  controller.itemsNMotors.add(Item(
                      headerValue: 'segment2'.tr,
                      body: SecondSegmentFirstStep()
                  ));
                } else if (reachDP1 == false && reachDP2 == false && reachDP3 == true) {
                  controller.itemsNMotors.add(Item(
                      headerValue: 'segment1'.tr,
                      body: FirstSegmentFirstStep()
                  ));
                  controller.itemsNMotors.add(Item(
                      headerValue: 'segment2'.tr,
                      body: SecondSegmentFirstStep()
                  ));
                  controller.itemsNMotors.add(Item(
                      headerValue: 'segment3'.tr,
                      body: ThirdSegmentFirstStep()
                  ));
                }
                controller.loadingAnalysisN.value = false;

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