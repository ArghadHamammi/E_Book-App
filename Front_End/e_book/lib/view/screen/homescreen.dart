import 'package:e_book/controller/homescreen_controller.dart';
import 'package:e_book/view/widget/Home/buttomappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerimp());
    return GetBuilder<HomeScreenControllerimp>(
        builder: ((controller) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Get.toNamed("/libary");
                },
                backgroundColor: Colors.amber,
                child: const Icon(
                  Icons.border_color_sharp,
                  color: Colors.white,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: BottomAppBar(
                height: 69,
                shape: const CircularNotchedRectangle(),
                child: Row(
                  children: [
                    ...List.generate(controller.listpage.length + 1, (index) {
                      int i = index > 2 ? index - 1 : index;
                      return index == 2
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
                    /*
                    Row(
                      children: [
                        MyButtomAppBar(
                          myicon: Icons.home,
                          myonpressed: () {
                            controller.changepage(0);
                          },
                          text1: "Home",
                          active: controller.currentpage == 0 ? true : false,
                        ),
                        MyButtomAppBar(
                          myonpressed: () {
                            controller.changepage(1);
                          },
                          text1: "Settings",
                          myicon: Icons.settings,
                          active: controller.currentpage == 1 ? true : false,
                        )
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        MyButtomAppBar(
                          myonpressed: () {
                            controller.changepage(2);
                          },
                          text1: "Profile",
                          myicon: Icons.person_2_outlined,
                          active: controller.currentpage == 2 ? true : false,
                        ),
                        MyButtomAppBar(
                          myonpressed: () {
                            controller.changepage(3);
                          },
                          text1: "Favorite",
                          myicon: Icons.favorite_outline_outlined,
                          active: controller.currentpage == 3 ? true : false,
                        )
                      ],
                    )*/
                  ],
                ),
              ),
              body: controller.listpage.elementAt(controller.currentpage),
            )));
  }
}
