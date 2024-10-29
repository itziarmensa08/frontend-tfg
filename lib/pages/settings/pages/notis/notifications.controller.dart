

import 'package:get/get.dart';

class NotisController extends GetxController {
  var notificationsEnabled = true.obs;

  void toggleNotifications(bool value) {
    notificationsEnabled(value);
  }
}