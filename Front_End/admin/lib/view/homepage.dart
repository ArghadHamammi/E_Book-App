import 'package:admin/view/homepage_controller.dart';
// import 'package:admin/view/widget/Home/appbar.dart';
import 'package:admin/view/widget/Home/homecard.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:get/get.dart';

// import 'package:flutter_pdfview/flutter_pdfview.dart';
class HomePage extends GetView<HomePageControllerimp> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerimp());
    return GetBuilder<HomePageControllerimp>(
        builder: (controller) => Scaffold(
              body: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  margin: const EdgeInsets.only(top: 10),
                  child: ListView(scrollDirection: Axis.vertical, children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HomeCard(
                          text1: Text(
                            "59".tr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          text2: Text(
                            "${controller.username}",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 25),
                          ),
                        ),
                        GridView(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, mainAxisExtent: 200),
                          children: [
                            InkWell(
                              onTap: () {
                                Get.toNamed("usersview");
                              },
                              child: Card(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/person.png",
                                      height: 150,
                                      width: 100,
                                    ),
                                    Text("98".tr)
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed("bookview");

                              },
                              child: Card(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/book.png",
                                      height: 150,
                                      width: 100,
                                    ),
                                    Text("99".tr)
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed("genreview");
                              },
                              child: Card(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/genre.jpeg",
                                      height: 150,
                                      width: 100,
                                    ),
                                    Text("97".tr)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ])),
            ));
  }
}
