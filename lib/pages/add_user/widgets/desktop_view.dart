import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';
import 'package:frontend_tfg/general_widgets/user_profile.dart';
import 'package:frontend_tfg/pages/add_user/widgets/add_user_form.dart';
import 'package:frontend_tfg/pages/admin/admin.controller.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';

Widget desktopView(double height, BuildContext context, TickerProviderStateMixin page) {
  final AdminController controller = Get.put(AdminController());
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Obx(() => UserProfileWidget(
        username: controller.username.value,
        profileImageUrl: controller.profileImage.value.isNotEmpty ? controller.profileImage.value : null
      )),
      if(tabs.length > 5)
      CustomTabBar(page: page, number: 5),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 30.0, bottom: 30.0),
        child: RichText(
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
              TextSpan(text: ' > ', style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),),
              TextSpan(
                style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),
                text: 'addUserTitle'.tr,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {},
              )
            ],
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    const CircleAvatar(
                      radius: 50.0,
                      child: Icon(Icons.person, size: 70.0),
                    ),
                    const SizedBox(height: 40),
                    AddUserForm(),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          )
        ),
      ),
    ],
  );
}
