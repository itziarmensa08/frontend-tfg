
import 'package:flutter/material.dart';
import 'package:frontend_tfg/pages/new_analysis/new_analysis.controller.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/first_segment_second_altitude.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/first_segment_second_gradient.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/second_segment_second_altitude.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/second_segment_second_gradient.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/third_segment_second_altitude.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/third_segment_second_gradient.dart';
import 'package:get/get.dart';

class ThirdStep extends StatefulWidget {
  const ThirdStep({super.key, required this.controller});

  final NewAnalaysisController controller;

  @override
  State<ThirdStep> createState() => ThirdStepState();
}

class ThirdStepState extends State<ThirdStep> {
  List<Item> items = [];

  void generateItemsAltitude(bool reachDP1, bool reachDP2, bool reachDP3) {
    setState(() {
      items = [
        if (double.parse(widget.controller.initialElevation.text) < widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!)
          Item(
            headerValue: 'segment1'.tr,
            body: FirstSegmentSecondStepAltitude(),
          ),
        if ((double.parse(widget.controller.initialElevation.text) < widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! ||
            (double.parse(widget.controller.initialElevation.text) > widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! && double.parse(widget.controller.initialElevation.text) < widget.controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment!)) && !reachDP1)
          Item(
            headerValue: 'segment2'.tr,
            body: SecondSegmentSecondStepAltitude(),
          ),
        if (!reachDP1 && ! reachDP2)
          Item(
            headerValue: 'segment3'.tr,
            body: ThirdSegmentSecondStepAltitude(),
          ),
      ];
    });
  }

