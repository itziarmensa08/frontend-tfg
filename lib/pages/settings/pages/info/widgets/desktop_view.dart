import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

Widget desktopView(double height, BuildContext context, TickerProviderStateMixin page) {
  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print("No se pudo abrir el enlace");
    }
  }
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomTabBar(page: page, number: 4),
      Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 30.0),
        child: RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),
              children: [
                TextSpan(
                  text: 'settings'.tr,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.toNamed(Routes.settings);
                    },
                ),
                TextSpan(
                  text: ' > ',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),
                ),
                TextSpan(
                  text: 'help'.tr,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {},
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),
                ),
              ],
            ),
          )
      ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Elige cómo quieres acceder a la información:'.tr,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                icon: const Icon(Icons.picture_as_pdf),
                label: Text('Acceder al PDF'.tr),
                onPressed: () {
                  _openUrl('https://drive.google.com/file/d/1d0ccFFRA0OjtobpPjCsmY1B-WlLS6Feu/view?usp=sharing');
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                icon: const Icon(Icons.video_library),
                label: Text('Ver el Video'.tr),
                onPressed: () {
                  _openUrl('https://drive.google.com/file/d/1yock_nmAfm5VE3p1KK9wHRPcUcXY68KN/view?usp=sharing');
                },
              ),
            ]
          )
        ),
      ),
    ],
  );
}