import 'package:admin/view/homescreen_controller.dart';
import 'package:admin/view/widget/Home/buttomappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerimp());
    return GetBuilder<HomeScreenControllerimp>(
        builder: ((controller) => Scaffold(
              appBar: AppBar(
                title: const Center(child: Text("Home")),
                foregroundColor: Colors.amber,
                backgroundColor: Colors.amber.withOpacity(0.4),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: BottomAppBar(
                height: 69,
                shape: const CircularNotchedRectangle(),
                child: Row(
                  children: [
                    ...List.generate(controller.listpage.length + 1, (index) {
                      int i = index > 1 ? index - 1 : index;
                      return index == 1
                          ? const Spacer()
                          : MyButtomAppBar(
                              myicon: controller.bottomapp[i]['icon'],
                              myonpressed: () {
                                controller.changepage(i);
                              },
                              text1: controller.bottomapp[i]['title'],
                              active:
                                  controller.currentpage == i ? true : false,
                            );
                    })
                  ],
                ),
              ),
              body: controller.listpage.elementAt(controller.currentpage),
            )));
  }
}
