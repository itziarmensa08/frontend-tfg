import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/aircraft_model.dart';
import 'package:frontend_tfg/data/services/procedure.service.dart';
import 'package:frontend_tfg/pages/home/list_aircrafts/list_aircrafts.controller.dart';
import 'package:frontend_tfg/pages/home/list_procedures/list_procedures.controller.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';

class AircraftCardHome extends StatelessWidget {
  final AircraftModel aircraft;

  const AircraftCardHome({super.key, required this.aircraft});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () async {
          final ListAircraftsHomeController controller = Get.put(ListAircraftsHomeController());
          final ListProceduresHomeController controllerProc = Get.put(ListProceduresHomeController());
          var procedures = await ProcedureService.getProcedureByAirportnadAircraft(controller.airport.value.id!, aircraft.id!);
          controllerProc.procedures.value = procedures;
          controllerProc.airport.value = controller.airport.value;
          controllerProc.aircraft.value = aircraft;
          Get.toNamed(Routes.homeProcedures);
        },
        child: Card(
          color: const Color.fromRGBO(230, 238, 246, 1),
          elevation: 4,
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                if (aircraft.profileImage != null)
                  Image.network(
                    aircraft.profileImage!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )
                else
                  const Icon(
                    Icons.airplane_ticket,
                    size: 100,
                    color: Colors.black,
                  ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      aircraft.name ?? '',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text('${aircraft.metro}'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}