
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/procedure.model.dart';
import 'package:frontend_tfg/data/services/isatable.service.dart';
import 'package:frontend_tfg/data/services/v2table.service.dart';
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
                var response = await V2TableService.getV2tableByAircraft(controller.selectedAircraft.value!.id!);
                if (response != null) {
                  controller.data.value = response;
                }
                var obtainedData = await V2TableService.getObtainedData(controller.selectedAircraft.value!.id!, controller.selectedAirport.value!.elevation!, double.parse(controller.weight.text), controller.selectedAirport.value!.referenceTemperature!, "V50");
                if (obtainedData != null) {
                  controller.obtainedData.value = obtainedData.dataList;
                  controller.velocityFirstSegment.text = obtainedData.velocityValue.toString();
                  FirstSegment firstSegment = FirstSegment(velocityIAS: obtainedData.velocityValue);
                  controller.newProcedure.value.firstSegment = firstSegment;
                }
                var isatableresponse = await ISATableService.getISATables();
                if (isatableresponse != null) {
                  controller.isatable.value = isatableresponse;
                }
                var obtainedDataISA = await ISATableService.getObtainedData(controller.selectedAirport.value!.elevation!);
                if (obtainedDataISA != null) {
                  controller.obtainedISAData.value = obtainedDataISA.dataList;
                  controller.densityFirstSegment.text = obtainedDataISA.densityValue.toString();
                  controller.newProcedure.value.firstSegment!.density = obtainedDataISA.densityValue;
                  print('Procedure First segment final: ${controller.newProcedure.value.toJson()}');
                }
                if (obtainedData != null && obtainedDataISA != null) {
                  double velocityTAS = obtainedData.velocityValue / sqrt(obtainedDataISA.densityValue);
                  controller.newProcedure.value.firstSegment!.velocityTAS = velocityTAS;
                  controller.velocityFirstSegmentTAS.text = velocityTAS.toString();
                }
              }
              final isLastSteo = controller.indexStepper.value == getSteps(controller).length - 1;
              if (isLastSteo) {
                print('completed');
              } else {
                controller.indexStepper.value += 1;
              }
            },
            onStepTapped: (int index) {
              controller.indexStepper.value = index;
            },
            steps: getSteps(controller)
          ))
        ),
      ),
    ],
  );
}