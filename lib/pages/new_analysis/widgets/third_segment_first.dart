import 'package:flutter/material.dart';
import 'package:frontend_tfg/pages/new_analysis/new_analysis.controller.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/isa_table.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/rate_chart.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/vy_table.dart';
import 'package:get/get.dart';

class ThirdSegmentFirstStep extends StatelessWidget {
  ThirdSegmentFirstStep({super.key});

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
        Center(child: Obx(() => VyTable(table: controller.vYtableN.value, obtainedData: controller.obtainedDataVYThirdSegmentN))),
        const SizedBox(height: 50),
        Row(
          children: [
            Text('finalVelocityIAS'.tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: controller.velocityThirdSegmentN,
                onChanged: (value) {
                  controller.thirdSegmentN.value.velocityIAS = double.parse(value);
                  controller.nMotors.value.thirdSegment = controller.thirdSegmentN.value;
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
        Center(child: Obx(() => ISATable(table: controller.isatable.value, obtainedData: controller.obtainedISADataThirdSegmentN))),
        const SizedBox(height: 50),
        Row(
          children: [
            Text('finalDensity'.tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: controller.densityThirdSegmentN,
                onChanged: (value) {
                  controller.thirdSegmentN.value.density = double.parse(value);
                  controller.nMotors.value.thirdSegment = controller.thirdSegmentN.value;
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
                controller: controller.velocityThirdSegmentTASN,
                onChanged: (value) {
                  controller.thirdSegmentN.value.velocityTAS = double.parse(value);
                  controller.nMotors.value.thirdSegment = controller.thirdSegmentN.value;
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
        Center(child: Obx(() => RateChart(rateGraphic: controller.rateGraphicSecondSegmentN.value, resultRate: controller.resultRateThirdSegmentN))),
        const SizedBox(height: 50),
        Row(
          children: [
            Text('finalRateOfClimb'.tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: controller.rateOfClimbThirdSegmentN,
                onChanged: (value) {
                  controller.thirdSegmentN.value.rateClimb = double.parse(value);
                  controller.nMotors.value.thirdSegment = controller.thirdSegmentN.value;
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
        Obx(() {
          if (controller.newProcedure.value.dpDistance != null) {
            controller.thirdSegmentN.value.reachDP = true;
            controller.thirdSegmentN.value.timeToDP = ((controller.newProcedure.value.dpDistance! - (controller.firstSegmentN.value.distanceToFinish! + controller.secondSegmentN.value.distanceToFinish!)) / controller.thirdSegmentN.value.velocityTAS!) * 60;
            controller.timeToDPThirdSegmentN.text = (((controller.newProcedure.value.dpDistance! - (controller.firstSegmentN.value.distanceToFinish! + controller.secondSegmentN.value.distanceToFinish!)) / controller.thirdSegmentN.value.velocityTAS!) * 60).toString();

            controller.thirdSegmentN.value.altitudeInDP = controller.thirdSegmentN.value.timeToDP! * controller.thirdSegmentN.value.rateClimb!;
            controller.altitudeInDPThirdSegmentN.text = (controller.thirdSegmentN.value.timeToDP! * controller.thirdSegmentN.value.rateClimb!).toString();
            controller.totalAltitudeInDPThirdSegmentN.text = (controller.thirdSegmentN.value.timeToDP! * controller.thirdSegmentN.value.rateClimb! + 3000 + controller.selectedAirport.value!.elevation!).toString();


            if ((controller.thirdSegmentN.value.timeToDP! * controller.thirdSegmentN.value.rateClimb! + 3000 + controller.selectedAirport.value!.elevation!) > controller.newProcedure.value.dpAltitude!) {
              controller.thirdSegmentN.value.clearDP = true;
            } else {
              controller.thirdSegmentN.value.clearDP = false;
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('timeToDP'.tr, style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        controller: controller.timeToDPThirdSegmentN,
                        onChanged: (value) {
                          controller.thirdSegmentN.value.timeToDP = double.parse(value);
                          controller.nMotors.value.thirdSegment = controller.thirdSegmentN.value;
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
                        controller: controller.altitudeInDPThirdSegmentN,
                        onChanged: (value) {
                          controller.thirdSegmentN.value.altitudeInDP = double.parse(value);
                          controller.nMotors.value.thirdSegment = controller.thirdSegmentN.value;
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
                const SizedBox(height: 50),
                  Row(
                    children: [
                      Text('totalAltitudeInDP'.tr, style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                          controller: controller.totalAltitudeInDPThirdSegmentN,
                          onChanged: (value) {

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
          } else {
            return const CircularProgressIndicator();
          }
        }),
        const SizedBox(height: 50),
        Obx(() {
          if (controller.thirdSegmentN.value.clearDP == true && controller.thirdSegmentN.value.reachDP == true) {
            return Text('clearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.green));
          } else if (controller.thirdSegmentN.value.clearDP == false && controller.thirdSegmentN.value.reachDP == true) {
            return Text('noClearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red));
          } else {
            return Container();
          }
        })
      ],
    );
  }
}