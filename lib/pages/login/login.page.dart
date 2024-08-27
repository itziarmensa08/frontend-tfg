import 'package:flutter/material.dart';
import 'package:frontend_tfg/general_widgets/language_dropdown.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';
import 'package:frontend_tfg/pages/login/widgets/login_form.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    ToastUtils.initFToast(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            "fondo.jpg",
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Card(
                          color: Colors.white,
                          shadowColor: Colors.white,
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const SizedBox(height: 40),
                                Text(
                                  'login'.tr,
                                  style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).primaryColor),
                                ),
                                const SizedBox(height: 40),
                                LoginForm(),
                                const SizedBox(height: 20),
                                TextButton(
                                  child: Text(
                                    'forgotPass'.tr,
                                  ),
                                  onPressed: () {
                                  },
                                ),
                                TextButton(
                                  child: Text(
                                    'notAccount'.tr,
                                  ),
                                  onPressed: () {
                                    Get.toNamed(Routes.register);
                                  },
                                ),
                                Image.asset(
                                  'assets/logo_flightline.png',
                                  width: 100,
                                  height: 100,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: const Icon(Icons.person, size: 70.0, color: Colors.white,),
                    ),
                  ],
                ),
                buildLanguageDropdown(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
