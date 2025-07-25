import 'package:flutter/material.dart';
import 'package:frontend_tfg/pages/new_analysis/new_analysis.controller.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/gradient_chart.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/isa_table.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/rate_chart_gradient.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/vx_table.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/vyse_table.dart';
import 'package:get/get.dart';

class SecondSegmentSecondStepAltitude extends StatelessWidget {
  SecondSegmentSecondStepAltitude({super.key});

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
                controller: controller.elevationSecondSegmentN1,
                readOnly: true,
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
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: TextEditingController(text: controller.secondSegmentN1.value.temperature!.toStringAsFixed(2)),
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'referenceTemperature'.tr,
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
        if (controller.selectedAircraft.value!.metro != 'SA226TC')
          Center(child: Obx(() => VyseTable(table: controller.vYtableN1.value, obtainedData: controller.obtainedDataVYN1))),
        if (controller.selectedAircraft.value!.metro == 'SA226TC')
          Center(child: Obx(() => VxTable(table: controller.dataSAA226TCFailureSecond.value, obtainedData: controller.obtainedDataSAA226TCFailureSecond))),
        const SizedBox(height: 50),
        Row(
          children: [
            Text('finalVelocityIAS'.tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: controller.velocitySecondSegmentN1,
                onChanged: (value) {
                  controller.secondSegmentN1.value.velocityIAS = double.parse(value);
                  controller.altitude.value.secondSegment = controller.secondSegmentN1.value;
                  controller.failure.value.altitude = controller.altitude.value;
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
          if (controller.obtainedISADataSecondSegmentN1.isNotEmpty) {
            return ISATable(table: controller.isatable.value, obtainedData: controller.obtainedISADataSecondSegmentN1);
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
                controller: controller.densitySecondSegmentN1,
                onChanged: (value) {
                  controller.secondSegmentN1.value.density = double.parse(value);
                  controller.altitude.value.secondSegment = controller.secondSegmentN1.value;
                  controller.failure.value.altitude = controller.altitude.value;
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
                controller: controller.velocitySecondSegmentTASN1,
                onChanged: (value) {
                  controller.secondSegmentN1.value.velocityTAS = double.parse(value);
                  controller.altitude.value.secondSegment = controller.secondSegmentN1.value;
                  controller.failure.value.altitude = controller.altitude.value;
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
          if (controller.resultRateSecondSegmentN1.isNotEmpty) {
            return RateChartGradient(rateGraphic: controller.rateGraphicSecondSegmentN1.value, resultRate: controller.resultRateSecondSegmentN1);
          } else {
            return const LinearProgressIndicator();
          }
        })),
        const SizedBox(height: 50),
        if (controller.selectedAircraft.value!.metro != 'SA226TC')
          Row(
            children: [
              Text('gradientObtained'.tr, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(width: 20),
              Expanded(
                child: TextFormField(
                  controller: controller.gradientSecondSegmentN1,
                  onChanged: (value) {
                    controller.secondSegmentN1.value.rateClimb = double.parse(value);
                    controller.altitude.value.secondSegment = controller.secondSegmentN1.value;
                    controller.failure.value.altitude = controller.altitude.value;
                    controller.newProcedure.value.failure = controller.failure.value;
                  },
                  decoration: InputDecoration(
                    labelText: 'gradient'.tr,
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
        if (controller.selectedAircraft.value!.metro == 'SA226TC')
          Row(
            children: [
              Text('finalRateOfClimb'.tr, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(width: 20),
              Expanded(
                child: TextFormField(
                  controller: controller.gradientSecondSegmentN1,
                  onChanged: (value) {},
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
        if (controller.selectedAircraft.value!.metro == 'SA226TC')
          const SizedBox(height: 50),
        if (controller.selectedAircraft.value!.metro == 'SA226TC')
          Row(
            children: [
              Text('timeFirstSegment'.tr, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(width: 20),
              Expanded(
                child: TextFormField(
                  controller: controller.timeSecondSegmentN1,
                  onChanged: (value) {},
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
        if (controller.selectedAircraft.value!.name != 'EC-GJM' && controller.selectedAircraft.value!.metro != 'SA226TC')
        Center(child: Obx(() {
          if (controller.resultGradientSecondSegmentN1.isNotEmpty) {
            return GradientChart(gradientGraphic: controller.gradientGraphicSecondSegmentN1.value, resultRate: controller.resultGradientSecondSegmentN1);
          } else {
            return const LinearProgressIndicator();
          }
        })),
        if (controller.selectedAircraft.value!.name != 'EC-GJM' && controller.selectedAircraft.value!.metro != 'SA226TC')
        const SizedBox(height: 50),
        Row(
          children: [
            Text('distanceObtained'.tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: controller.distanceSecondSegmentN1,
                onChanged: (value) {
                  controller.secondSegmentN1.value.distanceToFinish = double.parse(value);
                  controller.altitude.value.secondSegment = controller.secondSegmentN1.value;
                  controller.failure.value.altitude = controller.altitude.value;
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
          if (controller.secondSegmentN1.value.reachDP == false) {
            return Text('noArrive'.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold));
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('yesArrive'.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 50),
                Row(
                  children: [
                    Text('altitudeInDP'.tr, style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        controller: controller.altitudeInDPSecondSegmentN1,
                        onChanged: (value) {
                          controller.secondSegmentN1.value.altitudeInDP = double.parse(value);
                          controller.altitude.value.secondSegment = controller.secondSegmentN1.value;
                          controller.failure.value.altitude = controller.altitude.value;
                          controller.newProcedure.value.failure = controller.failure.value;
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
                        controller: controller.totalAltitudeInDPSecondSegmentN1,
                        onChanged: (value) {},
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
        }),
        const SizedBox(height: 50),
        Obx(() {
          if (controller.secondSegmentN1.value.clearDP == true && controller.secondSegmentN1.value.reachDP == true) {
            return Text('clearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.green, fontSize: 20));
          } else if (controller.secondSegmentN1.value.clearDP == false && controller.secondSegmentN1.value.reachDP == true) {
            return Text('noClearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red, fontSize: 20));
          } else {
            return Container();
          }
        })
      ],
    );
  }
}