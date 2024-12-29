import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/airport_model.dart';
import 'package:frontend_tfg/data/services/procedure.service.dart';
import 'package:frontend_tfg/pages/home/list_aircrafts/list_aircrafts.controller.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';

class AirportCardHome extends StatelessWidget {
  final AirportModel airport;

  const AirportCardHome({super.key, required this.airport});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () async {
          var aircrafts = await ProcedureService.getAircraftsByAirport(airport.id!);
          final ListAircraftsHomeController controller = Get.put(ListAircraftsHomeController());
          controller.aircrafts.value = aircrafts;
          controller.airport.value = airport;
          Get.toNamed(Routes.homeAircrafts);
        },
        child: Card(
          color: const Color.fromRGBO(230, 238, 246, 1),
          elevation: 4,
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                if (airport.profileImage != null)
                  Image.network(
                    airport.profileImage!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )
                else
                  Icon(
                    Icons.connecting_airports,
                    size: 100,
                    color: Colors.black,
                  ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      airport.name ?? '',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text('${airport.iataCode} / ${airport.oaciCode}'),
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