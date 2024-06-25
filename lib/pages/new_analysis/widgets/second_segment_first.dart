import 'package:flutter/material.dart';
import 'package:frontend_tfg/pages/new_analysis/new_analysis.controller.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/isa_table.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/rate_chart.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/vy_table.dart';
import 'package:get/get.dart';

class SecondSegmentFirstStep extends StatelessWidget {
  SecondSegmentFirstStep({super.key});

  final controller = Get.put(NewAnalaysisController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('reviewDataSecondSegment'.tr, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextFormField(
                controller: controller.elevation,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'elevation'.tr,
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
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: controller.weight,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'weight'.tr,
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
        Center(child: Obx(() => VyTable(table: controller.vYtableN.value, obtainedData: controller.obtainedDataVYN))),
        const SizedBox(height: 50),
        Row(
          children: [
            Text('finalVelocityIAS'.tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: controller.velocitySecondSegmentN,
                onChanged: (value) {
                  controller.secondSegmentN.value.velocityIAS = double.parse(value);
                  controller.nMotors.value.secondSegment = controller.secondSegmentN.value;
                  controller.newProcedure.value.nMotors = controller.nMotors.value;
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
        Center(child: Obx(() => ISATable(table: controller.isatable.value, obtainedData: controller.obtainedISADataSecondSegmentN))),
        const SizedBox(height: 50),
        Row(
          children: [
            Text('finalDensity'.tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: controller.densitySecondSegmentN,
                onChanged: (value) {
                  controller.secondSegmentN.value.density = double.parse(value);
                  controller.nMotors.value.secondSegment = controller.secondSegmentN.value;
                  controller.newProcedure.value.nMotors = controller.nMotors.value;
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
                controller: controller.velocitySecondSegmentTASN,
                onChanged: (value) {
                  controller.secondSegmentN.value.velocityTAS = double.parse(value);
                  controller.nMotors.value.secondSegment = controller.secondSegmentN.value;
                  controller.newProcedure.value.nMotors = controller.nMotors.value;
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
        Center(child: Obx(() => RateChart(rateGraphic: controller.rateGraphicSecondSegmentN.value, resultRate: controller.resultRateSecondSegmentN))),
        const SizedBox(height: 50),
        Row(
          children: [
            Text('finalRateOfClimb'.tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: controller.rateOfClimbSecondSegmentN,
                onChanged: (value) {
                  controller.secondSegmentN.value.rateClimb = double.parse(value);
                  controller.nMotors.value.secondSegment = controller.secondSegmentN.value;
                  controller.newProcedure.value.nMotors = controller.nMotors.value;
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
                controller: controller.timeSecondSegmentN,
                onChanged: (value) {
                  controller.secondSegmentN.value.timeToFinish = double.parse(value);
                  controller.nMotors.value.secondSegment = controller.secondSegmentN.value;
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
            Text('distanceFirstSegment'.tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: controller.distancSecondSegmentN,
                onChanged: (value) {
                  controller.secondSegmentN.value.distanceToFinish = double.parse(value);
                  controller.nMotors.value.secondSegment = controller.secondSegmentN.value;
                  controller.newProcedure.value.nMotors = controller.nMotors.value;
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
          if (controller.secondSegmentN.value.distanceToFinish != null && controller.firstSegmentN.value.distanceToFinish != null && controller.newProcedure.value.dpDistance != null) {
            if ((controller.secondSegmentN.value.distanceToFinish! + controller.firstSegmentN.value.distanceToFinish!) < controller.newProcedure.value.dpDistance!) {
              controller.secondSegmentN.value.reachDP = false;
              return Text('noArrive'.tr, style: Theme.of(context).textTheme.titleMedium);
            } else {
              controller.secondSegmentN.value.reachDP = true;
              // Temps que tarda desde 800 ft fins al descision point
              controller.secondSegmentN.value.timeToDP = (controller.newProcedure.value.dpDistance! - controller.firstSegmentN.value.distanceToFinish!) / (controller.secondSegmentN.value.velocityTAS! * 60);
              controller.timeToDPSecondSegmentN.text = ((controller.newProcedure.value.dpDistance! - controller.firstSegmentN.value.distanceToFinish!) / controller.secondSegmentN.value.velocityTAS!).toString();

              // Altitud desde 800ft fins al decision point
              controller.secondSegmentN.value.altitudeInDP = controller.secondSegmentN.value.timeToDP! * controller.secondSegmentN.value.rateClimb!;
              controller.altitudeInDPFirstSegment.text = (controller.secondSegmentN.value.timeToDP! * controller.secondSegmentN.value.rateClimb!).toString();

              if ((controller.secondSegmentN.value.altitudeInDP! + 800 + controller.selectedAirport.value!.elevation!) > controller.newProcedure.value.dpAltitude!) {
                controller.secondSegmentN.value.clearDP = true;
              } else {
                controller.secondSegmentN.value.clearDP = false;
              }

              controller.nMotors.value.secondSegment = controller.secondSegmentN.value;
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
                          controller: controller.timeToDPSecondSegmentN,
                          onChanged: (value) {
                            controller.secondSegmentN.value.timeToDP = double.parse(value);
                            controller.nMotors.value.secondSegment = controller.secondSegmentN.value;
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
                          controller: controller.altitudeInDPSecondSegmentN,
                          onChanged: (value) {
                            controller.secondSegmentN.value.altitudeInDP = double.parse(value);
                            controller.nMotors.value.secondSegment = controller.secondSegmentN.value;
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
          if (controller.secondSegmentN.value.clearDP == true && controller.secondSegmentN.value.reachDP == true) {
            return Text('clearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.green));
          } else if (controller.secondSegmentN.value.clearDP == false && controller.secondSegmentN.value.reachDP == true) {
            return Text('noClearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red));
          } else {
            return Container();
          }
        })
      ],
    );
  }
}