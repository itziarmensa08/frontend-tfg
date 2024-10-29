
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:frontend_tfg/pages/forgot_pass/forgot.controller.dart';
import 'package:get/get.dart';


class ForgotForm extends Container {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = Get.put(ForgotPassController());

  ForgotForm({super.key});

  validator (String? value) async {
    if (value == null || value.isEmpty)  {
      return 'enterText'.tr;
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
            validator: (value) {
              if (validateUsername != null) {
                return validator(value);
              }
              return null;
            },
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {

              }
            },
            child: Text('send'.tr),
          ),
        ],
      )
    );
  }
}