import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/user.model.dart';
import 'package:frontend_tfg/data/services/cloudinary.service.dart';
import 'package:frontend_tfg/data/services/user.service.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';
import 'package:frontend_tfg/pages/profile/profile.binding.dart';
import 'package:frontend_tfg/pages/profile/profile.controller.dart';
import 'package:frontend_tfg/pages/profile/widgets/edit_user_form.dart';
import 'package:frontend_tfg/pages/profile/widgets/view_user_form.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget mobileView(double width, GlobalKey<ScaffoldState> scaffoldKey, BuildContext context) {
  final ProfileController controller = Get.put(ProfileController());
  return Padding(
    padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05 ),
    child: SizedBox(
      width: width,
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
                      await UserService.updateUser(controller.user.value.id!, updatedModel);
                      ProfileBinding.updateUserData();
                    } else {
                      ToastUtils.showErrorToast('errorCloudinary'.tr);
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
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.remove('token');
                    prefs.remove('id');
                    prefs.remove('language');
                    prefs.remove('isAdmin');
                    Get.toNamed(Routes.login);
                  }, child: Text('signOut'.tr, style: const TextStyle(color: Color.fromRGBO(255, 0, 0, 1)),)),
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}
