import 'package:flutter/material.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';
import 'package:frontend_tfg/pages/settings/widgets/settings_item.dart';

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
              icon: Icons.language,
              title: 'Language',
              onTap: () {
                // Navigate to language settings
              },
            ),
            const Divider(),
            SettingsItem(
              icon: Icons.notifications,
              title: 'Notifications',
              onTap: () {
                // Navigate to notifications settings
              },
            ),
            const Divider(),
            SettingsItem(
              icon: Icons.visibility,
              title: 'Appearance',
              onTap: () {
                // Navigate to appearance settings
              },
            ),
            const Divider(),
            SettingsItem(
              icon: Icons.lock,
              title: 'Privacy & Security',
              onTap: () {
                // Navigate to privacy & security settings
              },
            ),
            const Divider(),
            SettingsItem(
              icon: Icons.help,
              title: 'Help and Support',
              onTap: () {
                // Navigate to help and support settings
              },
            ),
            const Divider(),
            SettingsItem(
              icon: Icons.info,
              title: 'About',
              onTap: () {
                // Navigate to about settings
              },
            ),
            const Divider(),
          ],
          )
        ),
      ),
    ],
  );
}