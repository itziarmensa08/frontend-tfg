import 'package:flutter/material.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';
import 'package:frontend_tfg/pages/settings/widgets/settings_item.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

Widget desktopView(double height, BuildContext context, TickerProviderStateMixin page) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomTabBar(page: page, number: 4),
      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            children: <Widget>[
            SettingsItem(
              icon: Icons.notifications,
              title: 'notifications'.tr,
              onTap: () {
                Get.toNamed(Routes.notis);
              },
            ),
            const Divider(),
            SettingsItem(
              icon: Icons.lock,
              title: 'privacy'.tr,
              onTap: () {
                Get.toNamed(Routes.privacity);
              },
            ),
            const Divider(),
            SettingsItem(
              icon: Icons.help,
              title: 'help'.tr,
              onTap: () async {
                Get.toNamed(Routes.help);
              },
            ),
            const Divider(),
            SettingsItem(
              icon: Icons.info,
              title: 'about'.tr,
              onTap: () async {
                final uri = Uri.parse('https://flightlinebcn.com/');
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                } else {
                  print("No se pudo abrir el enlace");
                }
              },
            ),
            const Divider(),
            SettingsItemLanguage(
              icon: Icons.language,
              title: 'language'.tr,
              onTap: () {
                // Navigate to language settings
              },
            ),
          ],
          )
        ),
      ),
    ],
  );
}