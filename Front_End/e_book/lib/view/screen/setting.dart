import 'package:e_book/controller/setting_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    SettingControllerimp controller = Get.put(SettingControllerimp());
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
                      "69".tr,
                      style: TextStyle(fontSize: 40),
                    ),
                    Icon(
                      Icons.settings,
                      size: 40,
                    )
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
                  title: Text("72".tr),
                  leading: IconButton(
                      onPressed: () {
                        controller.alertchangelan();
                      },
                      icon: Icon(Icons.language)),
                ),
                Divider(),
                ListTile(
                  title: Text("73".tr),
                  leading: IconButton(onPressed: () {}, icon: Icon(Icons.call)),
                ),
                Divider(),
                ListTile(
                  title: Text("75".tr),
                  leading: IconButton(onPressed: () {}, icon: Icon(Icons.info)),
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    controller.logout();
                  },
                  title: Text("74".tr),
                  leading: IconButton(
                      onPressed: () {
                        controller.alertexitapp();
                      },
                      icon: Icon(Icons.logout)),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
