import 'package:flutter/material.dart';
import 'package:frontend_tfg/general_widgets/language_dropdown.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';
import 'package:frontend_tfg/pages/register/widgets/register_form.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    ToastUtils.initFToast(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/fondo.png"), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
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
                                  'register'.tr,
                                  style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).primaryColor),
                                ),
                                const SizedBox(height: 40),
                                RegisterForm(),
                                const SizedBox(height: 20),
                                TextButton(
                                  child: Text('alreadyAccount'.tr),
                                  onPressed: () {
                                    Get.toNamed(Routes.login);
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
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}