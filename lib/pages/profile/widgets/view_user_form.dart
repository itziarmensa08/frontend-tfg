// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:frontend_tfg/pages/profile/profile.controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ViewUserForm extends Container {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ProfileController controller = Get.put(ProfileController());

  ViewUserForm({super.key});

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

  String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
    } else {
      final phoneRegex = RegExp(r'^[0-9]{9}$');
      if (!phoneRegex.hasMatch(value)) {
        return 'invalidPhone'.tr;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Obx(() => Column(
        children: [
          TextFormField(
            controller: TextEditingController(text: controller.user.value.name),
            readOnly: true,
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
            controller: TextEditingController(text: controller.user.value.surname),
            readOnly: true,
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
            validator: (value) => textValidator(value),
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
            validator: (value) => emailValidator(value),
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
            validator: (value) => phoneValidator(value),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: TextEditingController(
              text: DateFormat('yyyy-MM-dd').format(controller.user.value.dateBorn ?? DateTime.now())
            ),
            readOnly: true,
            /*onTap: () async {
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (pickedDate != null) {
                controller.date = pickedDate;
                String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                controller.dateborn.text = formattedDate;
              }
            },*/
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
          /*Obx(() => DropdownButtonFormField<String>(
            value: controller.user.value.role,
            items: <String>['admin', 'user'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value.tr),
              );
            }).toList(),
            onChanged: (String? newValue) {
              controller.role = newValue;
            },
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
            ),
            icon: const Icon(Icons.arrow_drop_down),
          )),*/
          const SizedBox(height: 40),
          /*Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                style: buttonGrayStyle,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    controller.user.value.name = controller.name.text;
                    controller.user.value.surname = controller.surname.text;
                    controller.user.value.username = controller.username.text;
                    controller.user.value.email = controller.email.text;
                    if (controller.telephone.text.isNotEmpty) {
                      controller.user.value.telephone = int.tryParse(controller.telephone.text);
                    }
                    if (controller.date != null) {
                      controller.user.value.dateBorn = controller.date;
                    }
                    if (controller.role != null) {
                      controller.user.value.role = controller.role;
                    }

                    bool? success = await HomeRepository.updateUser(context, controller.user.value.id!, controller.user.value);

                    if (success != null || success == true) {
                      List<UserModel>? users = await HomeRepository.getUsers(context);
                      if (users != null) {
                        controllerHome.users.value = users;
                      }
                      controllerHome.seeUsers.value = true;
                      controllerHome.editUser.value = false;
                      ToastUtils.showSuccessToast(context, 'editUserSuccess'.tr);
                    }
                  }
                },
                icon: Icon(Icons.save, color: Theme.of(context).primaryColor),
                label: Text('editUser'.tr, style: textPrimaryColorTextStyle),
              ),
              const SizedBox(width: 40),
              ElevatedButton.icon(
                style: buttonGrayStyle,
                onPressed: () async {
                  showAlert(
                    context, 
                    'deleteUser'.tr, 
                    'confirmDeleteUser'.tr, 
                    'yes'.tr, 
                    'no'.tr,
                    const Color.fromRGBO(255, 0, 0, 0.5),
                    () async {
                      await HomeRepository.deleteUser(context, controller.user.value.id!);
                      List<UserModel>? users = await HomeRepository.getUsers(context);
                      if (users != null) {
                        controllerHome.users.value = users;
                      }
                      controllerHome.seeUsers.value = true;
                      controllerHome.editUser.value = false;
                      Navigator.of(context).pop();
                    },
                    () {
                      Navigator.of(context).pop();
                    }
                  );
                },
                icon: const Icon(Icons.delete, color: Colors.red),
                label: Text('deleteUser'.tr, style: textPrimaryColorTextStyle.copyWith(color: Colors.red)),
              ),
            ],
          ),*/
        ],
      ))
    );
  }
}