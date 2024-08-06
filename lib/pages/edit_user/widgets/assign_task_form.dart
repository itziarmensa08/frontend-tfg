// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/services/user.service.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';
import 'package:frontend_tfg/pages/edit_user/edit_user.controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AssignTaskForm extends Container {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final EditUserController controller = Get.put(EditUserController());

  AssignTaskForm({super.key});

  String? textValidator (String? value) {
    if (value == null || value.isEmpty) {
      return 'enterText'.tr;
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
            controller: controller.taskDescription,
            decoration: InputDecoration(
              labelText: 'description'.tr,
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
            controller: controller.taskDateText,
            readOnly: true,
            onTap: () async {
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2200),
              );
              if (pickedDate != null) {
                controller.taskDate = pickedDate;
                String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                controller.taskDateText.text = formattedDate;
              }
            },
            decoration: InputDecoration(
              labelText: 'dateLimit'.tr,
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
          const SizedBox(height: 40),
          ElevatedButton(onPressed: () async {
            if (_formKey.currentState!.validate()) {
              controller.event.value.title = controller.taskDescription.text;
              controller.event.value.isCompleted = false;
              controller.event.value.remembered = false;
              if (controller.taskDate != null) {
                controller.event.value.date = controller.taskDate;
              }

              bool? success = await UserService.assignTask(controller.user.value.id!, controller.event.value);

              if (success != null || success == true) {
                ToastUtils.showSuccessToast('assignTaskSuccess'.tr);
                Navigator.of(context).pop();
              }
            }
          }, child: Text('assignTask'.tr)),
        ],
      )
    );
  }
}