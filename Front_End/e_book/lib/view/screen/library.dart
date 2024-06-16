
import 'package:e_book/controller/libary_controller.dart';
import 'package:e_book/core/constant/linkapi.dart';
import 'package:e_book/core/function/translatedatabase.dart';
import 'package:e_book/view/screen/rationview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Library extends StatelessWidget {
  const Library({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LibaryControllerimp());
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          shadowColor: Colors.white,
          title: Text(
            "90".tr,
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: GetBuilder<LibaryControllerimp>(
          builder: (controller) =>  
               ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: controller.library.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        controller.gotobookdetails(library, index);
                      },
                      child: Slidable(
                        startActionPane:
                            ActionPane(motion: const BehindMotion(), children: [
                          SlidableAction(
                            onPressed: (context) {
                              controller.delete(controller.library[index]
                                      ['library_bookid']
                                  .toString());
                            },
                            backgroundColor: Colors.red,
                            icon: Icons.delete,
                          ),
                          SlidableAction(
                            onPressed: (context) {
                              if (controller.library[index]['complete'] == 1) {
                                controller.notcomplete(controller.library[index]
                                        ['library_bookid']
                                    .toString());
                                controller.checkrating(controller.library[index]
                                        ['Book_id']
                                    .toString());
                              } else {
                                controller.complete(controller.library[index]
                                        ['library_bookid']
                                    .toString());
                                controller.checkrating(controller.library[index]
                                        ['Book_id']
                                    .toString());
                                print("==================rate");
                                print(controller.israte);
                                if (controller.israte != true) {
                                  openrate(
                                      context,
                                      controller.library[index]['Book_id']
                                          .toString());
                                }
                              }
                            },
                            backgroundColor: Colors.amber.withOpacity(0.4),
                            icon: controller.library[index]['complete'] == 1
                                ? Icons.running_with_errors_outlined
                                : Icons.done,
                          )
                        ]),
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
                                      "$linkBookimage/${controller.library[index]['Book_image']}",
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
                                    "${translatdatabase(controller.library[index]['book_title'], controller.library[index]['book_title'])}",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    // "${controller.books[index]['Book_name']}",
                                    "${translatdatabase(controller.library[index]['book_auther'], controller.library[index]['book_auther'])}",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    // "${controller.books[index]['Book_name']}",
                                    "${translatdatabase(controller.library[index]['data_published'], controller.library[index]['data_published'])}",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: controller.library[index]
                                                    ['complete'] ==
                                                1
                                            ? Icon(Icons.done,
                                                color: Colors.amber)
                                            : Icon(
                                                Icons
                                                    .running_with_errors_outlined,
                                                color: Colors
                                                    .red), // يمكنك استخدام أي أيقونة تفضلها

                                        onPressed: () {
                                          // تحديث حالة الكتاب عند النقر على الزر
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ));
  }
}

openrate(BuildContext context, String bookid) {
  showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => RatingView(bookid: bookid));
}
  // return GetBuilder<RatingVire_Controllerimp>(
  //   builder: (controller) {
  //     return Container(
  //       height: 300,
  //       padding: EdgeInsets.symmetric(horizontal: 30),
  //       child: Column(
  //         // mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           Text("rate this book"),
  //           SizedBox(
  //             height: 20,
  //           ),
  //           AnimatedPositioned(
  //               child: Row(
  //                 children: [
  //                   ...List.generate(
  //                       5,
  //                       (index) => IconButton(
  //                           onPressed: () {
  //                             rate = 1 + index;
  //                             print(rate);
  //                           },
  //                           icon: index < rate
  //                               ? Icon(
  //                                   Icons.star,
  //                                   size: 30,
  //                                   color: Colors.amber.withOpacity(0.7),
  //                                 )
  //                               : Icon(
  //                                   Icons.star_border_outlined,
  //                                   size: 30,
  //                                   // color: Colors.amber.withOpacity(0.7),
  //                                 ))),
  //                 ],
  //               ),
  //               duration: Duration(milliseconds: 800))
  //         ],
  //       ),
  //     );
  //   },
  // );

