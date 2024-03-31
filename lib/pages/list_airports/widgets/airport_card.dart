import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/airport_model.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';

class AirportCard extends StatefulWidget {
  final AirportModel airport;

  const AirportCard({super.key, required this.airport});

  @override
  AirportCardState createState() => AirportCardState();
}

class AirportCardState extends State<AirportCard> {
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
        onTap: () {
          Get.toNamed(
            Routes.editAirport,
            arguments: {
              'id': widget.airport.id,
            },
          );
        },
        child: SizedBox(
          width: 330,
          child: Card(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 300,
                    height: 200,
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
                          : const Icon(Icons.connecting_airports, size: 80),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '${widget.airport.name}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${widget.airport.iataCode} / ${widget.airport.oaciCode}',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
