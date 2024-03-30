// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:frontend_tfg/pages/edit_user/edit_user.controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ViewUserForm extends Container {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final EditUserController controller = Get.put(EditUserController());

  ViewUserForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Obx(() => Column(
        children: [
          TextFormField(
            controller: TextEditingController(text: controller.user.value.username),
            readOnly: true,
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
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: TextEditingController(text: controller.user.value.email),
            readOnly: true,
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
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: TextEditingController(text: controller.user.value.telephone.toString()),
            readOnly: true,
            decoration: InputDecoration(
              labelText: 'telephone'.tr,
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
              suffixIcon: const Icon(Icons.phone),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: TextEditingController(
              text: DateFormat('yyyy-MM-dd').format(controller.user.value.dateBorn ?? DateTime.now())
            ),
            readOnly: true,
            decoration: InputDecoration(
              labelText: 'dateBorn'.tr,
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
              suffixIcon: const Icon(Icons.date_range),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: TextEditingController(text: controller.user.value.role?.tr),
            readOnly: true,
            decoration: InputDecoration(
              labelText: 'rol'.tr,
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
              suffixIcon: const Icon(Icons.admin_panel_settings_outlined),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ))
    );
  }
}