
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/services/user.service.dart';
import 'package:frontend_tfg/pages/restore_pass/restore.controller..dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';


class RestoreForm extends Container {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = Get.put(RestorePassController());

  RestoreForm({super.key});

  String? passwordValidator (String? value1, String? value2) {
    if (value1 == null || value1.isEmpty)  {
      return 'enterText'.tr;
    } else if (value1.length < 7)  {
      return 'longPass'.tr;
    } else if (value1 != value2) {
      return 'equalPass'.tr;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: controller.pass1,
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
              suffixIcon: const Icon(Icons.key)
            ),
            validator: (value) => passwordValidator(value, controller.pass2.text),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: controller.pass2,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'repeatPass'.tr,
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
              suffixIcon: const Icon(Icons.key)
            ),
            validator: (value) => passwordValidator(value, controller.pass1.text),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                if (controller.userId.isNotEmpty) {
                  var success = await UserService.restorePassword(controller.userId.value, controller.pass1.text);
                  if (success) Get.toNamed(Routes.login);
                }
              }
            },
            child: Text('send'.tr),
          ),
        ],
      )
    );
  }
}