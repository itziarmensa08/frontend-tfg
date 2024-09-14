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
                        Text('noArrive2'.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                        if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.firstSegment != null && controller.procedure.value.nMotors!.firstSegment!.reachDP != null)
                        Visibility(
                          visible: controller.procedure.value.nMotors!.firstSegment!.reachDP!,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('yesArrive2'.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
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
                              Text('noArrive2'.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                              if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.secondSegment != null && controller.procedure.value.nMotors!.secondSegment!.reachDP != null)
                              Visibility(
                                visible: controller.procedure.value.nMotors!.secondSegment!.reachDP!,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('yesArrive2'.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
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
                        if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.firstSegment != null && controller.procedure.value.nMotors!.firstSegment!.reachDP != null && controller.procedure.value.nMotors!.secondSegment != null && controller.procedure.value.nMotors!.secondSegment!.reachDP != null)
                        Visibility(
                          visible: !controller.procedure.value.nMotors!.secondSegment!.reachDP!,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                                child: Text(
                                  '3rdSegment'.tr,
                                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: TextEditingController(text: (controller.airport.value.elevation! + controller.aircraft.value.profile!.nMotors!.heightSecondSegment!).toString()),
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
                                  if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.thirdSegment != null && controller.procedure.value.nMotors!.thirdSegment!.velocityIAS != null)
                                  Expanded(
                                    child: TextFormField(
                                      controller: TextEditingController(text: controller.procedure.value.nMotors!.thirdSegment!.velocityIAS!.toStringAsFixed(2)),
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
                                  if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.thirdSegment != null && controller.procedure.value.nMotors!.thirdSegment!.velocityTAS != null)
                                  Expanded(
                                    child: TextFormField(
                                      controller: TextEditingController(text: controller.procedure.value.nMotors!.thirdSegment!.velocityTAS!.toStringAsFixed(2)),
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
                                  if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.thirdSegment != null && controller.procedure.value.nMotors!.thirdSegment!.rateClimb != null)
                                  Expanded(
                                    child: TextFormField(
                                      controller: TextEditingController(text: controller.procedure.value.nMotors!.thirdSegment!.rateClimb!.toStringAsFixed(2)),
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
                                  if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.thirdSegment != null && controller.procedure.value.nMotors!.thirdSegment!.timeToFinish != null)
                                  Expanded(
                                    child: TextFormField(
                                      controller: TextEditingController(text: controller.procedure.value.nMotors!.thirdSegment!.timeToFinish!.toStringAsFixed(2)),
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
                                  if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.thirdSegment != null && controller.procedure.value.nMotors!.thirdSegment!.distanceToFinish != null)
                                  Expanded(
                                    child: TextFormField(
                                      controller: TextEditingController(text: controller.procedure.value.nMotors!.thirdSegment!.distanceToFinish!.toStringAsFixed(2)),
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
                              if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.thirdSegment != null && controller.procedure.value.nMotors!.thirdSegment!.reachDP != null && controller.procedure.value.nMotors!.thirdSegment!.reachDP == false)
                              Text('noArrive2'.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                              if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.thirdSegment != null && controller.procedure.value.nMotors!.thirdSegment!.reachDP != null)
                              Visibility(
                                visible: controller.procedure.value.nMotors!.thirdSegment!.reachDP!,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('yesArrive2'.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 50),
                                    Row(
                                      children: [
                                        if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.thirdSegment != null && controller.procedure.value.nMotors!.thirdSegment!.timeToDP != null)
                                        Expanded(
                                          child: TextFormField(
                                            controller: TextEditingController(text: controller.procedure.value.nMotors!.thirdSegment!.timeToDP!.toStringAsFixed(2)),
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
                                        if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.thirdSegment != null && controller.procedure.value.nMotors!.thirdSegment!.altitudeInDP != null)
                                        Expanded(
                                          child: TextFormField(
                                            controller: TextEditingController(text: controller.procedure.value.nMotors!.thirdSegment!.altitudeInDP!.toStringAsFixed(2)),
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
                                        if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.thirdSegment != null && controller.procedure.value.nMotors!.thirdSegment!.altitudeInDP != null)
                                        Expanded(
                                          child: TextFormField(
                                            controller: TextEditingController(text: (controller.procedure.value.nMotors!.thirdSegment!.altitudeInDP! + controller.airport.value.elevation! + controller.aircraft.value.profile!.nMotors!.heightSecondSegment!).toStringAsFixed(2)),
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
                              if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.thirdSegment != null && controller.procedure.value.nMotors!.thirdSegment!.clearDP == true && controller.procedure.value.nMotors!.thirdSegment!.reachDP == true)
                              Text('clearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.green, fontSize: 20)),
                              if (controller.procedure.value.nMotors != null && controller.procedure.value.nMotors!.thirdSegment != null && controller.procedure.value.nMotors!.thirdSegment!.clearDP == false && controller.procedure.value.nMotors!.thirdSegment!.reachDP == true)
                              Text('noClearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red,  fontSize: 20)),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: (controller.procedure.value.failure != null),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  'failure'.tr,
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).primaryColor),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  if (controller.procedure.value.failure != null && controller.procedure.value.failure!.initialElevation != null)
                                  Expanded(
                                    child: TextFormField(
                                      controller: TextEditingController(text: controller.procedure.value.failure!.initialElevation!.toStringAsFixed(2)),
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        labelText: 'initialElevation'.tr,
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
                                  if (controller.procedure.value.failure != null && controller.procedure.value.failure!.distanceToInitial != null)
                                  Expanded(
                                    child: TextFormField(
                                      controller: TextEditingController(text: controller.procedure.value.failure!.distanceToInitial!.toStringAsFixed(2)),
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        labelText: 'distanceToInitial'.tr,
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
                              if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude != null && controller.procedure.value.failure!.altitude!.state != null)
                              Visibility(
                                visible: controller.procedure.value.failure!.altitude!.state!,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 20),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Text(
                                        'altitudeRestriction'.tr,
                                        style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).primaryColor),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude != null && controller.procedure.value.failure!.altitude!.dpDistance != null)
                                        Expanded(
                                          child: TextFormField(
                                            controller: TextEditingController(text: controller.procedure.value.failure!.altitude!.dpDistance!.toStringAsFixed(2)),
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
                                        const SizedBox(width: 20),
                                        if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude != null && controller.procedure.value.failure!.altitude!.dpElevation != null)
                                        Expanded(
                                          child: TextFormField(
                                            controller: TextEditingController(text: controller.procedure.value.failure!.altitude!.dpElevation!.toStringAsFixed(2)),
                                            readOnly: true,
                                            decoration: InputDecoration(
                                              labelText: 'dpElevation'.tr,
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
                                    if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude != null && controller.procedure.value.failure!.altitude!.firstSegment != null)
                                    Visibility(
                                      visible: (controller.procedure.value.failure!.altitude!.firstSegment!.velocityIAS != null),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 20),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                                            child: Text(
                                              '1stSegment'.tr,
                                              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          Row(
                                            children: [
                                              if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude!.firstSegment != null && controller.procedure.value.failure!.altitude!.firstSegment != null && controller.procedure.value.failure!.altitude!.firstSegment!.velocityIAS != null)
                                              Expanded(
                                                child: TextFormField(
                                                  controller: TextEditingController(text: controller.procedure.value.failure!.altitude!.firstSegment!.velocityIAS!.toStringAsFixed(2)),
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
                                              if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude!.firstSegment != null && controller.procedure.value.failure!.altitude!.firstSegment != null && controller.procedure.value.failure!.altitude!.firstSegment!.velocityTAS != null)
                                              Expanded(
                                                child: TextFormField(
                                                  controller: TextEditingController(text: controller.procedure.value.failure!.altitude!.firstSegment!.velocityTAS!.toStringAsFixed(2)),
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
                                              if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude!.firstSegment != null && controller.procedure.value.failure!.altitude!.firstSegment != null && controller.procedure.value.failure!.altitude!.firstSegment!.rateClimb != null)
                                              Expanded(
                                                child: TextFormField(
                                                  controller: TextEditingController(text: controller.procedure.value.failure!.altitude!.firstSegment!.rateClimb!.toStringAsFixed(2)),
                                                  readOnly: true,
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
                                          const SizedBox(height: 20),
                                          Row(
                                            children: [
                                              if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude!.firstSegment != null && controller.procedure.value.failure!.altitude!.firstSegment != null && controller.procedure.value.failure!.altitude!.firstSegment!.distanceToFinish != null)
                                              Expanded(
                                                child: TextFormField(
                                                  controller: TextEditingController(text: controller.procedure.value.failure!.altitude!.firstSegment!.distanceToFinish!.toStringAsFixed(2)),
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
                                          if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude != null && controller.procedure.value.failure!.altitude!.firstSegment != null && controller.procedure.value.failure!.altitude!.firstSegment!.reachDP != null && controller.procedure.value.failure!.altitude!.firstSegment!.reachDP == false)
                                          Text('noArrive2'.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                                          if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude != null && controller.procedure.value.failure!.altitude!.firstSegment != null && controller.procedure.value.failure!.altitude!.firstSegment!.reachDP != null)
                                          Visibility(
                                            visible: controller.procedure.value.failure!.altitude!.firstSegment!.reachDP!,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('yesArrive2'.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                                                const SizedBox(height: 50),
                                                Row(
                                                  children: [
                                                    if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude!.firstSegment != null && controller.procedure.value.failure!.altitude!.firstSegment != null && controller.procedure.value.failure!.altitude!.firstSegment!.altitudeInDP != null)
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller: TextEditingController(text: controller.procedure.value.failure!.altitude!.firstSegment!.altitudeInDP!.toStringAsFixed(2)),
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
                                                    if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude != null && controller.procedure.value.failure!.altitude!.firstSegment != null && controller.procedure.value.failure!.altitude!.firstSegment!.altitudeInDP != null)
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller: TextEditingController(text: (controller.procedure.value.failure!.altitude!.firstSegment!.altitudeInDP! + controller.airport.value.elevation! + controller.procedure.value.failure!.initialElevation!).toStringAsFixed(2)),
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
                                          if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude != null && controller.procedure.value.failure!.altitude!.firstSegment != null && controller.procedure.value.failure!.altitude!.firstSegment!.clearDP == true && controller.procedure.value.failure!.altitude!.firstSegment!.reachDP == true)
                                          Text('clearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.green, fontSize: 20)),
                                          if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude != null && controller.procedure.value.failure!.altitude!.firstSegment != null && controller.procedure.value.failure!.altitude!.firstSegment!.clearDP == false && controller.procedure.value.failure!.altitude!.firstSegment!.reachDP == true)
                                          Text('noClearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red,  fontSize: 20)),
                                        ],
                                      ),
                                    ),
                                    if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude != null && controller.procedure.value.failure!.altitude!.secondSegment != null)
                                    Visibility(
                                      visible: (controller.procedure.value.failure!.altitude!.secondSegment!.velocityIAS != null),
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
                                          const SizedBox(height: 20),
                                          Row(
                                            children: [
                                              if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude!.secondSegment != null && controller.procedure.value.failure!.altitude!.secondSegment != null && controller.procedure.value.failure!.altitude!.secondSegment!.velocityIAS != null)
                                              Expanded(
                                                child: TextFormField(
                                                  controller: TextEditingController(text: controller.procedure.value.failure!.altitude!.secondSegment!.velocityIAS!.toStringAsFixed(2)),
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
                                              if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude!.secondSegment != null && controller.procedure.value.failure!.altitude!.secondSegment != null && controller.procedure.value.failure!.altitude!.secondSegment!.velocityTAS != null)
                                              Expanded(
                                                child: TextFormField(
                                                  controller: TextEditingController(text: controller.procedure.value.failure!.altitude!.secondSegment!.velocityTAS!.toStringAsFixed(2)),
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
                                              if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude!.secondSegment != null && controller.procedure.value.failure!.altitude!.secondSegment != null && controller.procedure.value.failure!.altitude!.secondSegment!.rateClimb != null)
                                              Expanded(
                                                child: TextFormField(
                                                  controller: TextEditingController(text: controller.procedure.value.failure!.altitude!.secondSegment!.rateClimb!.toStringAsFixed(2)),
                                                  readOnly: true,
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
                                          const SizedBox(height: 20),
                                          Row(
                                            children: [
                                              if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude!.secondSegment != null && controller.procedure.value.failure!.altitude!.secondSegment != null && controller.procedure.value.failure!.altitude!.secondSegment!.distanceToFinish != null)
                                              Expanded(
                                                child: TextFormField(
                                                  controller: TextEditingController(text: controller.procedure.value.failure!.altitude!.secondSegment!.distanceToFinish!.toStringAsFixed(2)),
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
                                          if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude != null && controller.procedure.value.failure!.altitude!.secondSegment != null && controller.procedure.value.failure!.altitude!.secondSegment!.reachDP != null && controller.procedure.value.failure!.altitude!.secondSegment!.reachDP == false)
                                          Text('noArrive2'.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                                          if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude != null && controller.procedure.value.failure!.altitude!.secondSegment != null && controller.procedure.value.failure!.altitude!.secondSegment!.reachDP != null)
                                          Visibility(
                                            visible: controller.procedure.value.failure!.altitude!.secondSegment!.reachDP!,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('yesArrive2'.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                                                const SizedBox(height: 50),
                                                Row(
                                                  children: [
                                                    if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude!.secondSegment != null && controller.procedure.value.failure!.altitude!.secondSegment != null && controller.procedure.value.failure!.altitude!.secondSegment!.altitudeInDP != null)
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller: TextEditingController(text: controller.procedure.value.failure!.altitude!.secondSegment!.altitudeInDP!.toStringAsFixed(2)),
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
                                                    if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude != null && controller.procedure.value.failure!.altitude!.secondSegment != null && controller.procedure.value.failure!.altitude!.secondSegment!.altitudeInDP != null)
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller: TextEditingController(text: (controller.procedure.value.failure!.altitude!.secondSegment!.altitudeInDP! + controller.airport.value.elevation! + controller.procedure.value.failure!.initialElevation! + controller.aircraft.value.profile!.failure!.heightFirstSegment!).toStringAsFixed(2)),
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
                                          if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude != null && controller.procedure.value.failure!.altitude!.secondSegment != null && controller.procedure.value.failure!.altitude!.secondSegment!.clearDP == true && controller.procedure.value.failure!.altitude!.secondSegment!.reachDP == true)
                                          Text('clearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.green, fontSize: 20)),
                                          if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude != null && controller.procedure.value.failure!.altitude!.secondSegment != null && controller.procedure.value.failure!.altitude!.secondSegment!.clearDP == false && controller.procedure.value.failure!.altitude!.secondSegment!.reachDP == true)
                                          Text('noClearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red,  fontSize: 20)),
                                        ],
                                      ),
                                    ),
                                    if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude != null && controller.procedure.value.failure!.altitude!.thirdSegment != null)
                                    Visibility(
                                      visible: (controller.procedure.value.failure!.altitude!.thirdSegment!.velocityIAS != null),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 20),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                                            child: Text(
                                              '3rdSegment'.tr,
                                              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          Row(
                                            children: [
                                              if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude!.thirdSegment != null && controller.procedure.value.failure!.altitude!.thirdSegment != null && controller.procedure.value.failure!.altitude!.thirdSegment!.velocityIAS != null)
                                              Expanded(
                                                child: TextFormField(
                                                  controller: TextEditingController(text: controller.procedure.value.failure!.altitude!.thirdSegment!.velocityIAS!.toStringAsFixed(2)),
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
                                              if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude!.thirdSegment != null && controller.procedure.value.failure!.altitude!.thirdSegment != null && controller.procedure.value.failure!.altitude!.thirdSegment!.velocityTAS != null)
                                              Expanded(
                                                child: TextFormField(
                                                  controller: TextEditingController(text: controller.procedure.value.failure!.altitude!.thirdSegment!.velocityTAS!.toStringAsFixed(2)),
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
                                              if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude!.thirdSegment != null && controller.procedure.value.failure!.altitude!.thirdSegment != null && controller.procedure.value.failure!.altitude!.thirdSegment!.rateClimb != null)
                                              Expanded(
                                                child: TextFormField(
                                                  controller: TextEditingController(text: controller.procedure.value.failure!.altitude!.thirdSegment!.rateClimb!.toStringAsFixed(2)),
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
                                          if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude != null && controller.procedure.value.failure!.altitude!.thirdSegment != null && controller.procedure.value.failure!.altitude!.thirdSegment!.reachDP != null && controller.procedure.value.failure!.altitude!.thirdSegment!.reachDP == false)
                                          Text('noArrive2'.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                                          if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude != null && controller.procedure.value.failure!.altitude!.thirdSegment != null && controller.procedure.value.failure!.altitude!.thirdSegment!.reachDP != null)
                                          Visibility(
                                            visible: controller.procedure.value.failure!.altitude!.thirdSegment!.reachDP!,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('yesArrive2'.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                                                const SizedBox(height: 50),
                                                Row(
                                                  children: [
                                                    if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude!.thirdSegment != null && controller.procedure.value.failure!.altitude!.thirdSegment != null && controller.procedure.value.failure!.altitude!.thirdSegment!.timeToDP != null)
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller: TextEditingController(text: controller.procedure.value.failure!.altitude!.thirdSegment!.timeToDP!.toStringAsFixed(2)),
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
                                                    if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude!.thirdSegment != null && controller.procedure.value.failure!.altitude!.thirdSegment != null && controller.procedure.value.failure!.altitude!.thirdSegment!.altitudeInDP != null)
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller: TextEditingController(text: controller.procedure.value.failure!.altitude!.thirdSegment!.altitudeInDP!.toStringAsFixed(2)),
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
                                                    if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude != null && controller.procedure.value.failure!.altitude!.thirdSegment != null && controller.procedure.value.failure!.altitude!.thirdSegment!.altitudeInDP != null)
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller: TextEditingController(text: (controller.procedure.value.failure!.altitude!.thirdSegment!.altitudeInDP! + controller.airport.value.elevation! + controller.procedure.value.failure!.initialElevation! + controller.aircraft.value.profile!.failure!.heightSecondSegment!).toStringAsFixed(2)),
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
                                          if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude != null && controller.procedure.value.failure!.altitude!.thirdSegment != null && controller.procedure.value.failure!.altitude!.thirdSegment!.clearDP == true && controller.procedure.value.failure!.altitude!.thirdSegment!.reachDP == true)
                                          Text('clearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.green, fontSize: 20)),
                                          if (controller.procedure.value.failure != null && controller.procedure.value.failure!.altitude != null && controller.procedure.value.failure!.altitude!.thirdSegment != null && controller.procedure.value.failure!.altitude!.thirdSegment!.clearDP == false && controller.procedure.value.failure!.altitude!.thirdSegment!.reachDP == true)
                                          Text('noClearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red,  fontSize: 20)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient != null && controller.procedure.value.failure!.gradient!.state != null)
                              Visibility(
                                visible: controller.procedure.value.failure!.gradient!.state!,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 20),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Text(
                                        'gradientRestriction'.tr,
                                        style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).primaryColor),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient != null && controller.procedure.value.failure!.gradient!.dpDistance != null)
                                        Expanded(
                                          child: TextFormField(
                                            controller: TextEditingController(text: controller.procedure.value.failure!.gradient!.dpDistance!.toStringAsFixed(2)),
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
                                        const SizedBox(width: 20),
                                        if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient != null && controller.procedure.value.failure!.gradient!.gradientValue != null)
                                        Expanded(
                                          child: TextFormField(
                                            controller: TextEditingController(text: controller.procedure.value.failure!.gradient!.gradientValue!.toStringAsFixed(2)),
                                            readOnly: true,
                                            decoration: InputDecoration(
                                              labelText: 'gradientValue'.tr,
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
                                    if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient != null && controller.procedure.value.failure!.gradient!.firstSegment != null)
                                    Visibility(
                                      visible: (controller.procedure.value.failure!.gradient!.firstSegment!.velocityIAS != null),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 20),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                                            child: Text(
                                              '1stSegment'.tr,
                                              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          Row(
                                            children: [
                                              if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient!.firstSegment != null && controller.procedure.value.failure!.gradient!.firstSegment != null && controller.procedure.value.failure!.gradient!.firstSegment!.velocityIAS != null)
                                              Expanded(
                                                child: TextFormField(
                                                  controller: TextEditingController(text: controller.procedure.value.failure!.gradient!.firstSegment!.velocityIAS!.toStringAsFixed(2)),
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
                                              if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient!.firstSegment != null && controller.procedure.value.failure!.gradient!.firstSegment != null && controller.procedure.value.failure!.gradient!.firstSegment!.velocityTAS != null)
                                              Expanded(
                                                child: TextFormField(
                                                  controller: TextEditingController(text: controller.procedure.value.failure!.gradient!.firstSegment!.velocityTAS!.toStringAsFixed(2)),
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
                                              if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient!.firstSegment != null && controller.procedure.value.failure!.gradient!.firstSegment != null && controller.procedure.value.failure!.gradient!.firstSegment!.rateClimb != null)
                                              Expanded(
                                                child: TextFormField(
                                                  controller: TextEditingController(text: controller.procedure.value.failure!.gradient!.firstSegment!.rateClimb!.toStringAsFixed(2)),
                                                  readOnly: true,
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
                                          const SizedBox(height: 20),
                                          Row(
                                            children: [
                                              if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient!.firstSegment != null && controller.procedure.value.failure!.gradient!.firstSegment != null && controller.procedure.value.failure!.gradient!.firstSegment!.distanceToFinish != null)
                                              Expanded(
                                                child: TextFormField(
                                                  controller: TextEditingController(text: controller.procedure.value.failure!.gradient!.firstSegment!.distanceToFinish!.toStringAsFixed(2)),
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
                                          if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient != null && controller.procedure.value.failure!.gradient!.firstSegment != null && controller.procedure.value.failure!.gradient!.firstSegment!.reachDP != null && controller.procedure.value.failure!.gradient!.firstSegment!.reachDP == false)
                                          Text('noArrive2'.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                                          if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient != null && controller.procedure.value.failure!.gradient!.firstSegment != null && controller.procedure.value.failure!.gradient!.firstSegment!.reachDP != null)
                                          Visibility(
                                            visible: controller.procedure.value.failure!.gradient!.firstSegment!.reachDP!,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('yesArrive2'.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                                                const SizedBox(height: 50),
                                                Row(
                                                  children: [
                                                    if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient!.firstSegment != null && controller.procedure.value.failure!.gradient!.firstSegment != null && controller.procedure.value.failure!.gradient!.firstSegment!.altitudeInDP != null)
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller: TextEditingController(text: controller.procedure.value.failure!.gradient!.firstSegment!.altitudeInDP!.toStringAsFixed(2)),
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
                                                    if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient != null && controller.procedure.value.failure!.gradient!.firstSegment != null && controller.procedure.value.failure!.gradient!.firstSegment!.altitudeInDP != null)
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller: TextEditingController(text: (controller.procedure.value.failure!.gradient!.firstSegment!.altitudeInDP! + controller.airport.value.elevation! + controller.procedure.value.failure!.initialElevation!).toStringAsFixed(2)),
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
                                                    const SizedBox(width: 20),
                                                    if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient != null && controller.procedure.value.failure!.gradient!.finalGradient != null)
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller: TextEditingController(text: (controller.procedure.value.failure!.gradient!.finalGradient!).toStringAsFixed(2)),
                                                        readOnly: true,
                                                        decoration: InputDecoration(
                                                          labelText: 'finalGradient'.tr,
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
                                          if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient != null && controller.procedure.value.failure!.gradient!.firstSegment != null && controller.procedure.value.failure!.gradient!.firstSegment!.clearDP == true && controller.procedure.value.failure!.gradient!.firstSegment!.reachDP == true)
                                          Text('clearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.green, fontSize: 20)),
                                          if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient != null && controller.procedure.value.failure!.gradient!.firstSegment != null && controller.procedure.value.failure!.gradient!.firstSegment!.clearDP == false && controller.procedure.value.failure!.gradient!.firstSegment!.reachDP == true)
                                          Text('noClearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red,  fontSize: 20)),
                                        ],
                                      ),
                                    ),
                                    if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient != null && controller.procedure.value.failure!.gradient!.secondSegment != null)
                                    Visibility(
                                      visible: (controller.procedure.value.failure!.gradient!.secondSegment!.velocityIAS != null),
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
                                          const SizedBox(height: 20),
                                          Row(
                                            children: [
                                              if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient!.secondSegment != null && controller.procedure.value.failure!.gradient!.secondSegment != null && controller.procedure.value.failure!.gradient!.secondSegment!.velocityIAS != null)
                                              Expanded(
                                                child: TextFormField(
                                                  controller: TextEditingController(text: controller.procedure.value.failure!.gradient!.secondSegment!.velocityIAS!.toStringAsFixed(2)),
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
                                              if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient!.secondSegment != null && controller.procedure.value.failure!.gradient!.secondSegment != null && controller.procedure.value.failure!.gradient!.secondSegment!.velocityTAS != null)
                                              Expanded(
                                                child: TextFormField(
                                                  controller: TextEditingController(text: controller.procedure.value.failure!.gradient!.secondSegment!.velocityTAS!.toStringAsFixed(2)),
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
                                              if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient!.secondSegment != null && controller.procedure.value.failure!.gradient!.secondSegment != null && controller.procedure.value.failure!.gradient!.secondSegment!.rateClimb != null)
                                              Expanded(
                                                child: TextFormField(
                                                  controller: TextEditingController(text: controller.procedure.value.failure!.gradient!.secondSegment!.rateClimb!.toStringAsFixed(2)),
                                                  readOnly: true,
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
                                          const SizedBox(height: 20),
                                          Row(
                                            children: [
                                              if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient!.secondSegment != null && controller.procedure.value.failure!.gradient!.secondSegment != null && controller.procedure.value.failure!.gradient!.secondSegment!.distanceToFinish != null)
                                              Expanded(
                                                child: TextFormField(
                                                  controller: TextEditingController(text: controller.procedure.value.failure!.gradient!.secondSegment!.distanceToFinish!.toStringAsFixed(2)),
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
                                          if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient != null && controller.procedure.value.failure!.gradient!.secondSegment != null && controller.procedure.value.failure!.gradient!.secondSegment!.reachDP != null && controller.procedure.value.failure!.gradient!.secondSegment!.reachDP == false)
                                          Text('noArrive2'.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                                          if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient != null && controller.procedure.value.failure!.gradient!.secondSegment != null && controller.procedure.value.failure!.gradient!.secondSegment!.reachDP != null)
                                          Visibility(
                                            visible: controller.procedure.value.failure!.gradient!.secondSegment!.reachDP!,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('yesArrive2'.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                                                const SizedBox(height: 50),
                                                Row(
                                                  children: [
                                                    if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient!.secondSegment != null && controller.procedure.value.failure!.gradient!.secondSegment != null && controller.procedure.value.failure!.gradient!.secondSegment!.altitudeInDP != null)
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller: TextEditingController(text: controller.procedure.value.failure!.gradient!.secondSegment!.altitudeInDP!.toStringAsFixed(2)),
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
                                                    if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient != null && controller.procedure.value.failure!.gradient!.secondSegment != null && controller.procedure.value.failure!.gradient!.secondSegment!.altitudeInDP != null)
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller: TextEditingController(text: (controller.procedure.value.failure!.gradient!.secondSegment!.altitudeInDP! + controller.airport.value.elevation! + controller.aircraft.value.profile!.failure!.heightFirstSegment!).toStringAsFixed(2)),
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
                                                    const SizedBox(width: 20),
                                                    if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient != null && controller.procedure.value.failure!.gradient!.finalGradient != null)
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller: TextEditingController(text: (controller.procedure.value.failure!.gradient!.finalGradient!).toStringAsFixed(2)),
                                                        readOnly: true,
                                                        decoration: InputDecoration(
                                                          labelText: 'finalGradient'.tr,
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
                                          if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient != null && controller.procedure.value.failure!.gradient!.secondSegment != null && controller.procedure.value.failure!.gradient!.secondSegment!.clearDP == true && controller.procedure.value.failure!.gradient!.secondSegment!.reachDP == true)
                                          Text('clearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.green, fontSize: 20)),
                                          if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient != null && controller.procedure.value.failure!.gradient!.secondSegment != null && controller.procedure.value.failure!.gradient!.secondSegment!.clearDP == false && controller.procedure.value.failure!.gradient!.secondSegment!.reachDP == true)
                                          Text('noClearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red,  fontSize: 20)),
                                        ],
                                      ),
                                    ),
                                    if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient != null && controller.procedure.value.failure!.gradient!.thirdSegment != null)
                                    Visibility(
                                      visible: (controller.procedure.value.failure!.gradient!.thirdSegment!.velocityIAS != null),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 20),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                                            child: Text(
                                              '3rdSegment'.tr,
                                              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          Row(
                                            children: [
                                              if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient!.thirdSegment != null && controller.procedure.value.failure!.gradient!.thirdSegment != null && controller.procedure.value.failure!.gradient!.thirdSegment!.velocityIAS != null)
                                              Expanded(
                                                child: TextFormField(
                                                  controller: TextEditingController(text: controller.procedure.value.failure!.gradient!.thirdSegment!.velocityIAS!.toStringAsFixed(2)),
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
                                              if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient!.thirdSegment != null && controller.procedure.value.failure!.gradient!.thirdSegment != null && controller.procedure.value.failure!.gradient!.thirdSegment!.velocityTAS != null)
                                              Expanded(
                                                child: TextFormField(
                                                  controller: TextEditingController(text: controller.procedure.value.failure!.gradient!.thirdSegment!.velocityTAS!.toStringAsFixed(2)),
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
                                              if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient!.thirdSegment != null && controller.procedure.value.failure!.gradient!.thirdSegment != null && controller.procedure.value.failure!.gradient!.thirdSegment!.rateClimb != null)
                                              Expanded(
                                                child: TextFormField(
                                                  controller: TextEditingController(text: controller.procedure.value.failure!.gradient!.thirdSegment!.rateClimb!.toStringAsFixed(2)),
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
                                          if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient != null && controller.procedure.value.failure!.gradient!.thirdSegment != null && controller.procedure.value.failure!.gradient!.thirdSegment!.reachDP != null && controller.procedure.value.failure!.gradient!.thirdSegment!.reachDP == false)
                                          Text('noArrive2'.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                                          if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient != null && controller.procedure.value.failure!.gradient!.thirdSegment != null && controller.procedure.value.failure!.gradient!.thirdSegment!.reachDP != null)
                                          Visibility(
                                            visible: controller.procedure.value.failure!.gradient!.thirdSegment!.reachDP!,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('yesArrive2'.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                                                const SizedBox(height: 50),
                                                Row(
                                                  children: [
                                                    if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient!.thirdSegment != null && controller.procedure.value.failure!.gradient!.thirdSegment != null && controller.procedure.value.failure!.gradient!.thirdSegment!.timeToDP != null)
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller: TextEditingController(text: controller.procedure.value.failure!.gradient!.thirdSegment!.timeToDP!.toStringAsFixed(2)),
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
                                                    if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient!.thirdSegment != null && controller.procedure.value.failure!.gradient!.thirdSegment != null && controller.procedure.value.failure!.gradient!.thirdSegment!.altitudeInDP != null)
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller: TextEditingController(text: controller.procedure.value.failure!.gradient!.thirdSegment!.altitudeInDP!.toStringAsFixed(2)),
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
                                                    if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient != null && controller.procedure.value.failure!.gradient!.thirdSegment != null && controller.procedure.value.failure!.gradient!.thirdSegment!.altitudeInDP != null)
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller: TextEditingController(text: (controller.procedure.value.failure!.gradient!.thirdSegment!.altitudeInDP! + controller.airport.value.elevation! + controller.aircraft.value.profile!.failure!.heightSecondSegment!).toStringAsFixed(2)),
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
                                                    const SizedBox(width: 20),
                                                    if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient != null && controller.procedure.value.failure!.gradient!.finalGradient != null)
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller: TextEditingController(text: (controller.procedure.value.failure!.gradient!.finalGradient!).toStringAsFixed(2)),
                                                        readOnly: true,
                                                        decoration: InputDecoration(
                                                          labelText: 'finalGradient'.tr,
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
                                          if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient != null && controller.procedure.value.failure!.gradient!.thirdSegment != null && controller.procedure.value.failure!.gradient!.thirdSegment!.clearDP == true && controller.procedure.value.failure!.gradient!.thirdSegment!.reachDP == true)
                                          Text('clearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.green, fontSize: 20)),
                                          if (controller.procedure.value.failure != null && controller.procedure.value.failure!.gradient != null && controller.procedure.value.failure!.gradient!.thirdSegment != null && controller.procedure.value.failure!.gradient!.thirdSegment!.clearDP == false && controller.procedure.value.failure!.gradient!.thirdSegment!.reachDP == true)
                                          Text('noClearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red,  fontSize: 20)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
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