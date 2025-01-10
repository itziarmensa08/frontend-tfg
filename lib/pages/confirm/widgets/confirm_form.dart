import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/services/user.service.dart';
import 'package:frontend_tfg/pages/confirm/confirm.controller.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';

class ConfirmForm extends StatelessWidget {
  final controller = Get.put(ConfirmController());

  ConfirmForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Text(
            'confirmAccountText'.tr,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).primaryColor)
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () async {
              if (controller.userId.isNotEmpty) {
                await UserService.validate(controller.userId.value);
                Get.toNamed(Routes.login);
              }
            },
            child: Text('validate'.tr),
          ),
        ],
      ),
    );
  }
}