
import 'package:frontend_tfg/data/models/crew_procedure.dart';
import 'package:frontend_tfg/data/models/procedure.model.dart';
import 'package:frontend_tfg/pages/home/write_procedure/write_procedure.controller.dart';
import 'package:get/get.dart';

class WriteProcedureBinding implements Bindings {

  @override
  void dependencies() {
    final WriteProcedureController controller = Get.put(WriteProcedureController());
    _initializeCrewProcedure(controller);
  }

  void _initializeCrewProcedure(WriteProcedureController controller) {
    // Filtra y organiza los procedimientos para construir el objeto CrewProcedure
    controller.crewProcedure.value = CrewProcedure(
      airport: controller.airport.value.id, // Asigna el valor correspondiente de tu backend o datos
      aircraft: controller.aircraft.value.id, // Asigna el valor correspondiente de tu backend o datos
      proceduresRWY: _buildProceduresRWY(controller),
    );

  }

  List<ProcedureRWY> _buildProceduresRWY(WriteProcedureController controller) {
    Map<String, List<Procedure>> proceduresByRunway = {};

    for (var procedure in controller.procedures) {
      bool hasClearDP = procedure.nMotors?.firstSegment?.clearDP == true ||
                        procedure.nMotors?.secondSegment?.clearDP == true ||
                        procedure.nMotors?.thirdSegment?.clearDP == true;

      if (hasClearDP && procedure.rwyName != null) {
        proceduresByRunway.putIfAbsent(procedure.rwyName!, () => []).add(procedure);
      }
    }

    return proceduresByRunway.entries.map((entry) {
      return ProcedureRWY(
        rwy: entry.key,
        procedures: entry.value.map((procedure) {
          return ProcedureDetails(
            sids: procedure.sidName ?? '',
            procedure: procedure.procedureN ?? '',
          );
        }).toList(),
      );
    }).toList();
  }


}