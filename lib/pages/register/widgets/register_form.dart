import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/user.model.dart';
import 'package:frontend_tfg/data/services/user.service.dart';
import 'package:frontend_tfg/pages/register/register.controller.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterForm extends Container {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = Get.put(RegisterController());

  RegisterForm({super.key});

  String? textValidator (String? value) {
    if (value == null || value.isEmpty) {
      return 'enterText'.tr;
    }
    return null;
  }

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

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'enterText'.tr;
    } else {
      const pattern = r'\b[A-Za-z0-9._%+-]+@flightlinebcn\.com\b';
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
            controller: controller.name,
            decoration: InputDecoration(
              labelText: 'name'.tr,
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
            validator: (value) => textValidator(value),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: controller.surname,
            decoration: InputDecoration(
              labelText: 'surname'.tr,
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
            validator: (value) => textValidator(value),
          ),
          const SizedBox(height: 20),
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
            validator: (value) => textValidator(value),
          ),
          const SizedBox(height: 20),
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
              suffixIcon: const Icon(Icons.email),
            ),
            validator: (value) => emailValidator(value),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: controller.password1,
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
            validator: (value) => passwordValidator(value, controller.password2.text),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: controller.password2,
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
            validator: (value) => passwordValidator(value, controller.password1.text),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              if (_formKey.currentState!.validate()) {
                UserModel user = UserModel(
                  name: controller.name.text,
                  surname: controller.surname.text,
                  username: controller.username.text,
                  email: controller.email.text,
                  password: controller.password1.text,
                  role: 'user',
                  language: prefs.getString('language') ?? 'es',
                  validated: false
                );
                await UserService.register(user);
                Get.toNamed(Routes.login);
              }
            },
            child: Text('putRegister'.tr),
          ),
        ],
      )
    );
  }
}