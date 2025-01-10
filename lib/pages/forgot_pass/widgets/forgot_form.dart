
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/services/user.service.dart';
import 'package:frontend_tfg/pages/forgot_pass/forgot.controller.dart';
import 'package:get/get.dart';


class ForgotForm extends Container {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = Get.put(ForgotPassController());

  ForgotForm({super.key});

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'enterText'.tr;
    } else {
      //const pattern = r'\b[A-Za-z0-9._%+-]+@flightlinebcn\.com\b';
      const pattern = r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$';
      if (!RegExp(pattern).hasMatch(value)) {
        return 'validEmail'.tr;
      }
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
            controller: controller.email,
            decoration: InputDecoration(
              labelText: 'email'.tr,
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
              suffixIcon: const Icon(Icons.mail),
            ),
            validator: (value) => emailValidator(value),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                await UserService.forgotPassword(controller.email.text);
              }
            },
            child: Text('send'.tr),
          ),
        ],
      )
    );
  }
}