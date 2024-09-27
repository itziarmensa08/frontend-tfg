import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/user.model.dart';
import 'package:frontend_tfg/data/services/cloudinary.service.dart';
import 'package:frontend_tfg/data/services/user.service.dart';
import 'package:frontend_tfg/general_widgets/alert.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';
import 'package:frontend_tfg/pages/edit_user/edit_user.binding.dart';
import 'package:frontend_tfg/pages/edit_user/edit_user.controller.dart';
import 'package:frontend_tfg/pages/edit_user/widgets/assign_task_form.dart';
import 'package:frontend_tfg/pages/edit_user/widgets/edit_user_form.dart';
import 'package:frontend_tfg/pages/edit_user/widgets/view_user_form.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

Widget desktopView(double height, BuildContext context, TickerProviderStateMixin page) {
  final EditUserController controller = Get.put(EditUserController());
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if(tabs.length > 5)
      CustomTabBar(page: page, number: 5),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 30.0),
        child: Obx(() {
          final String userName = '${controller.user.value.name} ${controller.user.value.surname}';

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
                  text: 'usersList'.tr,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.toNamed(Routes.listUsers);
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
                      : const Icon(Icons.person, size: 70.0),
                  )),
                  const SizedBox(height: 20),
                  Obx(() =>
                    Text('${controller.user.value.name} ${controller.user.value.surname}', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),),
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
                                child: EditUserForm()
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
                          'users',
                          controller.user.value.id!,
                        );
                        if (secureUrl != null) {
                          UserModel updatedModel = controller.user.value;
                          updatedModel.profileImage = secureUrl;
                          await UserService.updateUser(controller.user.value.id!, updatedModel);
                          EditUserBinding.updateUserData();
                        } else {
                          ToastUtils.showErrorToast('errorCloudinary'.tr);
                        }
                      }, child: Text('editPhoto'.tr)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          scrollable: true,
                          title: Text('assignTask'.tr),
                          content: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: AssignTaskForm()
                          ),
                        );
                      },
                    );
                  }, child: Text('assignTask'.tr)),
                  const SizedBox(height: 20),
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
                        await UserService.deleteUser(controller.user.value.id!);
                        Get.toNamed(Routes.admin);
                      },
                      () {
                        Navigator.of(context).pop();
                      }
                    );
                  }, child: Text('deleteUser'.tr, style: const TextStyle(color: Color.fromRGBO(255, 0, 0, 1)),)),
                ],
              ),
              const SizedBox(width: 100),
              SizedBox(
                width: 400,
                child: ViewUserForm(),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
