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
        Text('reviewDataThirdSegment'.tr, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextFormField(
                controller: controller.elevationThirdSegmentN,
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
                controller: TextEditingController(text: controller.thirdSegmentN.value.temperature.toString()),
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
                  suffixIcon: Tooltip(
                    message: 'Velocity IAS / sqrt(density) = ${controller.velocityThirdSegmentN.text} / sqrt(${controller.densityThirdSegmentN.text})',
                    child: Icon(Icons.info_outline, color: Theme.of(context).primaryColor),
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
        if (controller.dpDistance.text.isEmpty)
        Obx(() {
          if (controller.thirdSegmentN.value.reachDP == true) {
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
                          suffixIcon: Tooltip(
                            message: '(Altitude DP - height second segment) / rate of climb = (${controller.newProcedure.value.dpAltitude} - ${controller.selectedAircraft.value!.profile!.nMotors!.heightSecondSegment}) / ${controller.thirdSegmentN.value.rateClimb}',
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
                            message: 'Distance first segment + Distance second segment + Time to DP * (Velocity TAS / 60) = ${controller.firstSegmentN.value.distanceToFinish} + ${controller.secondSegmentN.value.distanceToFinish} + ${controller.thirdSegmentN.value.timeToDP} * (${controller.thirdSegmentN.value.velocityTAS} / 60)',
                            child: Icon(Icons.info_outline, color: Theme.of(context).primaryColor),
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
        if (controller.dpDistance.text.isNotEmpty)
        Obx(() {
          if (controller.thirdSegmentN.value.reachDP == true) {
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
                          suffixIcon: Tooltip(
                            message: '(Distance to DP - (Distance first segment + Distance second segment)) / (Velocity TAS / 60) = (${controller.newProcedure.value.dpDistance} - (${controller.firstSegmentN.value.distanceToFinish!.toStringAsFixed(2)} + ${controller.secondSegmentN.value.distanceToFinish!.toStringAsFixed(2)})) / (${controller.thirdSegmentN.value.velocityTAS!.toStringAsFixed(2)} / 60)',
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
                          suffixIcon: Tooltip(
                            message: 'Time to DP * rate of climb = ${controller.thirdSegmentN.value.timeToDP!.toStringAsFixed(2)} * ${controller.thirdSegmentN.value.rateClimb}',
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
                            suffixIcon: Tooltip(
                            message: 'Altitude in DP + Height second segment + airport elevation = ${controller.thirdSegmentN.value.altitudeInDP!.toStringAsFixed(2)} + ${controller.selectedAircraft.value!.profile!.nMotors!.heightSecondSegment} + ${controller.selectedAirport.value!.elevation}',
                            child: Icon(Icons.info_outline, color: Theme.of(context).primaryColor),
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
        if (controller.dpDistance.text.isNotEmpty)
        Obx(() {
          if (controller.thirdSegmentN.value.clearDP == true && controller.thirdSegmentN.value.reachDP == true) {
            return Text('clearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.green, fontSize: 20));
          } else if (controller.thirdSegmentN.value.clearDP == false && controller.thirdSegmentN.value.reachDP == true) {
            return Text('noClearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red, fontSize: 20));
          } else {
            return Container();
          }
        })
      ],
    );
  }
}