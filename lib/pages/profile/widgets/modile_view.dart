import 'package:flutter/material.dart';
import 'package:frontend_tfg/pages/profile/widgets/edit_user_form.dart';
import 'package:frontend_tfg/pages/profile/widgets/view_user_form.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const CircleAvatar(
                    radius: 50.0,
                    child: Icon(Icons.person, size: 70.0),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(onPressed: (){}, child: Text('editPhoto'.tr)),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 400,
                child: ViewUserForm(),
              ),
              const SizedBox(width: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          scrollable: true,
                          title: Text('editData'.tr),
                          content: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: EditUserForm()
                          ),
                        );
                      },
                    );
                  }, child: Text('editData'.tr)),
                  const SizedBox(width: 20),
                  ElevatedButton(onPressed: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.remove('token');
                    prefs.remove('id');
                    prefs.remove('language');
                    prefs.remove('isAdmin');
                    Get.toNamed(Routes.login);
                  }, child: Text('signOut'.tr)),
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}


Widget drawer (List<Widget> tabs) {
  return Drawer(
    child: ListView(children: tabs),
  );
}