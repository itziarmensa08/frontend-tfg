import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/aircraft_model.dart';

class AircraftCardHome extends StatelessWidget {
  final AircraftModel aircraft;

  const AircraftCardHome({super.key, required this.aircraft});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () async {
          // Action to perform when the card is clicked
          print('Card clicked for ${aircraft.name}'); // Example: Print airport name to console
          // You can also navigate to another screen or show a dialog
          // Navigator.push(context, MaterialPageRoute(builder: (context) => AirportDetailsPage(airport: airport)));
        },
        child: Card(
          elevation: 4,
          margin: EdgeInsets.all(16),
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
                  Icon(
                    Icons.airplane_ticket, // Plane icon when no image is available
                    size: 100,
                    color: Colors.black,
                  ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      aircraft.name ?? '',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
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