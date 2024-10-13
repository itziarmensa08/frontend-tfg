import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/services/crew_procedures.service.dart';
import 'package:frontend_tfg/pages/home/write_procedure/write_procedure.controller.dart';
import 'package:get/get.dart';
import 'package:frontend_tfg/data/models/crew_procedure.dart';
import 'package:url_launcher/url_launcher.dart';

Widget procedureListView(BuildContext context) {
  return GetBuilder<WriteProcedureController>(
    builder: (controller) {
      final List<ProcedureRWY> proceduresByRWY = controller.crewProcedure.value.proceduresRWY ?? [];

      return Expanded(
        child: ListView.builder(
          itemCount: proceduresByRWY.fold(0, (sum, item) => sum + (item.procedures?.length ?? 0)) + 2,
          itemBuilder: (context, index) {

            if (index == proceduresByRWY.fold(0, (sum, item) => sum + (item.procedures?.length ?? 0))) {
              // Botón para añadir un nuevo procedimiento
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    var newProcedure = ProcedureDetails(sids: '', procedure: '');
                    var newRunway = ProcedureRWY(rwy: '', procedures: [newProcedure]);
                    if (proceduresByRWY.isNotEmpty) {
                      proceduresByRWY.add(newRunway);
                    } else {
                      controller.crewProcedure.value.proceduresRWY = [newRunway];
                    }
                    controller.update();
                  },
                  child: Text('Añadir Procedimiento'),
                ),
              );
            }

            if (index == proceduresByRWY.fold(0, (sum, item) => sum + (item.procedures?.length ?? 0)) + 1) {
              // Botón para añadir un nuevo procedimiento
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () async {
                        controller.crewProcedure.value.proceduresRWY = proceduresByRWY;
                        var proc = await CrewProcedureService.addCrewProc(controller.crewProcedure.value);
                        if (proc != null) {
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
                            var url = await CrewProcedureService.downloadCrewProc(proc.id!);
                            final Uri uri = Uri.parse(url['url']);
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(uri);
                            } else {
                              throw 'Cannot open the URL: $uri';
                            }
                          } catch (e) {
                            print('Error launching crew procedure: $e');
                          } finally {
                            Navigator.of(context).pop();
                          }
                        }
                      },
                      child: Text('Crear Procedimiento Tripulación'),
                    ),
                  ],
                ),
              );
            }

            int currentProcedureIndex = 0;
            for (var rwyIndex = 0; rwyIndex < proceduresByRWY.length; rwyIndex++) {
              var procedures = proceduresByRWY[rwyIndex].procedures ?? [];
              if (index < currentProcedureIndex + procedures.length) {
                final procedure = procedures[index - currentProcedureIndex];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Column con los tres TextFormField
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  controller: TextEditingController(text: procedure.sids),
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
                                  onChanged:(value) => procedure.sids = value,
                                ),
                                SizedBox(height: 30),
                                TextFormField(
                                  controller: TextEditingController(text: proceduresByRWY[rwyIndex].rwy),
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
                                  onChanged:(value) => proceduresByRWY[rwyIndex].rwy = value,
                                ),
                                SizedBox(height: 30),
                                TextFormField(
                                  controller: TextEditingController(text: procedure.procedure),
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
                                  onChanged:(value) => procedure.procedure = value,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          // Icono de eliminar al lado de la columna
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              // Elimina el procedimiento actual de la lista
                              procedures.removeAt(index - currentProcedureIndex);
                              controller.update(); // Actualiza la vista
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              currentProcedureIndex += procedures.length;
            }
            return Container();
          },
        ),
      );
    },
  );
}
