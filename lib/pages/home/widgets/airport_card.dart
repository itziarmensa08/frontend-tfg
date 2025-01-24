import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/airport_model.dart';
import 'package:frontend_tfg/data/services/procedure.service.dart';
import 'package:frontend_tfg/pages/home/list_aircrafts/list_aircrafts.controller.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';

class AirportCardHome extends StatefulWidget {
  final AirportModel airport;

  const AirportCardHome({super.key, required this.airport});

  @override
  AirportCardState createState() => AirportCardState();

 /*  @override
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
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  )
                else
                  const Icon(
                    Icons.connecting_airports,
                    size: 50,
                    color: Colors.black,
                  ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      airport.name ?? '',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text('${airport.iataCode} / ${airport.oaciCode}'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  } */
}

class AirportCardState extends State<AirportCardHome> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      },
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        onTap: () async {
          var aircrafts = await ProcedureService.getAircraftsByAirport(widget.airport.id!);
          final ListAircraftsHomeController controller = Get.put(ListAircraftsHomeController());
          controller.aircrafts.value = aircrafts;
          controller.airport.value = widget.airport;
          Get.toNamed(Routes.homeAircrafts);
        },
        child: SizedBox(
          width: 330,
          child: Card(
            color: const Color.fromRGBO(230, 238, 246, 1),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(
                color: isHovered ? Theme.of(context).primaryColor : Colors.transparent,
                width: 2.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: widget.airport.profileImage != null
                          ? Image.network(
                              widget.airport.profileImage!,
                              fit: BoxFit.cover,
                            )
                          : const Icon(Icons.connecting_airports, size: 50),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.airport.name}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${widget.airport.iataCode} / ${widget.airport.oaciCode}',
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}