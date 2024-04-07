
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/services/user.service.dart';
import 'package:frontend_tfg/pages/login/login.controller.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';
import 'dart:async';


class LoginForm extends Container {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = Get.put(LoginController());

  LoginForm({super.key});

  Future<String?> validatorUsername (String? value) async {
    if (value == null || value.isEmpty)  {
      return 'enterText'.tr;
    } else {
      var response = await UserService.login(controller.username.text, controller.password.text);
      if (response == 'Not found user') {
        return 'Not found user'.tr;
      }
    }
    return null;
  }

  Future<String?> validatorPassword (String? value) async {
    if (value == null || value.isEmpty)  {
      return 'enterText'.tr;
    } else {
      var response = await UserService.login(controller.username.text, controller.password.text);
      if (response == 'Incorrect password') {
        return 'Incorrect password'.tr;
      }
    }
    return null;
  }

  late String? validateUsername;
  late String? validatePassword;

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
            onChanged: (value) async {
              validateUsername = await validatorUsername(value);
            },
            validator: (_) {
              if (validateUsername != null) {
                return validateUsername;
              }
              return null;
            },
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
            onChanged: (value) async {
              validatePassword = await validatorPassword(value);
            },
            validator: (value) {
              if (validatePassword != null) {
                return validatePassword;
              }
              return null;
            },
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () async {
              validateUsername = await validatorUsername(controller.username.text);
              validatePassword = await validatorPassword(controller.password.text);
              if (_formKey.currentState!.validate()) {
                var login = await UserService.login(controller.username.text, controller.password.text);
                if (login == '200') {
                  Get.toNamed(Routes.home);
                }
              }
            },
            child: Text('getIn'.tr),
          ),
        ],
      )
    );
  }
}