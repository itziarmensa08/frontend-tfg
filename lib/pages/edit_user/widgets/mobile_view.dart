import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/user.model.dart';
import 'package:frontend_tfg/data/services/image.service.dart';
import 'package:frontend_tfg/data/services/user.service.dart';
import 'package:frontend_tfg/general_widgets/alert.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';
import 'package:frontend_tfg/pages/edit_user/edit_user.controller.dart';
import 'package:frontend_tfg/pages/edit_user/widgets/edit_user_form.dart';
import 'package:frontend_tfg/pages/edit_user/widgets/view_user_form.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

Widget mobileView(double width, GlobalKey<ScaffoldState> scaffoldKey, BuildContext context) {
  final EditUserController controller = Get.put(EditUserController());
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
                    child: controller.user.value.profileImage != null
                      ? ClipOval(
                          child: Image.network(
                            controller.user.value.profileImage!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Icon(Icons.person, size: 70.0),
                  )),
                  const SizedBox(height: 20),
                  Obx(() =>
                    Text('${controller.user.value.name} ${controller.user.value.surname}', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(onPressed: () async {
                    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
                    final imagesSingleton = ImagesSingleton.getInstance();
                    final secureUrl = await imagesSingleton.uploadPhoto(
                      file!,
                      'users',
                      controller.user.value.id!,
                    );
                    if (secureUrl != null) {
                      UserModel updatedModel = controller.user.value;
                      updatedModel.profileImage = secureUrl;
                      await UserService.updateUser(context, controller.user.value.id!, updatedModel);
                      controller.user.value.profileImage = secureUrl;
                    } else {
                      ToastUtils.showErrorToast(context, 'errorCloudinary'.tr);
                    }
                  }, child: Text('editPhoto'.tr)),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 400,
                child: ViewUserForm(),
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
                            child: EditUserForm()
                          ),
                        );
                      },
                    );
                  }, child: Text('editData'.tr)),
                  const SizedBox(width: 20),
                  ElevatedButton(onPressed: () async {
                    showAlert(
                      context,
                      'deleteUser'.tr,
                      'confirmDeleteUser'.tr,
                      'yes'.tr,
                      'no'.tr,
                      const Color.fromRGBO(255, 0, 0, 1),
                      const Color.fromARGB(255, 255, 255, 255),
                      () async {
                        await UserService.deleteUser(context, controller.user.value.id!);
                        Get.toNamed(Routes.admin);
                      },
                      () {
                        Navigator.of(context).pop();
                      }
                    );
                  }, child: Text('deleteUser'.tr, style: const TextStyle(color: Color.fromRGBO(255, 0, 0, 1)),)),
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


Widget drawer (List<Widget> tabs) {
  return Drawer(
    child: ListView(children: tabs),
  );
}

