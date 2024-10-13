import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/services/procedure.service.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';
import 'package:frontend_tfg/pages/home/list_procedures/list_procedures.controller.dart';
import 'package:frontend_tfg/pages/home/list_procedures/widgets/procedure_card.dart';
import 'package:frontend_tfg/pages/home/write_procedure/write_procedure.controller.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

Widget desktopView(double height, TickerProviderStateMixin page, BuildContext context,) {
  final ListProceduresHomeController controller = Get.put(ListProceduresHomeController());

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomTabBar(page: page, number: 0),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 30.0),
        child: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),
            children: [
              TextSpan(
                text: 'airportsList'.tr,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.toNamed(Routes.home);
                  },
              ),
              TextSpan(text: ' > ', style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),),
              TextSpan(
                style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),
                text: controller.airport.value.name,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.toNamed(Routes.homeAircrafts);
                  },
              ),
              TextSpan(text: ' > ', style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),),
              TextSpan(
                style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),
                text: controller.aircraft.value.name,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {},
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 20),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'procedureListProc1'.tr,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).primaryColor),
                      ),
                      TextSpan(
                        text: controller.airport.value.name ?? '',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextSpan(
                        text: 'procedureListProc2'.tr,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).primaryColor),
                      ),
                      TextSpan(
                        text: controller.aircraft.value.name ?? '',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextSpan(
                        text: ':',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
              if (controller.procedures.length > 1)
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final WriteProcedureController controllerWrite = Get.put(WriteProcedureController());
                        controllerWrite.aircraft = controller.aircraft;
                        controllerWrite.airport = controller.airport;
                        controllerWrite.procedures = controller.procedures;
                        Get.toNamed(Routes.homeProcedureWrite);
                      },
                      child: Text('writeProcedure'.tr),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              if (controller.procedures.length > 1)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        );

                        try {
                          List<String?> ids = controller.procedures.map((procedure) => procedure.id).toList();
                          var url = await ProcedureService.downloadPdfProcedureCombined(ids);

                          final Uri uri = Uri.parse(url['url']);
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri);
                          } else {
                            throw 'Cannot open the URL: $uri';
                          }
                        } catch (e) {
                          print('Error merging procedures: $e');
                        } finally {
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text('mergeProcedures'.tr),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.procedures.length,
                    itemBuilder: (context, index) {
                      final procedure = controller.procedures[index];
                      return ProcedureCardHome(
                        procedure: procedure
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
