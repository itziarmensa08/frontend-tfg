import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/services/user.service.dart';
import 'package:frontend_tfg/general_widgets/alert.dart';
import 'package:frontend_tfg/pages/login/login.controller.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = Get.put(LoginController());
  var notFound = false;
  var incorrectPass = false;
  var unexpected = false;

  LoginForm({super.key});

  String? validatorUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'enterText'.tr;
    } else if (notFound) {
      return 'Not found user'.tr;
    }
    return null;
  }

  String? validatorPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'enterText'.tr;
    } else if (incorrectPass) {
      return 'Incorrect password'.tr;
    }
    return null;
  }

  Future<String?> loginValidator(BuildContext context) async {
    var response = await UserService.login(controller.username.text, controller.password.text);
    if (response == 'Not found user') {
      notFound = true;
      return null;
    }
    if (response == 'Incorrect password') {
      incorrectPass = true;
      return null;
    }
    if (response == 'notValidated') {
      showAlert(
        context,
        'notValidated'.tr,
        'notValidatedMessage'.tr,
        'yes'.tr,
        'no'.tr,
        const Color.fromRGBO(255, 179, 102, 1),
        const Color.fromARGB(255, 255, 255, 255),
        () async {
          Navigator.of(context).pop();
          await UserService.resendValidation(controller.username.text);
        },
        () {
          Navigator.of(context).pop();
        }
      );
      return null;
    }
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: controller.username,
            decoration: InputDecoration(
              labelText: 'username'.tr,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              suffixIcon: const Icon(Icons.person),
            ),
            validator: (value) => validatorUsername(value),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: controller.password,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'pass'.tr,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              suffixIcon: const Icon(Icons.key),
            ),
            validator: (value) => validatorPassword(value),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () async {
              var response = await loginValidator(context);
              if (_formKey.currentState!.validate()) {
                if (response == '200') Get.toNamed(Routes.home);
              }
            },
            child: Text('getIn'.tr),
          ),
        ],
      ),
    );
  }
}