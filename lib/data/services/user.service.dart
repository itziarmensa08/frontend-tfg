
import 'package:frontend_tfg/data/models/auth.model.dart';
import 'package:frontend_tfg/data/models/user.model.dart';
import 'package:frontend_tfg/data/provider/api.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {

  getUserLogged() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('id');
    await Future.delayed(const Duration(seconds: 2));
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
        Auth.id = userModel.id!;
        Auth.language = userModel.language!;
        if (userModel.role == 'admin') {
          Auth.isAdmin = true;
        } else {
          Auth.isAdmin = false;
        }
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
        ToastUtils.showErrorToast(response.data);
      }
    } catch (error) {
      ToastUtils.showErrorToast('Error Login: $error');
    }
    return null;
  }

  static Future<void> register(UserModel user) async {
    ApiResponse response;

    try {
      response = await MyApi().post(
        '/auth/register',
        data: user.toJson()
      );

      if (response.statusCode == 201) {
        ToastUtils.showSuccessToast('successRegister'.tr);
      } else {
        ToastUtils.showErrorToast('${response.data}'.tr);
      }
    } catch (error) {
      ToastUtils.showErrorToast('Error Register: $error');
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

}