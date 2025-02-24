
import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/auth.model.dart';
import 'package:frontend_tfg/data/models/user.model.dart';
import 'package:frontend_tfg/data/provider/api.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {

  getUserLoggedSplash() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('id');
    await Future.delayed(const Duration(seconds: 2));
    if (userId != null) {
      String? username = prefs.getString('username');
      Auth.username = username;
      return true;
    } else {
      return false;
    }
  }

  getUserLogged() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('id');
    if (userId != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<String?> login(String? username, String? password) async {
    ApiResponse response;

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
        Auth.token = data['token'];
        Auth.id = userModel.id;
        Auth.language = userModel.language;
        Auth.username = userModel.username;
        Get.updateLocale(Locale(userModel.language ?? 'es'));
        if (userModel.role == 'admin') {
          Auth.isAdmin = true;
        } else {
          Auth.isAdmin = false;
        }
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', data['token']);
        prefs.setString('id', userModel.id ?? '');
        prefs.setString('language', userModel.language ?? 'es');
        prefs.setString('username', userModel.username ?? '');
        prefs.setString('profileImage', userModel.profileImage ?? '');
        if (userModel.role == 'admin') {
          prefs.setBool('isAdmin', true);
        } else {
          prefs.setBool('isAdmin', false);
        }
        return response.statusCode.toString();

      } else if (response.statusCode == 404 ||  response.statusCode == 400) {
        return response.data;
      } else if (response.statusCode == 401) {
        //ToastUtils.showErrorToast('notValidated'.tr);
        return 'notValidated';
      } else {
        ToastUtils.showErrorToast(response.data);
        return null;
      }
    } catch (error) {
      ToastUtils.showErrorToast('Error Login: $error');
      return null;
    }
  }

  static Future<bool> register(UserModel user) async {
    ApiResponse response;

    try {
      response = await MyApi().post(
        '/auth/register',
        data: user.toJson()
      );

      if (response.statusCode == 201) {
        ToastUtils.showSuccessToast('successRegister'.tr);
        return true;
      } else {
        ToastUtils.showErrorToast('${response.data}'.tr);
        return false;
      }
    } catch (error) {
      ToastUtils.showErrorToast('Error Register: $error');
      return false;
    }
  }

  static Future<List<UserModel>?> getUsers() async {
    ApiResponse response;

    try {
      response = await MyApi().get('/users');

      if (response.statusCode == 200) {
        dynamic data = response.data;
        List<UserModel> users = [];
        for (var user in data) {
          users.add(UserModel.fromJson(user));
        }

        return users;

      } else {
        ToastUtils.showErrorToast(response.data);
      }
    } catch (error) {
      ToastUtils.showErrorToast('Error GetUsers: $error');
    }
    return null;
  }

  static Future<UserModel?> getUserById(String userId) async {
    ApiResponse response;

    try {
      response = await MyApi().get('/users/$userId');

      if (response.statusCode == 200) {
        dynamic data = response.data;
        UserModel user = UserModel.fromJson(data);
        return user;
      } else {
        ToastUtils.showErrorToast(response.data);
      }
    } catch (error) {
      ToastUtils.showErrorToast('Error GetUser: $error');
    }
    return null;
  }

  static Future<bool?> updateUser(String userId, UserModel user) async {
    ApiResponse response;

    try {
      response = await MyApi().put(
        '/users/$userId',
        data: user.toJson()
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        ToastUtils.showErrorToast(response.data);
      }
    } catch (error) {
      ToastUtils.showErrorToast('Error UpdateUser: $error');
    }
    return null;
  }

  static Future<void> deleteUser(String idUser) async {
    ApiResponse response;

    try {
      response = await MyApi().delete('/users/$idUser');

      if (response.statusCode == 200) {
        ToastUtils.showSuccessToast('userDeleted'.tr);
      } else {
        ToastUtils.showErrorToast(response.data);
      }
    } catch (error) {
      ToastUtils.showErrorToast('Error DeleteUser: $error');
    }
  }

  static Future<void> validate(String id) async {
    ApiResponse response;

    try {
      response = await MyApi().put(
        '/auth/validate/$id',
      );

      if (response.statusCode == 200) {
        ToastUtils.showSuccessToast('successValidate'.tr);
      } else {
        ToastUtils.showErrorToast('${response.data}'.tr);
      }
    } catch (error) {
      ToastUtils.showErrorToast('Error Validate: $error');
    }
  }

  static Future<bool?> assignTask(String idUser, Event task) async {
    ApiResponse response;

    try {
      response = await MyApi().put('/users/tasks/$idUser', data: task.toJson());

      if (response.statusCode == 200) {
        return true;
      } else {
        ToastUtils.showErrorToast(response.data);
      }
    } catch (error) {
      ToastUtils.showErrorToast('Error AssignTask: $error');
    }
    return null;
  }

  static Future<bool?> completeTask(String idUser, String idTask) async {
    ApiResponse response;

    try {
      response = await MyApi().put('/users/tasks/$idUser/$idTask');

      if (response.statusCode == 200) {
        return true;
      } else {
        ToastUtils.showErrorToast(response.data);
      }
    } catch (error) {
      ToastUtils.showErrorToast('Error AssignTask: $error');
    }
    return null;
  }

  static Future<void> resendValidation(String username) async {
    ApiResponse response;

    try {
      response = await MyApi().put(
        '/auth/resend/validation',
        data: {
          'username': username
        }
      );

      if (response.statusCode == 200) {
        ToastUtils.showSuccessToast('successResend'.tr);
      } else {
        ToastUtils.showErrorToast('${response.data}'.tr);
      }
    } catch (error) {
      ToastUtils.showErrorToast('Error resend: $error');
    }
  }

  static Future<void> forgotPassword(String email) async {
    ApiResponse response;

    try {
      response = await MyApi().put(
        '/auth/forgot',
        data: {
          'email': email
        }
      );

      if (response.statusCode == 200) {
        ToastUtils.showSuccessToast('successResend'.tr);
      } else {
        ToastUtils.showErrorToast('${response.data}'.tr);
      }
    } catch (error) {
      ToastUtils.showErrorToast('Error forgot: $error');
    }
  }

  static Future<bool> restorePassword(String userId, String password) async {
    ApiResponse response;

    try {
      response = await MyApi().put(
        '/auth/restore/password/$userId',
        data: {
          'password': password
        }
      );

      if (response.statusCode == 200) {
        ToastUtils.showSuccessToast('successChangePass'.tr);
        return true;
      } else {
        ToastUtils.showErrorToast('${response.data}'.tr);
      }
    } catch (error) {
      ToastUtils.showErrorToast('Error restore: $error');
    }
    return false;
  }

}