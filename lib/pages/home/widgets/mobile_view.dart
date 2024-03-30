import 'package:flutter/material.dart';

Widget mobileView(double width, GlobalKey<ScaffoldState> scaffoldKey, BuildContext context) {
  TextEditingController searchController = TextEditingController();
  return Padding(
    padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05 ),
    child: SizedBox(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start, // Alinea los elementos a la izquierda
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                iconSize: width * 0.08,
                onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
                icon: const Icon(Icons.menu_rounded),
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Buscar...',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
                onSubmitted: (value) {
                  // Aquí puedes manejar la búsqueda
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
