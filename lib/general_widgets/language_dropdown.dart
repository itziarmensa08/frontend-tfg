import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/auth.model.dart';
import 'package:frontend_tfg/data/services/user.service.dart';
import 'package:frontend_tfg/translations/app.translations.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget buildLanguageDropdown() {
  var initialLanguage = Get.locale?.languageCode.obs;
  return DropdownButton<String>(
    value: initialLanguage?.value,
    onChanged: (language) async {
      Get.updateLocale(Locale(language!));
      Auth.language = language;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('language', language);
      var id = prefs.getString('id');
      if (id != null) {
        var user = await UserService.getUserById(id);
        if (user != null) {
          user.language = language;
          await UserService.updateUser(id, user);
        }
      }
    },
    icon: const Icon(Icons.arrow_drop_down),
    items: AppTranslation.translations.keys.map((String language) {
      return DropdownMenuItem<String>(
        value: language,
        child: Row(
          children: [
            Image.asset(
              'assets/$language.png',
              width: 20,
              height: 20,
            ),
            const SizedBox(width: 8),
            Text(language.tr),
          ],
        ),
      );
    }).toList(),
  );
}