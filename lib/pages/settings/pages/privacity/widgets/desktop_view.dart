import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';

Widget desktopView(double height, BuildContext context, TickerProviderStateMixin page) {
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
                  text: 'privacy'.tr,
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
              Text('Configuración de Privacidad'.tr),
              const SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.person_outline),
                title: Text('Control de permisos de datos'.tr),
                subtitle: Text('Gestiona los permisos de uso de tus datos'.tr),
                onTap: () {
                  // Navega a una página específica para configurar los permisos de datos
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.policy_outlined),
                title: Text('Revisión de Políticas de Privacidad'.tr),
                subtitle: Text('Consulta las políticas sobre el uso y protección de datos'.tr),
                onTap: () {
                  // Navega a una página con las políticas de privacidad
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.password),
                title: Text('Cambiar contraseña'.tr),
                subtitle: Text('Accede para actualizar la contraseña'.tr),
                onTap: () {
                  // Navega a una página con las políticas de privacidad
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.delete_outline),
                title: Text('Eliminar cuenta y datos'.tr),
                subtitle: Text('Solicita la eliminación completa de tu cuenta y datos personales'.tr),
                onTap: () {
                  // Aquí podrías abrir un diálogo de confirmación o iniciar el proceso de eliminación
                },
              ),
            ]
          )
        ),
      ),
    ],
  );
}