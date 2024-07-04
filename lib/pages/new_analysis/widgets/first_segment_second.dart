import 'package:flutter/material.dart';
import 'package:frontend_tfg/pages/new_analysis/new_analysis.controller.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/isa_table.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/rate_chart.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/v2_table.dart';
import 'package:get/get.dart';

class FirstSegmentSecondStep extends StatelessWidget {
  FirstSegmentSecondStep({super.key});

  final controller = Get.put(NewAnalaysisController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Obx(() {
          if (controller.obtainedDataN1.isNotEmpty) {
            return SpeedTable(table: controller.data.value, obtainedData: controller.obtainedDataN1);
          } else {
            return const LinearProgressIndicator();
          }
        })),
        const SizedBox(height: 50),
        Row(
          children: [
            Text('finalVelocityIAS'.tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: controller.velocityFirstSegmentN1,
                onChanged: (value) {
                  controller.firstSegmentN1.value.velocityIAS = double.parse(value);
                  controller.failure.value.firstSegment = controller.firstSegmentN1.value;
                  controller.newProcedure.value.failure = controller.failure.value;
                },
                decoration: InputDecoration(
                  labelText: 'velocity'.tr,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 50),
        Center(child: Obx(() {
          if (controller.obtainedISADataFirstSegmentN1.isNotEmpty) {
            return ISATable(table: controller.isatable.value, obtainedData: controller.obtainedISADataFirstSegmentN1);
          } else {
            return const LinearProgressIndicator();
          }
        })),
        const SizedBox(height: 50),
        Row(
          children: [
            Text('finalDensity'.tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: controller.densityFirstSegmentN1,
                onChanged: (value) {
                  controller.firstSegmentN1.value.density = double.parse(value);
                  controller.failure.value.firstSegment = controller.firstSegmentN1.value;
                  controller.newProcedure.value.failure = controller.failure.value;
                },
                decoration: InputDecoration(
                  labelText: 'density'.tr,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 50),
        Row(
          children: [
            Text('finalVelocityTAS'.tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: controller.velocityFirstSegmentTASN1,
                onChanged: (value) {
                  controller.firstSegmentN1.value.velocityTAS = double.parse(value);
                  controller.failure.value.firstSegment = controller.firstSegmentN1.value;
                  controller.newProcedure.value.failure = controller.failure.value;
                },
                decoration: InputDecoration(
                  labelText: 'velocity'.tr,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 50),
        Center(child: Obx(() {
          if (controller.resultRateFirstSegmentN1.isNotEmpty) {
            return RateChart(rateGraphic: controller.rateGraphicFirstSegmentN1.value, resultRate: controller.resultRateFirstSegmentN1);
          } else {
            return const LinearProgressIndicator();
          }
        })),
        const SizedBox(height: 50),
        Row(
          children: [
            Text('finalRateOfClimb'.tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: controller.rateOfClimbFirstSegmentN1,
                onChanged: (value) {
                  controller.firstSegmentN1.value.rateClimb = double.parse(value);
                  controller.failure.value.firstSegment = controller.firstSegmentN1.value;
                  controller.newProcedure.value.failure = controller.failure.value;
                },
                decoration: InputDecoration(
                  labelText: 'rateOfClimb'.tr,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 50),
        Row(
          children: [
            Text('timeFirstSegment'.tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: controller.timeFirstSegmentN1,
                onChanged: (value) {
                  controller.firstSegmentN1.value.timeToFinish = double.parse(value);
                  controller.failure.value.firstSegment = controller.firstSegmentN1.value;
                  controller.newProcedure.value.failure = controller.failure.value;
                },
                decoration: InputDecoration(
                  labelText: 'time'.tr,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 50),
        Row(
          children: [
            Text('distanceFirstSegment'.tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: controller.distanceFirstSegmentN1,
                onChanged: (value) {
                  controller.firstSegmentN1.value.distanceToFinish = double.parse(value);
                  controller.failure.value.firstSegment = controller.firstSegmentN1.value;
                  controller.newProcedure.value.failure = controller.failure.value;
                },
                decoration: InputDecoration(
                  labelText: 'distance'.tr,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 50),
        Obx(() {
          if (controller.firstSegmentN1.value.distanceToFinish != null && controller.newProcedure.value.dpDistance != null) {
            if (controller.firstSegmentN1.value.distanceToFinish! < controller.newProcedure.value.dpDistance!) {
              controller.firstSegmentN1.value.reachDP = false;
              return Text('noArrive'.tr, style: Theme.of(context).textTheme.titleMedium);
            } else {
              controller.firstSegmentN1.value.reachDP = true;
              controller.firstSegmentN1.value.timeToDP = controller.newProcedure.value.dpDistance! / (controller.firstSegmentN.value.velocityTAS! * 60);
              controller.timeToDPFirstSegment.text = (controller.newProcedure.value.dpDistance! / (controller.firstSegmentN.value.velocityTAS! * 60)).toString();

              controller.firstSegmentN.value.altitudeInDP = controller.firstSegmentN.value.timeToDP! * controller.firstSegmentN.value.rateClimb!;
              controller.altitudeInDPFirstSegment.text = (controller.firstSegmentN.value.timeToDP! * controller.firstSegmentN.value.rateClimb!).toString();

              if ((controller.firstSegmentN.value.altitudeInDP! + controller.selectedAirport.value!.elevation!) > controller.newProcedure.value.dpAltitude!) {
                controller.firstSegmentN.value.clearDP = true;
              } else {
                controller.firstSegmentN.value.clearDP = false;
              }

              controller.nMotors.value.firstSegment = controller.firstSegmentN.value;
              controller.newProcedure.value.nMotors = controller.nMotors.value;

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('yesArrive'.tr, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      Text('timeToDP'.tr, style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                          controller: controller.timeToDPFirstSegment,
                          onChanged: (value) {
                            controller.firstSegmentN.value.timeToDP = double.parse(value);
                            controller.nMotors.value.firstSegment = controller.firstSegmentN.value;
                            controller.newProcedure.value.nMotors = controller.nMotors.value;
                          },
                          decoration: InputDecoration(
                            labelText: 'time'.tr,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      Text('altitudeInDP'.tr, style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                          controller: controller.altitudeInDPFirstSegment,
                          onChanged: (value) {
                            controller.firstSegmentN.value.altitudeInDP = double.parse(value);
                            controller.nMotors.value.firstSegment = controller.firstSegmentN.value;
                            controller.newProcedure.value.nMotors = controller.nMotors.value;
                          },
                          decoration: InputDecoration(
                            labelText: 'altitude'.tr,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
          } else {
            return const LinearProgressIndicator();
          }
        }),
        const SizedBox(height: 50),
        Obx(() {
          if (controller.firstSegmentN.value.clearDP == true && controller.firstSegmentN.value.reachDP == true) {
            return Text('clearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.green));
          } else if (controller.firstSegmentN.value.clearDP == false && controller.firstSegmentN.value.reachDP == true) {
            return Text('noClearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red));
          } else {
            return Container();
          }
        })
      ],
    );
  }
}