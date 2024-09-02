import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/airport_model.dart';

class AirportCardHome extends StatelessWidget {
  final AirportModel airport;

  const AirportCardHome({super.key, required this.airport});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () {
          // Action to perform when the card is clicked
          print('Card clicked for ${airport.name}'); // Example: Print airport name to console
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
                if (airport.profileImage != null)
                  Image.network(
                    airport.profileImage!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )
                else
                  Icon(
                    Icons.connecting_airports, // Plane icon when no image is available
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