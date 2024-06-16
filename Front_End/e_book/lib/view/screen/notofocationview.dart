import 'package:e_book/controller/notification_controller.dart';
// import 'package:e_book/core/constant/linkapi.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Notificationcontrollerimp());
    return Scaffold(body: GetBuilder<Notificationcontrollerimp>(
      builder: (controller) {
        return ListView.builder(
          itemCount: controller.noti.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Card(
              child: Column(children: [
                ListTile(
                  title:
                      Text("${controller.noti[index]['notification_title']}"),
                  subtitle:
                      Text("${controller.noti[index]['notification_body']}"),
                )
              ]),
            );
          },
        );
      },
    ));
  }
}
