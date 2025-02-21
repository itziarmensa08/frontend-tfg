import 'package:flutter/material.dart';
import 'package:frontend_tfg/pages/new_analysis/new_analysis.controller.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/isa_table.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/rate_chart.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/vx_table.dart';
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
                controller: controller.elevationSecondSegmentN,
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
                controller: TextEditingController(text: controller.secondSegmentN.value.temperature.toString()),
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
          Center(child: Obx(() => VyTable(table: controller.vYtableN.value, obtainedData: controller.obtainedDataVYN))),
        if (controller.selectedAircraft.value!.metro == 'SA226TC')
          Center(child: Obx(() => VxTable(table: controller.vXtableN.value, obtainedData: controller.obtainedDataVXN))),
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
                  suffixIcon: Tooltip(
                    message: 'Velocity IAS / sqrt(density) = ${controller.velocitySecondSegmentN.text} / sqrt(${controller.densitySecondSegmentN.text})',
                    child: Icon(Icons.info_outline, color: Theme.of(context).primaryColor),
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
                  suffixIcon: Tooltip(
                    message: '(Height second segment - Height first segment) / rate of climb = (${controller.selectedAircraft.value!.profile!.nMotors!.heightSecondSegment} - ${controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment}) / ${controller.rateOfClimbSecondSegmentN.text}',
                    child: Icon(Icons.info_outline, color: Theme.of(context).primaryColor),
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
                  suffixIcon: Tooltip(
                    message: 'Velocity TAS * (Time second segment / 60) = ${controller.firstSegmentN.value.velocityTAS!.toStringAsFixed(2)} * (${controller.secondSegmentN.value.timeToFinish!.toStringAsFixed(2)} / 60)',
                    child: Icon(Icons.info_outline, color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 50),
        if (controller.dpDistance.text.isEmpty)
        Obx(() {
          if (controller.secondSegmentN.value.reachDP == false) {
            return Text('noArriveNoDistanceDP'.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold));
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('yesArriveNoDistanceDP'.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
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
                          suffixIcon: Tooltip(
                            message: '(Altitude DP - height first segment) / rate of climb = (${controller.newProcedure.value.dpAltitude} - ${controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment}) / ${controller.secondSegmentN.value.rateClimb}',
                            child: Icon(Icons.info_outline, color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  children: [
                    Text('distanceInDP'.tr, style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        controller: TextEditingController(text: controller.newProcedure.value.dpDistance!.toStringAsFixed(2)),
                        onChanged: (value) {
                          controller.newProcedure.value.dpDistance = double.parse(value);
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
                          suffixIcon: Tooltip(
                            message: 'Distance first segment + Time to DP * (Velocity TAS / 60) = ${controller.firstSegmentN.value.distanceToFinish} + ${controller.secondSegmentN.value.timeToDP} * (${controller.secondSegmentN.value.velocityTAS} / 60)',
                            child: Icon(Icons.info_outline, color: Theme.of(context).primaryColor),
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
        if (controller.dpDistance.text.isNotEmpty)
        Obx(() {
          if (controller.secondSegmentN.value.reachDP == false) {
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
                          suffixIcon: Tooltip(
                            message: '(Distance to DP - Distance first segment) / (Velocity TAS / 60) = (${controller.newProcedure.value.dpDistance} - ${controller.firstSegmentN.value.distanceToFinish}) / (${controller.secondSegmentN.value.velocityTAS} / 60)',
                            child: Icon(Icons.info_outline, color: Theme.of(context).primaryColor),
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
                          suffixIcon: Tooltip(
                            message: 'Time to DP * rate of climb = ${controller.secondSegmentN.value.timeToDP} * ${controller.secondSegmentN.value.rateClimb}',
                            child: Icon(Icons.info_outline, color: Theme.of(context).primaryColor),
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
                        controller: controller.totalAltitudeInDPSecondSegmentN,
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
                          suffixIcon: Tooltip(
                            message: 'Altitude in DP + Height first segment + airport elevation = ${controller.secondSegmentN.value.altitudeInDP} + ${controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment} + ${controller.selectedAirport.value!.elevation}',
                            child: Icon(Icons.info_outline, color: Theme.of(context).primaryColor),
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
        if (controller.dpDistance.text.isNotEmpty)
        Obx(() {
          if (controller.secondSegmentN.value.clearDP == true && controller.secondSegmentN.value.reachDP == true) {
            return Text('clearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.green, fontSize: 20));
          } else if (controller.secondSegmentN.value.clearDP == false && controller.secondSegmentN.value.reachDP == true) {
            return Text('noClearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red, fontSize: 20));
          } else {
            return Container();
          }
        })
      ],
    );
  }
}