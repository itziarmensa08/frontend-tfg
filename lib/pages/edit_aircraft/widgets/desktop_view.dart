import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/services/aircraft.service.dart';
import 'package:frontend_tfg/data/services/cloudinary.service.dart';
import 'package:frontend_tfg/general_widgets/alert.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';
import 'package:frontend_tfg/pages/edit_aircraft/edit_aircraft.binding.dart';
import 'package:frontend_tfg/pages/edit_aircraft/edit_aircraft.controller.dart';
import 'package:frontend_tfg/pages/edit_aircraft/widgets/edit_aircraft_form.dart';
import 'package:frontend_tfg/pages/edit_aircraft/widgets/view_aircraft_form.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

Widget desktopView(double height, BuildContext context, TickerProviderStateMixin page) {
  final EditAircraftController controller = Get.put(EditAircraftController());
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if(tabs.length > 5)
      CustomTabBar(page: page, number: 5),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 30.0),
        child: Obx(() {
          final String userName = '${controller.aircraft.value.name}';

          return RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),
              children: [
                TextSpan(
                  text: 'admin'.tr,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.toNamed(Routes.admin);
                    },
                ),
                TextSpan(
                  text: ' > ',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),
                ),
                TextSpan(
                  text: 'aircraftsList'.tr,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.toNamed(Routes.listAircrafts);
                    },
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),
                ),
                TextSpan(
                  text: ' > ',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),
                ),
                TextSpan(
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),
                  text: userName,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {},
                ),
              ],
            ),
          );
        }),
      ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.15),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Obx(() => CircleAvatar(
                    radius: 50.0,
                    child: controller.profileImage.value != null
                      ? ClipOval(
                          child: Image.network(
                            controller.profileImage.value!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Icon(Icons.airplanemode_active, size: 70.0),
                  )),
                  const SizedBox(height: 20),
                  Obx(() =>
                    Text('${controller.aircraft.value.name}', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      ElevatedButton(onPressed: (){
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
                      }, child: Text('editData'.tr)),
                      const SizedBox(width: 20),
                      ElevatedButton(onPressed: () async {
                        final file = await ImagePicker().pickImage(source: ImageSource.gallery);
                        final imagesSingleton = ImagesSingleton.getInstance();
                        final secureUrl = await imagesSingleton.uploadPhoto(
                          file!,
                          'aircrafts',
                          controller.aircraft.value.id!,
                        );
                        if (secureUrl != null) {
                          controller.aircraft.value.profileImage = secureUrl;
                          await AircraftService.updateAircraft(controller.aircraft.value.id!, controller.aircraft.value);
                          EditAircraftBinding.updateAircraftData();
                        } else {
                          ToastUtils.showErrorToast('errorCloudinary'.tr);
                        }
                      }, child: Text('editPhoto'.tr)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(onPressed: () async {
                    showAlert(
                      context,
                      'deleteAircraft'.tr,
                      'confirmDeleteAircraft'.tr,
                      'yes'.tr,
                      'no'.tr,
                      const Color.fromRGBO(255, 0, 0, 1),
                      const Color.fromARGB(255, 255, 255, 255),
                      () async {
                        await AircraftService.deleteAircraft(controller.aircraft.value.id!);
                        Get.toNamed(Routes.admin);
                      },
                      () {
                        Navigator.of(context).pop();
                      }
                    );
                  }, child: Text('deleteAircraft'.tr, style: const TextStyle(color: Color.fromRGBO(255, 0, 0, 1)),)),
                ],
              ),
              const SizedBox(width: 100),
              SizedBox(
                width: 400,
                child: ViewAircraftForm(),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
