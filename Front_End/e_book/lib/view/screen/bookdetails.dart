import 'package:e_book/controller/bookdetaile_controller.dart';
// import 'package:e_book/controller/books_controller.dart';
// import 'package:e_book/core/constant/linkapi.dart';
// import 'package:e_book/view/widget/Home/appbar.dart';
import 'package:e_book/core/constant/linkapi.dart';
import 'package:e_book/core/function/translatedatabase.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    BookDetaileControllerimp controller = Get.put(BookDetaileControllerimp());
    return Scaffold(
      // body:
      body:
          //  controller.isLoading == true
          //     ? Center(child: CircularProgressIndicator())
          //     :
          ListView(children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Image.network(
                "$linkBookimage/${controller.books[controller.num]['Book_image']}",
                height: 300,
                scale: 1.0,
                width: 250,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              height: 280,
              width: 145,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber.withOpacity(0.13),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 7,
        ),
        Card(
          // margin: EdgeInsets.only(left: 10),
          // alignment: Alignment.topLeft,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Row(
                  children: [
                    Text(
                      "60".tr,
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "${controller.books[controller.num]["book_title"]}",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                          fontFamily: "DancingScript-Bold"),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Text(
                      "61".tr,
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "${controller.books[controller.num]["book_auther"]}",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                          fontFamily: "DancingScript-Bold"),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Text(
                      "63".tr,
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "${controller.books[controller.num]["book_publisher"]}",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                          fontFamily: "DancingScript-Bold"),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Text(
                      "64".tr,
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "${controller.books[controller.num]["data_published"]}",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                          fontFamily: "DancingScript-Bold"),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Text(
                      "65".tr,
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "${translatdatabase(controller.books[controller.num]["genre_ar"], controller.books[controller.num]["genre"])}",
                      style: TextStyle(fontFamily: "DancingScript-Regular"),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 40),
                width: 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.amber[200],
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.toNamed("bookpdf");
                        },
                        icon: Row(
                          children: [
                            Icon(Icons.book),
                            Text(
                              "91".tr,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ],
                        )),

                    // TextButton.icon(
                    //   onPressed: () {
                    //     Get.toNamed("bookpdf");
                    //   },
                    //   icon: Icon(Icons.book),
                    //   label: Text(
                    //     "91".tr,
                    //     style: TextStyle(color: Colors.black),
                    //   ),
                    //   style: ButtonStyle(
                    //       iconColor: MaterialStatePropertyAll(Colors.black)),
                    // ),
                    IconButton(
                        onPressed: () {
                          controller.checklib(controller.books[controller.num]
                                  ["Book_id"]
                              .toString());
                        },
                        icon: Row(
                          children: [
                            Icon(Icons.library_add),
                            Text(
                              "92".tr,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ],
                        )),
                    // TextButton.icon(
                    //   onPressed: () {
                    //     controller.checklib(
                    //       controller.books[controller.num]["Book_id"]
                    //           .toString(),
                    //     );
                    //   },
                    //   icon: Icon(Icons.library_add),
                    //   label: Text(
                    //     "92".tr,
                    //     style: TextStyle(color: Colors.black),
                    //   ),
                    //   style: ButtonStyle(
                    //       iconColor: MaterialStatePropertyAll(Colors.black)),
                    // ),
                  ],
                ),
              )
              // Text(
              //   "Name Of Book :",
              //   textAlign: TextAlign.left,
              //   style: TextStyle(
              //     fontSize: 15,
              //     // fontWeight: FontWeight.bold,
              //     fontFamily: "DancingScript-Bold",
              //   ),
              // ),

              // ),
              // SizedBox(
              //   height: 5,
              // ),

              // Text(
              //   "${controller.books[controller.num]["Book_desc"]}",
              //   style: TextStyle(fontFamily: "DancingScript-Regular"),
              //   textAlign: TextAlign.left,
              // ),
            ],
          ),
        )
      ]),
    );
  }
}