  void generateItemsGradient(bool reachDP1, bool reachDP2, bool reachDP3) {
    setState(() {
      items = [
        if (double.parse(widget.controller.initialElevation.text) < widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!)
          Item(
            headerValue: 'segment1'.tr,
            body: FirstSegmentSecondStepGradient(),
          ),
        if ((double.parse(widget.controller.initialElevation.text) < widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! ||
            (double.parse(widget.controller.initialElevation.text) > widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! && double.parse(widget.controller.initialElevation.text) < widget.controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment!))  && !reachDP1)
          Item(
            headerValue: 'segment2'.tr,
            body: SecondSegmentSecondStepGradient(),
          ),
        if (!reachDP1 && ! reachDP2)
          Item(
            headerValue: 'segment3'.tr,
            body: ThirdSegmentSecondStepGradient(),
          ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.controller.indexStepper.value == 2) {
      return SingleChildScrollView(
        child: Obx(() {
          if (widget.controller.firstSegmentN.value.clearDP != false && widget.controller.secondSegmentN.value.clearDP != false && widget.controller.thirdSegmentN.value.clearDP != false) {
            return Text('not_necessary'.tr, style: Theme.of(context).textTheme.titleMedium);
          } else {
            return Column(
              children: [
                Row(
                  children: [
                    Text('ignoreFailure'.tr, style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(width: 20),
                    ElevatedButton(onPressed: () {
                      widget.controller.ignoreFailure.value = true;
                      widget.controller.indexStepper.value = 3;
                    }, child: Text('yes'.tr)),
                    const SizedBox(width: 20),
                    ElevatedButton(onPressed: () {
                      widget.controller.ignoreFailure.value = false;
                    }, child: Text('no'.tr))
                  ],
                ),
                if (widget.controller.ignoreFailure.value == false)
                _buildPanel(widget.controller)
              ],
            );
          }
        }),
      );
    } else {
      return const LinearProgressIndicator();
    }
  }

  Widget _buildPanel(NewAnalaysisController controller) {
    return Column(
      children: [
        Text('reviewDataFirstSegment_N_1'.tr, style: Theme.of(context).textTheme.titleMedium),
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
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: controller.referenceTemperature,
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
        const SizedBox(height: 30),
        Row(
          children: [
            Text('enter_initial_elevation'.tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: controller.initialElevation,
                onChanged: (value) {
                  controller.failure.value.initialElevation = double.parse(value);
                },
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
          ],
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            Text('select_restriction'.tr, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                controller.seeAnalysis.value = false;
                controller.altitudeRestriction.value = true;
                controller.gradientRestriction.value = false;
                controller.altitude.value.state = true;
                controller.gradient.value.state = false;
                controller.failure.value.altitude = controller.altitude.value;
                controller.failure.value.gradient = controller.gradient.value;
                controller.newProcedure.value.failure = controller.failure.value;
              },
              child: Text('minimum_altitude'.tr),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                controller.seeAnalysis.value = false;
                controller.altitudeRestriction.value = false;
                controller.gradientRestriction.value = true;
                controller.altitude.value.state = false;
                controller.gradient.value.state = true;
                controller.failure.value.altitude = controller.altitude.value;
                controller.failure.value.gradient = controller.gradient.value;
                controller.newProcedure.value.failure = controller.failure.value;
              },
              child: Text('minimum_gradient'.tr),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Obx(() {
          if (controller.gradientRestriction.value == true) {
            return Column(
              children: [
                Text('enter2Data'.tr, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.dpDistanceGradient,
                        onChanged: (value) {
                          controller.distanceChanged.value = true;
                          controller.gradient.value.dpDistance = double.parse(value);
                          controller.failure.value.gradient = controller.gradient.value;
                          controller.newProcedure.value.failure = controller.failure.value;
                          if (controller.gradientChanged.value == false && controller.altitudeChanged.value == true) {
                            controller.gradient.value.gradientValue = double.parse(controller.gradientAltitude.text) / controller.gradient.value.dpDistance!;
                            controller.failure.value.gradient = controller.gradient.value;
                            controller.newProcedure.value.failure = controller.failure.value;
                            controller.gradientRestrictionValue.text = controller.gradient.value.gradientValue.toString();
                          }
                          if (controller.altitudeChanged.value == false && controller.gradientChanged.value == true) {
                            controller.gradientAltitude.text = (controller.gradient.value.gradientValue! * 0.01 * controller.gradient.value.dpDistance!).toStringAsFixed(2);
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'dpDistanceNoOptional'.tr,
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
                        controller: controller.gradientAltitude,
                        onChanged: (value) {
                          controller.altitudeChanged.value = true;
                          double? value = double.tryParse(controller.gradientAltitude.text);
                          if (value != null) {
                            if (controller.gradientChanged.value == false && controller.distanceChanged.value == true) {
                              controller.gradient.value.gradientValue = (value / (controller.gradient.value.dpDistance! / 0.000164579)) * 100;
                              controller.failure.value.gradient = controller.gradient.value;
                              controller.newProcedure.value.failure = controller.failure.value;
                              controller.gradientRestrictionValue.text = controller.gradient.value.gradientValue.toString();
                            }
                            if (controller.distanceChanged.value == false && controller.gradientChanged.value == true) {
                              controller.gradient.value.dpDistance = (value / (controller.gradient.value.gradientValue! * 0.01)) * 0.000164579;
                              controller.failure.value.gradient = controller.gradient.value;
                              controller.newProcedure.value.failure = controller.failure.value;
                              controller.dpDistanceGradient.text = controller.gradient.value.dpDistance!.toStringAsFixed(2);
                            }
                          }
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
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        controller: controller.gradientRestrictionValue,
                        onChanged: (value) {
                          controller.gradientChanged.value = true;
                          controller.gradient.value.gradientValue = double.parse(value);
                          controller.failure.value.gradient = controller.gradient.value;
                          controller.newProcedure.value.failure = controller.failure.value;
                          if (controller.distanceChanged.value == false && controller.altitudeChanged.value == true) {
                            controller.gradient.value.dpDistance = (double.parse(controller.gradientAltitude.text) / (controller.gradient.value.gradientValue! * 0.01)) * 0.000164579;
                            controller.failure.value.gradient = controller.gradient.value;
                            controller.newProcedure.value.failure = controller.failure.value;
                            controller.dpDistanceGradient.text = controller.gradient.value.dpDistance!.toStringAsFixed(2);
                          }
                          if (controller.altitudeChanged.value == false && controller.distanceChanged.value == true) {
                            controller.gradientAltitude.text = (controller.gradient.value.gradientValue! * 0.01 * controller.gradient.value.dpDistance!).toStringAsFixed(2);
                          }
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
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    if (controller.gradientRestriction.value == true) {
                      final result = await calculateDataFailureGradient(controller);
                      final reachDP1 = result['reachDP1'];
                      final reachDP2 = result['reachDP2'];
                      final reachDP3 = result['reachDP3'];
                      generateItemsGradient(reachDP1!, reachDP2!, reachDP3!);
                    }

                  },
                  child: Text('start_analysis'.tr),
                ),
              ],
            );
          } else if (controller.altitudeRestriction.value == true) {
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.dpDistanceAltitude,
                        onChanged: (value) {
                          controller.altitude.value.dpDistance = double.parse(value);
                          controller.failure.value.altitude = controller.altitude.value;
                          controller.newProcedure.value.failure = controller.failure.value;
                        },
                        decoration: InputDecoration(
                          labelText: 'dpDistance'.tr,
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
                        controller: controller.dpAltitudeRestriction,
                        onChanged: (value) {
                          controller.altitude.value.dpElevation = double.parse(value);
                          controller.failure.value.altitude = controller.altitude.value;
                          controller.newProcedure.value.failure = controller.failure.value;
                        },
                        decoration: InputDecoration(
                          labelText: 'dpAltitude'.tr,
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
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    if (controller.altitudeRestriction.value == true) {
                      final result = await calculateDataFailureAltitude(controller);
                      final reachDP1 = result['reachDP1'];
                      final reachDP2 = result['reachDP2'];
                      final reachDP3 = result['reachDP3'];
                      generateItemsAltitude(reachDP1!, reachDP2!, reachDP3!);
                    }
                  },
                  child: Text('start_analysis'.tr),
                ),
              ],
            );
          } else {
            return Container();
          }
        }),
        const SizedBox(height: 30),
        Obx(() {
          if (controller.loadingAnalysis.value == true) {
            return const CircularProgressIndicator();
          } else if (controller.loadingAnalysis.value == false && controller.seeAnalysis.value == true) {
            return ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  items[index].isExpanded = isExpanded;
                });
              },
              children: items.map<ExpansionPanel>((Item item) {
                return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text(item.headerValue),
                    );
                  },
                  body: item.body,
                  isExpanded: item.isExpanded,
                );
              }).toList(),
            );
          } else {
            return Container();
          }
        }),
      ],
    );
  }
}

class Item {
  String headerValue;
  Widget body;
  bool isExpanded;

  Item({
    required this.headerValue,
    required this.body,
    this.isExpanded = false,
  });
}

