// import 'package:e_book/controller/profile_controller.dart';
import 'package:e_book/core/services/services.dart';
// import 'package:e_book/core/function/logout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    // ProfileControllerimp controller = Get.put(ProfileControllerimp());
    MyServices myServices = Get.find();
    return Column(
      children: [
        Container(
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "70".tr,
                      style: TextStyle(fontSize: 40),
                    ),
                    Icon(
                      Icons.person,
                      size: 40,
                    ),
                     
                  ],
                ),
                height: Get.width / 2,
                width: double.infinity,
                color: Colors.amber[300],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 100,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  // title: Text(
                  //   "97".tr,
                  //   style: TextStyle(fontSize: 30),
                  // ),
                  title: Text(
                    "${myServices.sharedPreferences.getString("users_name")}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  leading: Icon(Icons.person),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    "${myServices.sharedPreferences.getString("users_email")}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  leading: Icon(Icons.email),
                ),
                Divider(),
                ListTile(
                    title: Text(
                      "${myServices.sharedPreferences.getString("users_phone")}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    leading: Icon(Icons.phone)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
