import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/procedure.model.dart';
import 'package:frontend_tfg/pages/home/list_procedures/list_procedures.controller.dart';
import 'package:frontend_tfg/pages/home/procedure_detail/procedure_detail.controller.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';

class ProcedureCardHome extends StatelessWidget {
  final Procedure procedure;

  const ProcedureCardHome({
    super.key,
    required this.procedure,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () async {
          final ProcedureDetailController controller = Get.put(ProcedureDetailController());
          final ListProceduresHomeController controllerAir = Get.put(ListProceduresHomeController());
          controller.aircraft.value = controllerAir.aircraft.value;
          controller.airport.value = controllerAir.airport.value;
          controller.procedure.value = procedure;
          Get.toNamed(Routes.homeProcedureDetail);
        },
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Icon(
                  Icons.library_books_outlined,
                  size: 50,
                  color: Colors.black,
                ),
                const SizedBox(width: 35),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildProcedureDetailColumn('sidName'.tr, procedure.sidName ?? ''),
                      _buildProcedureDetailColumn('rwyName'.tr, procedure.rwyName ?? ''),
                      _buildProcedureDetailColumn('dpName'.tr, procedure.dpName ?? ''),
                    ],
                  ),
                ),
                const SizedBox(width: 35),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProcedureDetailColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$title:'),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}