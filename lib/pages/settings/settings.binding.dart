

import 'package:frontend_tfg/pages/settings/settings.controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    final SettingsController controller = Get.put(SettingsController());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    String? profileImage = prefs.getString('profileImage');
    if (username != null) controller.username.value = username;
    if (profileImage != null) controller.profileImage.value = profileImage;
  }
}