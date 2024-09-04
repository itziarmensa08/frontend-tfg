import 'package:flutter/material.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';
import 'package:frontend_tfg/pages/home/procedure_detail/procedure_detail.controller.dart';
import 'package:get/get.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

Widget desktopView(
  double height,
  TickerProviderStateMixin page,
  BuildContext context,
) {
  final ProcedureDetailController controller = Get.put(ProcedureDetailController());

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomTabBar(page: page, number: 0),
      const SizedBox(height: 20),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'procedureDetail'.tr,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).primaryColor),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: TextEditingController(text: controller.airport.value.name),
                                readOnly: true,
                                decoration: InputDecoration(
                                  labelText: 'airport'.tr,
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
                                controller: TextEditingController(text: controller.aircraft.value.name),
                                readOnly: true,
                                decoration: InputDecoration(
                                  labelText: 'aircraft'.tr,
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
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Obx(() {
                                    if (controller.procedure.value.sidDoc != null) {
                                      return SizedBox(
                                        width: double.infinity,
                                        height: MediaQuery.of(context).size.height,
                                        child: PdfViewer.openFile(controller.procedure.value.sidDoc!),
                                      );
                                    } else {
                                      return Container();
                                    }
                                  }),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Obx(() {
                                    if (controller.procedure.value.rwyDoc != null) {
                                      return SizedBox(
                                        width: double.infinity,
                                        height: MediaQuery.of(context).size.height,
                                        child: PdfViewer.openFile(controller.procedure.value.rwyDoc!),
                                      );
                                    } else {
                                      return Container();
                                    }
                                  }),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: TextEditingController(text: controller.procedure.value.sidName),
                                readOnly: true,
                                decoration: InputDecoration(
                                  labelText: 'sidName'.tr,
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
                                controller: TextEditingController(text: controller.procedure.value.rwyName),
                                readOnly: true,
                                decoration: InputDecoration(
                                  labelText: 'rwyName'.tr,
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
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: TextEditingController(text: controller.procedure.value.dpName),
                                readOnly: true,
                                decoration: InputDecoration(
                                  labelText: 'dpName'.tr,
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
                                controller: TextEditingController(text: controller.procedure.value.dpDistance.toString()),
                                readOnly: true,
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
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: TextEditingController(text: controller.procedure.value.dpAltitude.toString()),
                                readOnly: true,
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
                            const SizedBox(width: 20),
                            Expanded(
                              child: TextFormField(
                                controller: TextEditingController(text: controller.procedure.value.weight.toString()),
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
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'nMotors'.tr,
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).primaryColor),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                          child: Text(
                            '1stSegment'.tr,
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: TextEditingController(text: controller.airport.value.elevation.toString()),
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
                                controller: TextEditingController(text: controller.airport.value.referenceTemperature.toString()),
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
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.firstSegment != null && controller.procedure.value.nMotors!.firstSegment!.velocityIAS != null)
                            Expanded(
                              child: TextFormField(
                                controller: TextEditingController(text: controller.procedure.value.nMotors!.firstSegment!.velocityIAS!.toStringAsFixed(2)),
                                readOnly: true,
                                decoration: InputDecoration(
                                  labelText: 'velocityIAS'.tr,
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
                            if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.firstSegment != null && controller.procedure.value.nMotors!.firstSegment!.velocityTAS != null)
                            Expanded(
                              child: TextFormField(
                                controller: TextEditingController(text: controller.procedure.value.nMotors!.firstSegment!.velocityTAS!.toStringAsFixed(2)),
                                readOnly: true,
                                decoration: InputDecoration(
                                  labelText: 'velocityTAS'.tr,
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
                            if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.firstSegment != null && controller.procedure.value.nMotors!.firstSegment!.rateClimb != null)
                            Expanded(
                              child: TextFormField(
                                controller: TextEditingController(text: controller.procedure.value.nMotors!.firstSegment!.rateClimb!.toStringAsFixed(2)),
                                readOnly: true,
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
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.firstSegment != null && controller.procedure.value.nMotors!.firstSegment!.timeToFinish != null)
                            Expanded(
                              child: TextFormField(
                                controller: TextEditingController(text: controller.procedure.value.nMotors!.firstSegment!.timeToFinish!.toStringAsFixed(2)),
                                readOnly: true,
                                decoration: InputDecoration(
                                  labelText: 'timeFirstSegment'.tr,
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
                            if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.firstSegment != null && controller.procedure.value.nMotors!.firstSegment!.distanceToFinish != null)
                            Expanded(
                              child: TextFormField(
                                controller: TextEditingController(text: controller.procedure.value.nMotors!.firstSegment!.distanceToFinish!.toStringAsFixed(2)),
                                readOnly: true,
                                decoration: InputDecoration(
                                  labelText: 'distanceFirstSegment'.tr,
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
                        const SizedBox(height: 20),
                        if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.firstSegment != null && controller.procedure.value.nMotors!.firstSegment!.reachDP != null && controller.procedure.value.nMotors!.firstSegment!.reachDP == false)
                        Text('noArrive2'.tr, style: Theme.of(context).textTheme.titleMedium),
                        if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.firstSegment != null && controller.procedure.value.nMotors!.firstSegment!.reachDP != null)
                        Visibility(
                          visible: controller.procedure.value.nMotors!.firstSegment!.reachDP!,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('yesArrive2'.tr, style: Theme.of(context).textTheme.titleMedium),
                              const SizedBox(height: 50),
                              Row(
                                children: [
                                  if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.firstSegment != null && controller.procedure.value.nMotors!.firstSegment!.timeToDP != null)
                                  Expanded(
                                    child: TextFormField(
                                      controller: TextEditingController(text: controller.procedure.value.nMotors!.firstSegment!.timeToDP!.toStringAsFixed(2)),
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        labelText: 'timeToDP'.tr,
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
                                  if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.firstSegment != null && controller.procedure.value.nMotors!.firstSegment!.altitudeInDP != null)
                                  Expanded(
                                    child: TextFormField(
                                      controller: TextEditingController(text: controller.procedure.value.nMotors!.firstSegment!.altitudeInDP!.toStringAsFixed(2)),
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        labelText: 'altitudeInDP'.tr,
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
                                  if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.firstSegment != null && controller.procedure.value.nMotors!.firstSegment!.altitudeInDP != null)
                                  Expanded(
                                    child: TextFormField(
                                      controller: TextEditingController(text: (controller.procedure.value.nMotors!.firstSegment!.altitudeInDP! + controller.airport.value.elevation!).toStringAsFixed(2)),
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        labelText: 'totalAltitudeInDP'.tr,
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
                          )
                        ),
                        const SizedBox(height: 20),
                        if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.firstSegment != null && controller.procedure.value.nMotors!.firstSegment!.clearDP == true && controller.procedure.value.nMotors!.firstSegment!.reachDP == true)
                        Text('clearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.green, fontSize: 20)),
                        if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.firstSegment != null && controller.procedure.value.nMotors!.firstSegment!.clearDP == false && controller.procedure.value.nMotors!.firstSegment!.reachDP == true)
                        Text('noClearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red,  fontSize: 20)),
                        if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.firstSegment != null && controller.procedure.value.nMotors!.firstSegment!.reachDP != null)
                        Visibility(
                          visible: !controller.procedure.value.nMotors!.firstSegment!.reachDP!,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                                child: Text(
                                  '2ndSegment'.tr,
                                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: TextEditingController(text: (controller.airport.value.elevation! + controller.aircraft.value.profile!.nMotors!.heightFirstSegment!).toString()),
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
                                      controller: TextEditingController(text: controller.airport.value.referenceTemperature.toString()),
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
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.secondSegment != null && controller.procedure.value.nMotors!.secondSegment!.velocityIAS != null)
                                  Expanded(
                                    child: TextFormField(
                                      controller: TextEditingController(text: controller.procedure.value.nMotors!.secondSegment!.velocityIAS!.toStringAsFixed(2)),
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        labelText: 'velocityIAS'.tr,
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
                                  if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.secondSegment != null && controller.procedure.value.nMotors!.secondSegment!.velocityTAS != null)
                                  Expanded(
                                    child: TextFormField(
                                      controller: TextEditingController(text: controller.procedure.value.nMotors!.secondSegment!.velocityTAS!.toStringAsFixed(2)),
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        labelText: 'velocityTAS'.tr,
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
                                  if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.secondSegment != null && controller.procedure.value.nMotors!.secondSegment!.rateClimb != null)
                                  Expanded(
                                    child: TextFormField(
                                      controller: TextEditingController(text: controller.procedure.value.nMotors!.secondSegment!.rateClimb!.toStringAsFixed(2)),
                                      readOnly: true,
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
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.secondSegment != null && controller.procedure.value.nMotors!.secondSegment!.timeToFinish != null)
                                  Expanded(
                                    child: TextFormField(
                                      controller: TextEditingController(text: controller.procedure.value.nMotors!.secondSegment!.timeToFinish!.toStringAsFixed(2)),
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        labelText: 'timeFirstSegment'.tr,
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
                                  if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.secondSegment != null && controller.procedure.value.nMotors!.secondSegment!.distanceToFinish != null)
                                  Expanded(
                                    child: TextFormField(
                                      controller: TextEditingController(text: controller.procedure.value.nMotors!.secondSegment!.distanceToFinish!.toStringAsFixed(2)),
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        labelText: 'distanceFirstSegment'.tr,
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
                              const SizedBox(height: 20),
                              if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.secondSegment != null && controller.procedure.value.nMotors!.secondSegment!.reachDP != null && controller.procedure.value.nMotors!.secondSegment!.reachDP == false)
                              Text('noArrive2'.tr, style: Theme.of(context).textTheme.titleMedium),
                              if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.secondSegment != null && controller.procedure.value.nMotors!.secondSegment!.reachDP != null)
                              Visibility(
                                visible: controller.procedure.value.nMotors!.secondSegment!.reachDP!,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('yesArrive2'.tr, style: Theme.of(context).textTheme.titleMedium),
                                    const SizedBox(height: 50),
                                    Row(
                                      children: [
                                        if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.secondSegment != null && controller.procedure.value.nMotors!.secondSegment!.timeToDP != null)
                                        Expanded(
                                          child: TextFormField(
                                            controller: TextEditingController(text: controller.procedure.value.nMotors!.secondSegment!.timeToDP!.toStringAsFixed(2)),
                                            readOnly: true,
                                            decoration: InputDecoration(
                                              labelText: 'timeToDP'.tr,
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
                                        if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.secondSegment != null && controller.procedure.value.nMotors!.secondSegment!.altitudeInDP != null)
                                        Expanded(
                                          child: TextFormField(
                                            controller: TextEditingController(text: controller.procedure.value.nMotors!.secondSegment!.altitudeInDP!.toStringAsFixed(2)),
                                            readOnly: true,
                                            decoration: InputDecoration(
                                              labelText: 'altitudeInDP'.tr,
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
                                        if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.secondSegment != null && controller.procedure.value.nMotors!.secondSegment!.altitudeInDP != null)
                                        Expanded(
                                          child: TextFormField(
                                            controller: TextEditingController(text: (controller.procedure.value.nMotors!.secondSegment!.altitudeInDP! + controller.airport.value.elevation! + controller.aircraft.value.profile!.nMotors!.heightFirstSegment!).toStringAsFixed(2)),
                                            readOnly: true,
                                            decoration: InputDecoration(
                                              labelText: 'totalAltitudeInDP'.tr,
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
                                )
                              ),
                              const SizedBox(height: 20),
                              if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.secondSegment != null && controller.procedure.value.nMotors!.secondSegment!.clearDP == true && controller.procedure.value.nMotors!.secondSegment!.reachDP == true)
                              Text('clearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.green, fontSize: 20)),
                              if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.secondSegment != null && controller.procedure.value.nMotors!.secondSegment!.clearDP == false && controller.procedure.value.nMotors!.secondSegment!.reachDP == true)
                              Text('noClearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red,  fontSize: 20)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}