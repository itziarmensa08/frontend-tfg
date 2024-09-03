import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/procedure.model.dart';

class ProcedureCardHome extends StatelessWidget {
  final Procedure procedure;

  const ProcedureCardHome({super.key, required this.procedure});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () async {
          // Action to perform when the card is clicked
          print('Card clicked for ${procedure.rwyName}'); // Example: Print airport name to console
          // You can also navigate to another screen or show a dialog
          // Navigator.push(context, MaterialPageRoute(builder: (context) => AirportDetailsPage(airport: airport)));
        },
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Icon(
                  Icons.library_books_outlined, // Plane icon when no image is available
                  size: 50,
                  color: Colors.black,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      procedure.rwyName ?? '',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text('${procedure.dpName}'),
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