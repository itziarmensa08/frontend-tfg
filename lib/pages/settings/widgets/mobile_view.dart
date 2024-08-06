import 'package:flutter/material.dart';
import 'package:frontend_tfg/pages/settings/widgets/settings_item.dart';

Widget mobileView(double width, GlobalKey<ScaffoldState> scaffoldKey, BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05 ),
    child: SizedBox(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                iconSize: width * 0.08,
                onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
                icon: const Icon(Icons.menu_rounded),
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            children: <Widget>[
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
        ],
      ),
    ),
  );
}
