import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/services/procedure.service.dart';
import 'package:frontend_tfg/pages/new_analysis/new_analysis.controller.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';

class Conclusion extends StatelessWidget {
  Conclusion({super.key});

  final controller = Get.put(NewAnalaysisController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Conclusión para N motores: '.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).primaryColor)),
        const SizedBox(height: 50),
        Obx(() {
          final clearDP = controller.firstSegmentN.value.clearDP;

          if (clearDP != null) {
            if (clearDP) {
              return Text('El decision point se encuentra en el primer segmento y la aeronave es capaz de sobrepasarlo.'.tr);
            } else {
              return Text('El decision point se encuentra en el primer segmento y la aeronave NO es capaz de sobrepasarlo.'.tr);
            }
          } else {
            return Container();
          }
        }),
        Obx(() {
          final clearDP = controller.secondSegmentN.value.clearDP;

          if (clearDP != null) {
            if (clearDP) {
              return Text('El decision point se encuentra en el segundo segmento y la aeronave es capaz de sobrepasarlo.'.tr);
            } else {
              return Text('El decision point se encuentra en el segundo segmento y la aeronave NO es capaz de sobrepasarlo.'.tr);
            }
          } else {
            return Container();
          }
        }),
        Obx(() {
          final clearDP = controller.thirdSegmentN.value.clearDP;

          if (clearDP != null) {
            if (clearDP) {
              return Text('El decision point se encuentra en el tercer segmento y la aeronave es capaz de sobrepasarlo.'.tr);
            } else {
              return Text('El decision point se encuentra en el tercer segmento y la aeronave NO es capaz de sobrepasarlo.'.tr);
            }
          } else {
            return Container();
          }
        }),
        const SizedBox(height: 50),
        Row(
          children: [
            Text('Escribe el procedimiento para N motores'.tr),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: controller.precedureN,
                onChanged: (value) {
                  controller.newProcedure.value.procedureN = value;
                },
                maxLines: null,
                decoration: InputDecoration(
                  labelText: 'Procedimiento'.tr,
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
          if (controller.ignoreFailure.value == false) {
            return Column(
              children: [
                Text('Conclusión para N - 1 motores: '.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).primaryColor)),
                const SizedBox(height: 50),
                Obx(() {
                  if (controller.firstSegmentN.value.clearDP != false && controller.secondSegmentN.value.clearDP != false && controller.thirdSegmentN.value.clearDP != false) {
                    return Text('not_conclusion'.tr, style: Theme.of(context).textTheme.titleMedium);
                  } else {
                    final clearDP1 = controller.firstSegmentN1.value.clearDP;

                    if (clearDP1 != null) {
                      if (clearDP1) {
                        return Text('El decision point se encuentra en el primer segmento y la aeronave es capaz de sobrepasarlo.'.tr);
                      } else {
                        return Text('El decision point se encuentra en el primer segmento y la aeronave NO es capaz de sobrepasarlo.'.tr);
                      }
                    }

                    final clearDP2 = controller.secondSegmentN1.value.clearDP;

                    if (clearDP2 != null) {
                      if (clearDP2) {
                        return Text('El decision point se encuentra en el segundo segmento y la aeronave es capaz de sobrepasarlo.'.tr);
                      } else {
                        return Text('El decision point se encuentra en el segundo segmento y la aeronave NO es capaz de sobrepasarlo.'.tr);
                      }
                    }

                    final clearDP3 = controller.thirdSegmentN1.value.clearDP;

                    if (clearDP3 != null) {
                      if (clearDP3) {
                        return Text('El decision point se encuentra en el tercer segmento y la aeronave es capaz de sobrepasarlo.'.tr);
                      } else {
                        return Text('El decision point se encuentra en el tercer segmento y la aeronave NO es capaz de sobrepasarlo.'.tr);
                      }
                    }

                    return Container();
                  }
                }),
                const SizedBox(height: 50),
                Obx(() {
                  if (controller.firstSegmentN.value.clearDP != false && controller.secondSegmentN.value.clearDP != false && controller.thirdSegmentN.value.clearDP != false) {
                    return Container();
                  } else {
                    return Row(
                      children: [
                        Text('Escribe el procedimiento para N - 1 motores'.tr),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            controller: controller.precedureN1,
                            onChanged: (value) {
                              controller.newProcedure.value.procedureN1 = value;
                            },
                            maxLines: null,
                            decoration: InputDecoration(
                              labelText: 'Procedimiento'.tr,
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
                    );
                  }
                }),
                const SizedBox(height: 50)
              ],
            );
          } else {
            return Container();
          }
        }),
        ElevatedButton(
          onPressed: () async{
            await ProcedureService.postProcedure(controller.newProcedure.value);
            bool? confirm = await showDialog(
              // ignore: use_build_context_synchronously
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Siguiente paso'.tr),
                  content: Text("¿Quieres seguir analizando otras SID's / DP's?".tr),
                  actions: <Widget>[
                    TextButton(
                      child: Text('no'.tr),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
                    TextButton(
                      child: Text('yes'.tr),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                    ),
                  ],
                );
              },
            );
            if (confirm == true) {
              controller.indexStepper.value = 0;
              deleteDataFourthStep(controller);
              deleteDataSecondStep(controller);
              deleteDataThirdStep(controller);
            } else {
              clearGeneralValues(controller);
              deleteDataFourthStep(controller);
              deleteDataSecondStep(controller);
              deleteDataThirdStep(controller);
              Get.toNamed(Routes.home);
            }
          },
          child: Text('Guardar'.tr),
        )
      ],
    );
  }
}