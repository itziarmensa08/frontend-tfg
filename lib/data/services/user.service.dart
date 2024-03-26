import 'package:flutter/widgets.dart';
import 'package:frontend_tfg/data/models/user.model.dart';
import 'package:frontend_tfg/data/provider/api.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserService {

  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('id');
    await Future.delayed(const Duration(seconds: 2));
    if (userId != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<String?> login(String? username, String? password, BuildContext context) async {
    ApiResponse response;
    ToastUtils.initFToast(context);

    try {
      response = await MyApi().post(
        '/auth/login',
        data: {
          "username": username,
          "password": password
        },
      );

      if (response.statusCode == 200) {
        dynamic data = response.data;
        UserModel userModel = UserModel.fromJson(data['user']);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', data['token']);
        prefs.setString('id', userModel.id!);
        prefs.setString('language', userModel.language!);
        if (userModel.role == 'admin') {
          prefs.setBool('isAdmin', true);
        } else {
          prefs.setBool('isAdmin', false);
        }
        return response.statusCode.toString();

      } else if (response.statusCode == 404 ||  response.statusCode == 400) {
        return response.data;

      } else {
        ToastUtils.showErrorToast(context, response.data);
      }
    } catch (error) {
      ToastUtils.showErrorToast(context, 'Error Login: $error');
    }
    return null;
  }

}