import 'package:flutter/material.dart';
import 'package:frontend_tfg/pages/splash/splash.controller.dart';
import 'package:get/get.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashScreenController());
    controller.checkUser();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("IMG_0621.JPG"), fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.5),
                const CircularProgressIndicator(),
                const Spacer(),
                Image.asset(
                  'assets/logo_flightline.png',
                  width: 150,
                  height: 150,
                )
              ],
            )
          )
        ),
      )
    );
  }
}