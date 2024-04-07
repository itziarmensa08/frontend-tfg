import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/services/airport.service.dart';
import 'package:frontend_tfg/data/services/cloudinary.service.dart';
import 'package:frontend_tfg/general_widgets/alert.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';
import 'package:frontend_tfg/pages/edit_airport/edit_airport.binding.dart';
import 'package:frontend_tfg/pages/edit_airport/edit_airport.controller.dart';
import 'package:frontend_tfg/pages/edit_airport/widgets/edit_airport.form.dart';
import 'package:frontend_tfg/pages/edit_airport/widgets/view_airport_form.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

Widget mobileView(double width, GlobalKey<ScaffoldState> scaffoldKey, BuildContext context) {
  final EditAirportController controller = Get.put(EditAirportController());
  return Padding(
    padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05 ),
    child: SizedBox(
      width: width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    Text('${controller.airport.value.name}', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(onPressed: () async {
                    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
                    final imagesSingleton = ImagesSingleton.getInstance();
                    final secureUrl = await imagesSingleton.uploadPhoto(
                      file!,
                      'airports',
                      controller.airport.value.id!,
                    );
                    if (secureUrl != null) {
                      controller.airport.value.profileImage = secureUrl;
                      await AirportService.updateAirport(controller.airport.value.id!, controller.airport.value);
                      EditAirportBinding.updateAirportData();
                    } else {
                      ToastUtils.showErrorToast('errorCloudinary'.tr);
                    }
                  }, child: Text('editPhoto'.tr)),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 400,
                child: ViewAirportForm(),
              ),
              const SizedBox(width: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                            child: EditAirportForm()
                          ),
                        );
                      },
                    );
                  }, child: Text('editData'.tr)),
                  const SizedBox(width: 20),
                  ElevatedButton(onPressed: () async {
                    showAlert(
                      context,
                      'deleteAirport'.tr,
                      'confirmDeleteAirport'.tr,
                      'yes'.tr,
                      'no'.tr,
                      const Color.fromRGBO(255, 0, 0, 1),
                      const Color.fromARGB(255, 255, 255, 255),
                      () async {
                        await AirportService.deleteAirport(controller.airport.value.id!);
                        Get.toNamed(Routes.admin);
                      },
                      () {
                        Navigator.of(context).pop();
                      }
                    );
                  }, child: Text('deleteAirport'.tr, style: const TextStyle(color: Color.fromRGBO(255, 0, 0, 1)),)),
                ],
              )
            ],
          )
          ],
        ),
      ),
    ),
  );
}


