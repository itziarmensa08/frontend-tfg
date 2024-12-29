import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/procedure.model.dart';
import 'package:frontend_tfg/data/services/procedure.service.dart';
import 'package:frontend_tfg/general_widgets/alert.dart';
import 'package:frontend_tfg/pages/home/list_aircrafts/list_aircrafts.controller.dart';
import 'package:frontend_tfg/pages/home/list_procedures/list_procedures.controller.dart';
import 'package:frontend_tfg/pages/home/procedure_detail/procedure_detail.controller.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ProcedureCardHome extends StatelessWidget {
  final Procedure procedure;

  const ProcedureCardHome({
    super.key,
    required this.procedure,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () async {
          final ProcedureDetailController controller = Get.put(ProcedureDetailController());
          final ListProceduresHomeController controllerAir = Get.put(ListProceduresHomeController());
          controller.aircraft.value = controllerAir.aircraft.value;
          controller.airport.value = controllerAir.airport.value;
          controller.procedure.value = procedure;
          Get.toNamed(Routes.homeProcedureDetail);
        },
        child: Card(
          color: const Color.fromRGBO(230, 238, 246, 1),
          elevation: 4,
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Icon(
                  Icons.library_books_outlined,
                  size: 50,
                  color: Colors.black,
                ),
                const SizedBox(width: 35),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildProcedureDetailColumn('sidName'.tr, procedure.sidName ?? ''),
                      _buildProcedureDetailColumn('rwyName'.tr, procedure.rwyName ?? ''),
                      _buildProcedureDetailColumn('dpName'.tr, procedure.dpName ?? ''),
                      Column(
                        children: <Widget>[
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: IconButton(
                              icon: const Icon(Icons.picture_as_pdf),
                              color: Colors.grey,
                              onPressed: () async {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                );
                                try {
                                  var url = await ProcedureService.downloadPdfProcedure(procedure.id!);
                                  final Uri uri = Uri.parse(url['url']);
                                  if (await canLaunchUrl(uri)) {
                                    await launchUrl(uri);
                                  } else {
                                    throw 'No se puede abrir la URL: $uri';
                                  }
                                } catch (e) {
                                  print(e);
                                } finally {
                                  Navigator.of(context).pop();
                                }
                              },
                              tooltip: 'Descargar PDF'.tr,
                            ),
                          ),
                          const SizedBox(height: 5),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: IconButton(
                              icon: const Icon(Icons.delete),
                              color: Colors.grey,
                              onPressed: () async {
                                WidgetsBinding.instance.addPostFrameCallback((_) {
                                  showAlert(
                                    context,
                                    'deleteProcedure'.tr,
                                    'confirmDeleteProcedure'.tr,
                                    'yes'.tr,
                                    'no'.tr,
                                    const Color.fromRGBO(255, 0, 0, 1),
                                    const Color.fromARGB(255, 255, 255, 255),
                                    () async {
                                      try {
                                        await ProcedureService.deleteProcedure(procedure.id!);
                                        final ListAircraftsHomeController controller = Get.put(ListAircraftsHomeController());
                                        final ListProceduresHomeController controllerProc = Get.put(ListProceduresHomeController());
                                        var procedures = await ProcedureService.getProcedureByAirportnadAircraft(controller.airport.value.id!, controllerProc.aircraft.value.id!);
                                        controllerProc.procedures.value = procedures;
                                        Navigator.of(context).pop();
                                        if (controllerProc.procedures.isEmpty) {
                                          Get.toNamed(Routes.home);
                                        }
                                      } catch (e) {
                                        print(e);
                                      }
                                    },
                                    () {
                                      Navigator.of(context).pop();
                                    }
                                  );
                                }
                                );
                              },
                              tooltip: 'Eliminar'.tr,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 35),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProcedureDetailColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$title:'),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}