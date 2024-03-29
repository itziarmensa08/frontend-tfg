import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/user.model.dart';
import 'package:frontend_tfg/data/services/image.service.dart';
import 'package:frontend_tfg/data/services/user.service.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';
import 'package:frontend_tfg/pages/profile/profile.controller.dart';
import 'package:frontend_tfg/pages/profile/widgets/edit_user_form.dart';
import 'package:frontend_tfg/pages/profile/widgets/view_user_form.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget desktopView(TabController controllerTab, List<ContentView> tabs, double height, BuildContext context) {
  final ProfileController controller = Get.put(ProfileController());
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomTabBar(controller: controllerTab, tabs: tabs),
      const SizedBox(height: 40),
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
                          await UserService.updateUser(context, controller.user.value.id!, updatedModel);
                        } else {
                          ToastUtils.showErrorToast(context, 'errorCloudinary'.tr);
                        }
                      }, child: Text('editPhoto'.tr)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(onPressed: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.remove('token');
                    prefs.remove('id');
                    prefs.remove('language');
                    prefs.remove('isAdmin');
                    Get.toNamed(Routes.login);
                  }, child: Text('signOut'.tr)),
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
