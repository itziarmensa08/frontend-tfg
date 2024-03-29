import 'dart:convert';

import 'package:frontend_tfg/data/models/auth.model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenBinding implements Bindings {

  @override
  Future<void> dependencies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? authJson = prefs.getString('auth');
    if (authJson != null) {
      Map<String, dynamic> authMap = jsonDecode(authJson);
      Auth.fromJson(authMap);
    }
  }

}