import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/user.model.dart';

class UserCard extends StatefulWidget {
  final UserModel user;

  const UserCard({super.key, required this.user});

  @override
  UserCardState createState() => UserCardState();
}

class UserCardState extends State<UserCard> {
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
          // Add onTap functionality if needed
        },
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color: isHovered ? Theme.of(context).primaryColor : Colors.transparent, // Cambia el color del borde al pasar el ratón
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
                    child: widget.user.profileImage != null
                        ? Image.network(
                            widget.user.profileImage!,
                            fit: BoxFit.cover,
                          )
                        : const Icon(Icons.person, size: 80),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  '${widget.user.name} ${widget.user.surname}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.user.email!,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
