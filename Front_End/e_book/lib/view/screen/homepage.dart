import 'package:e_book/controller/homepage_controller.dart';
import 'package:e_book/core/constant/linkapi.dart';
import 'package:e_book/core/function/translatedatabase.dart';
// import 'package:e_book/core/services/services.dart';
// import 'package:e_book/core/function/translatedatabase.dart';
import 'package:e_book/view/widget/Home/appbar.dart';
import 'package:e_book/view/widget/Home/homecard.dart';
// import 'package:e_book/view/widget/Home/homecard.dart';
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
        builder: (controller) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              margin: const EdgeInsets.only(top: 10),
              child: ListView(
                scrollDirection: Axis.vertical,
                
                children: [
                  MyAppBar(
                    hint: "56".tr,
                    myonpressed: () {
                      Get.toNamed("notification");
                    },
                    searchonPressed: () {
                      controller.onsearchchange();
                    },
                    mycontroller: controller.searchtext!,
                    myonChanged: (val) {
                      controller.checksearch(val);
                    },
                  ),

                  // Container(
                  //   // width: 5,
                  //   padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  //   child: Row(
                  //     children: [
                  //       Text("76".tr),
                  //       SizedBox(
                  //         width: 5,
                  //       ),
                  //       Text(
                  //         "${controller.username}",
                  //         style: TextStyle(
                  //             color: Colors.grey,
                  //             fontWeight: FontWeight.normal,
                  //             fontSize: 25),
                  //       ),
                  //     ],
                  //   ),
                  //   decoration: BoxDecoration(
                  //       // color: Colors.amber[100],
                  //       borderRadius: BorderRadius.circular(18)),
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  controller.isearch == false
                      ? Column(
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
                            Text("77".tr,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal)),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 120,
                              child: ListView.separated(
                                separatorBuilder: ((context, index) {
                                  return const SizedBox(
                                    height: 70,
                                    width: 15,
                                  );
                                }),
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.categories.length,
                                itemBuilder: (context, index) {
                                  var i = index;
                                  return InkWell(
                                    onTap: () {
                                      controller.gotobook(
                                          controller.categories,
                                          i,
                                          controller.categories[index]
                                                  ['categories_id']
                                              .toString());
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                                color: Colors.amber[200],
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            height: 80,
                                            width: 80,
                                            child: Image.network(
                                              "$linkcategoriesimage/${controller.categories[index]['genre_image']}",
                                              color: Colors.black,
                                            )),
                                        Text(
                                          "${translatdatabase(controller.categories[index]['genre_ar'], controller.categories[index]['genre'])}",
                                          style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Text(
                              "78".tr,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 224,
                              child: ListView.builder(
                                itemCount: controller.recomm.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      controller.gotobookdetails(
                                          controller.recomm, index);
                                    },
                                    child: Stack(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          child: Image.network(
                                            "$linkBookimage/${controller.recomm[index]['Book_image']}",
                                            height: 280,
                                            width: 140,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Container(
                                          height: 280,
                                          width: 145,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color:
                                                Colors.amber.withOpacity(0.13),
                                          ),
                                          // child: Text(
                                          //     "${controller.books[index]['Book_name']}"),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Text(
                              "89".tr,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 224,
                              child: ListView.builder(
                                itemCount: controller.nbook.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      controller.gotobookdetails(
                                          controller.nbook, index);
                                    },
                                    child: Stack(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          child: Image.network(
                                            "$linkBookimage/${controller.nbook[index]['Book_image']}",
                                            height: 280,
                                            width: 140,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Container(
                                          height: 280,
                                          width: 145,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color:
                                                Colors.amber.withOpacity(0.13),
                                          ),
                                          // child: Text(
                                          //     "${controller.books[index]['Book_name']}"),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        )
                      : ResultSearch(result: controller.searchbook)
                  // const SizedBox(height: 10),
                  /*      Container(
                            color: Colors.white,
                            height: 50,
                            width: 80,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               const Text("Welcome To :"),
                                ListTile(
                                  title: Text(
                                    "${controller.username}",
                                    style: const TextStyle(
                                        color: Colors.amber, fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),*/

                  /*  PDFView(
                        filePath: "",
                      )*/
                ],
              ),
            ));
  }
}

class ResultSearch extends GetView<HomePageControllerimp> {
  final List result;

  const ResultSearch({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //   shrinkWrap: true,
    //   itemCount: result.length,
    //   physics: NeverScrollableScrollPhysics(),
    //   itemBuilder: (context, index) {
    //     return Text("${result[index]['book_title']}");
    //   },
    // );
    return ListView.builder(
      itemCount: result.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.changebook(index);
            controller.gotobookdetails(controller.searchbook, index);
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 7),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 7),
                        child: Image.network(
                          "$linkBookimage/${result[index]['Book_image']}",
                          height: 120,
                          scale: 1.0,
                          width: 80,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        height: 120,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.amber.withOpacity(0.19),
                        ),
                        // child: Text(
                        //     "${controller.books[index]['Book_name']}"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // "${controller.books[index]['Book_name']}",
                        "${translatdatabase(result[index]['book_title'], result[index]['book_title'])}",
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        // "${controller.books[index]['Book_name']}",
                        "${translatdatabase(result[index]['book_auther'], result[index]['book_auther'])}",
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        // "${controller.books[index]['Book_name']}",
                        "${translatdatabase(result[index]['data_published'], result[index]['data_published'])}",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
