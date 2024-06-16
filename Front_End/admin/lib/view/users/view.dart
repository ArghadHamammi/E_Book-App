import 'package:admin/controller/users/usersview_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UsersViewControllerimp());
    return Scaffold(
        appBar: AppBar(
          title: Text("98".tr),
          centerTitle: true,
          backgroundColor: Colors.amber.withOpacity(0.7),
        ),
        body: GetBuilder<UsersViewControllerimp>(
            builder: (controller) => ListView(children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListTile(
                        title: Text("100".tr),
                        subtitle: Text("${controller.users.length}"),
                      )),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, mainAxisExtent: 300),
                      itemCount: controller.users.length,
                      itemBuilder: (context, index) => Card(
                          child: Column(
                        children: [
                          const Icon(
                            Icons.person,
                            color: Colors.amber,
                            size: 100,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text("${controller.users[index]['users_name']}"),
                          Text(
                            "${controller.users[index]['users_email']}",
                            style: const TextStyle(fontSize: 15),
                          ),
                          Text(
                            "${controller.users[index]['users_phone']}",
                            style: const TextStyle(fontSize: 15),
                          ),
                        ],
                      )),
                    ),
                  ),
                ])));
  }
}
