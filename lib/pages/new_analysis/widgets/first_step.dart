
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:frontend_tfg/data/models/aircraft_model.dart';
import 'package:frontend_tfg/data/models/airport_model.dart';
import 'package:frontend_tfg/data/services/image.service.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/edit_aircraft_form.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/edit_airport_form.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/view_aircraft_form.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/view_airport_form.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/add_airport_form.dart';
import 'package:frontend_tfg/pages/new_analysis/new_analysis.controller.dart';
import 'package:get/get.dart';

class FirstStep extends StatelessWidget {
  const FirstStep({Key? key, required this.controller}) : super(key: key);

  final NewAnalaysisController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('selectAirport'.tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 20),
            Expanded(
              child: Autocomplete<AirportModel>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  return controller.airports.where((AirportModel airport) {
                    return airport.name!.toLowerCase().contains(textEditingValue.text.toLowerCase()) ||
                          airport.oaciCode!.toLowerCase().contains(textEditingValue.text.toLowerCase()) ||
                          airport.iataCode!.toLowerCase().contains(textEditingValue.text.toLowerCase());
                  }).toList();
                },
                onSelected: (AirportModel? newValue) {
                  if (newValue != null) {
                    controller.selectedAirport.value = newValue;
                    controller.airportCorrect.value = false;
                    asignAirportData(controller);
                  }
                },
                displayStringForOption: (AirportModel option) => option.name ?? '',
                fieldViewBuilder: (BuildContext context, TextEditingController fieldTextEditingController, FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
                  return Obx(() => TextFormField(
                    controller: fieldTextEditingController,
                    focusNode: fieldFocusNode,
                    decoration: InputDecoration(
                      hintText: controller.selectedAirport.value == null ? 'searchAirport'.tr : controller.selectedAirport.value?.name,
                      hintStyle: Theme.of(context).textTheme.titleMedium,
                      border: const OutlineInputBorder(),
                    ),
                  ));
                },
              ),
            ),
            const SizedBox(width: 20),
            Text('selectAircraft'.tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 20),
            Expanded(
              child: Autocomplete<AircraftModel>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  return controller.aircrafts.where((AircraftModel aircraft) {
                    return aircraft.name!.toLowerCase().contains(textEditingValue.text.toLowerCase()) ||
                          aircraft.metro!.toLowerCase().contains(textEditingValue.text.toLowerCase());
                  }).toList();
                },
                onSelected: (AircraftModel? newValue) {
                  if (newValue != null) {
                    controller.selectedAircraft.value = newValue;
                    controller.aircraftCorrect.value = false;
                    asignAircraftData(controller);
                  }
                },
                displayStringForOption: (AircraftModel option) => option.name ?? '',
                fieldViewBuilder: (BuildContext context, TextEditingController fieldTextEditingController, FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
                  return TextFormField(
                    controller: fieldTextEditingController,
                    focusNode: fieldFocusNode,
                    decoration: InputDecoration(
                      hintText: 'searchAircraft'.tr,
                      hintStyle: Theme.of(context).textTheme.titleMedium,
                      border: const OutlineInputBorder(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Obx(() => Visibility(
          visible: controller.airportCorrect.value == false,
          child: Row(
            children: [
              Text('notAirport'.tr, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(width: 5),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Column(
                            children: [
                              const SizedBox(height: 30),
                              const CircleAvatar(
                                radius: 50.0,
                                child: Icon(Icons.connecting_airports, size: 70.0),
                              ),
                              const SizedBox(height: 40),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: AddAirportForm()
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    'here'.tr,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.blue)
                  ),
                ),
              ),
            ],
          ),
        )),
        Obx(() => Visibility(
          visible: controller.selectedAirport.value != null && controller.selectedAircraft.value != null && controller.airportCorrect.value == false,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  Text('correctAirport'.tr, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(width: 20),
                  ElevatedButton(onPressed: () {
                    controller.airportCorrect.value = true;
                    controller.newProcedure.value.airport = controller.selectedAirport.value!.id;
                    print(controller.newProcedure.value.toJson());
                  }, child: Text('yes'.tr)),
                  const SizedBox(width: 20),
                  ElevatedButton(onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          scrollable: true,
                          title: Text('editData'.tr),
                          content: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: EditAirportForm()
                          ),
                        );
                      },
                    );
                  }, child: Text('no'.tr))
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: ViewAirportForm()
              ),
            ],
          )
        )),
        Obx(() => Visibility(
          visible: controller.selectedAirport.value != null && controller.selectedAircraft.value != null && controller.aircraftCorrect.value == false,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  Text('correctAircraft'.tr, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(width: 20),
                  ElevatedButton(onPressed: () {
                    controller.aircraftCorrect.value = true;
                    controller.newProcedure.value.aircraft = controller.selectedAircraft.value!.id;
                    print(controller.newProcedure.value.toJson());
                  }, child: Text('yes'.tr)),
                  const SizedBox(width: 20),
                  ElevatedButton(onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          scrollable: true,
                          title: Text('editData'.tr),
                          content: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: EditAircraftForm()
                          ),
                        );
                      },
                    );
                  }, child: Text('no'.tr))
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: ViewAircraftForm()
              ),
            ],
          )
        )),
        Obx(() => Visibility(
          visible: controller.aircraftCorrect.value == true && controller.airportCorrect.value == true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  Text('tookDocs'.tr, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(width: 5),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        launchForeFlight();
                      },
                      child: Text(
                        'ForeFlight',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.blue)
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text('foreflight'.tr, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(width: 5),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        launchAPG();
                      },
                      child: Text(
                        'APG',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.blue)
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text('apg'.tr, style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
              const SizedBox(height: 20),
              Text('apg2'.tr, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Obx(() {
                      if (controller.newProcedure.value.sidDoc == null) {
                        return ElevatedButton(onPressed: () async {
                          var result = await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['pdf'],
                          );
                          if (result != null) {
                            PlatformFile file = result.files.first;
                            final imagesSingleton = ImagesSingleton.getInstance();
                            final secureUrl = await imagesSingleton.uploadPdf(
                              file,
                              'sids',
                              file.name,
                            );
                            if (secureUrl != null) {
                              controller.newProcedure.value.sidDoc = secureUrl;
                            } else {
                              ToastUtils.showErrorToast(context, 'errorCloudinary'.tr);
                            }
                          }
                        }, child: Text('Subir ficha SID'));
                      } else {
                        return PDFView(
                          filePath: controller.newProcedure.value.sidDoc,
                          enableSwipe: true,
                          swipeHorizontal: true,
                          autoSpacing: false,
                          pageFling: false,
                          onRender: (_pages) {
                            
                          },
                          onError: (error) {
                            print(error.toString());
                          },
                          onPageError: (page, error) {
                            print('$page: ${error.toString()}');
                          },
                          onViewCreated: (PDFViewController pdfViewController) {
                            
                          },
                          onPageChanged: (int? page, int? total) {
                            print('page change: $page/$total');
                          },
                        );
                      }
                    })
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ElevatedButton(onPressed: (){}, child: Text('Subir RWY analysis'))
                  )
                ],
              )
            ],
          ),
        ))
      ],
    );
  }
}
