
import 'package:flutter/material.dart';
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
              if (controller.indexStepper.value == 1) {
                deleteDataSecondStep(controller);
                deleteDataThirdStep(controller);
                deleteDataFourthStep(controller);
              }
              if (controller.indexStepper.value == 2) {
                deleteDataThirdStep(controller);
                deleteDataFourthStep(controller);
              }
              if (controller.indexStepper.value == 3) {
                deleteDataFourthStep(controller);
              }
            },
            onStepContinue: () async {
              if (controller.indexStepper.value == 0) {
                final result = await calculateDataNMotors(controller);
                final reachDP1 = result['reachDP1'];
                final reachDP2 = result['reachDP2'];
                final reachDP3 = result['reachDP3'];
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
              if (controller.indexStepper.value == 0) {
                deleteDataSecondStep(controller);
                deleteDataThirdStep(controller);
                deleteDataFourthStep(controller);
              }
              if (controller.indexStepper.value == 1) {
                deleteDataThirdStep(controller);
                deleteDataFourthStep(controller);
                await calculateDataNMotors(controller);
              }
              if (controller.indexStepper.value == 2) {
                deleteDataFourthStep(controller);
                if (controller.altitudeRestriction.value == true) {
                  await calculateDataFailureAltitude(controller);
                }
                if (controller.gradientRestriction.value == true) {
                  await calculateDataFailureGradient(controller);
                }
              }
            },
            steps: getSteps(controller)
          ))
        ),
      ),
    ],
  );
}