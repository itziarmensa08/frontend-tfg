
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/services/user.service.dart';
import 'package:frontend_tfg/pages/login/login.controller.dart';
import 'package:frontend_tfg/routes/app_pages.dart';
import 'package:get/get.dart';
import 'dart:async';


class LoginForm extends Container {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = Get.put(LoginController());

  LoginForm({super.key});

  Future<String?> validatorUsername (String? value, BuildContext context) async {
    if (value == null || value.isEmpty)  {
      return 'enterText'.tr;
    } else {
      var response = await UserService.login(controller.username.text, controller.password.text, context);
      if (response == 'Not found user') {
        return 'Not found user'.tr;
      }
    }
    return null;
  }

  Future<String?> validatorPassword (String? value, BuildContext context) async {
    if (value == null || value.isEmpty)  {
      return 'enterText'.tr;
    } else {
      var response = await UserService.login(controller.username.text, controller.password.text, context);
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
              validateUsername = await validatorUsername(value, context);
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
              validatePassword = await validatorPassword(value, context);
            },
            validator: (value) {
              if (validatePassword != null) {
                return validatePassword;
              }
              return null;
            },
          ),
          /*TextFormField(
            controller: controller.username,
            cursorColor: Theme.of(context).hintColor,
            style: textDarkGrayTextStyle,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.background,
              labelText: 'username'.tr,
              labelStyle: textDarkGrayTextStyle,
              floatingLabelStyle: textOrangeTextStyle,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.background,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.background,
                ),
              ),
              suffixIcon: const Icon(Icons.person, color: Color(0xFFCBC8C8),),
            ),
            onChanged: (value) async {
              validateUsername = await validatorUsername(value, context);
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
            cursorColor: Theme.of(context).hintColor,
            style: textDarkGrayTextStyle,
            obscureText: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.background,
              labelText: 'pass'.tr,
              labelStyle: textDarkGrayTextStyle,
              floatingLabelStyle: textOrangeTextStyle,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.background,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.background,
                ),
              ),
              suffixIcon: const Icon(Icons.key, color: Color(0xFFCBC8C8),)
            ),
            onChanged: (value) async {
              validatePassword = await validatorPassword(value, context);
            },
            validator: (value) {
              if (validatePassword != null) {
                return validatePassword;
              }
              return null;
            },
          ),*/
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () async {
              validateUsername = await validatorUsername(controller.username.text, context);
              validatePassword = await validatorPassword(controller.password.text, context);
              if (_formKey.currentState!.validate()) {
                var login = await UserService.login(controller.username.text, controller.password.text, context);
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