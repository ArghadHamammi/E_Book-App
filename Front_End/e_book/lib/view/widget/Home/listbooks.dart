// import 'package:e_book/data/model/booksmodle.dart';
// import 'package:e_book/controller/books_controller.dart';
import 'dart:math';

import 'package:e_book/controller/books_controller.dart';
import 'package:e_book/controller/favorite_controlller.dart';
// import 'package:e_book/controller/listbook_controller.dart';
import 'package:e_book/core/constant/linkapi.dart';
import 'package:e_book/core/function/translatedatabase.dart';
// import 'package:e_book/controller/listbook_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListBooks extends StatelessWidget {
  final bool checked;
  const ListBooks({Key? key, required this.checked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BookControllerimp controllerbook = Get.put(BookControllerimp());
    FavoriteController controllerfa = Get.put(FavoriteController());

    return GetBuilder<BookControllerimp>(
      builder: (controller) {
        var random = Random();
        var rand = random.nextInt(5);
        return controller.isLoading == true
            ? Center(
                child: CircularProgressIndicator(
                color: Colors.amber,
              ))
            : ListView.builder(
                itemCount: controllerbook.books.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  controllerfa.isfavorite[controller.books[index]['Book_id']] =
                      controller.books[index]['favorite'];

                  // controllerbook.getrating(controller.books[index]['Book_id'].toString());

                  return InkWell(
                    onTap: () {
                      controllerbook.changebook(index);
                      controllerbook.gotobookdetails(controllerbook.books);
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
                                    "$linkBookimage/${controller.books[index]['Book_image']}",
                                    height: 120,
                                    scale: 1.0,
                                    width: 80,
                                  
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
                                  "${translatdatabase(controllerbook.books[index]['book_title'], controllerbook.books[index]['book_title'])}",
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(
                                  // "${controller.books[index]['Book_name']}",
                                  "${translatdatabase(controllerbook.books[index]['book_auther'], controllerbook.books[index]['book_auther'])}",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  // "${controller.books[index]['Book_name']}",
                                  "${translatdatabase(controllerbook.books[index]['data_published'], controllerbook.books[index]['data_published'])}",
                                  style: TextStyle(fontSize: 15),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GetBuilder<FavoriteController>(
                                      builder: (controller) {
                                        return IconButton(
                                          onPressed: () {
                                            if (controller.isfavorite[
                                                    controllerbook.books[index]
                                                        ["Book_id"]] ==
                                                1) {
                                              controller.removefavotire(
                                                  controllerbook.books[index]
                                                          ["Book_id"]
                                                      .toString());
                                              controller.setfavorite(
                                                  controllerbook.books[index]
                                                      ["Book_id"],
                                                  0);
                                            } else {
                                              controller.setfavorite(
                                                  controllerbook.books[index]
                                                      ["Book_id"],
                                                  1);
                                              controller.addfavorite(
                                                  controllerbook.books[index]
                                                          ["Book_id"]
                                                      .toString());
                                            }
                                          },
                                          icon: Icon(controller.isfavorite[
                                                      controllerbook
                                                              .books[index]
                                                          ["Book_id"]] ==
                                                  1
                                              ? Icons.favorite
                                              : Icons.favorite_border_outlined),
                                          color: Colors.red,
                                          iconSize: 25,
                                        );
                                      },
                                    ),
                                    // GetBuilder<BookControllerimp>(
                                    //   builder: (controller) => ListView.builder(
                                    //     itemCount: controller.books.length,
                                    //     itemBuilder: (context, index) =>
                                    Container(
                                      alignment: Alignment.bottomCenter,
                                      child: Row(
                                        children: [
                                          ...List.generate(
                                              5,
                                              (index) => rand > index
                                                  ? Icon(
                                                      Icons.star,
                                                      color: Colors.amber
                                                          .withOpacity(0.8),
                                                      size: 20,
                                                    )
                                                  : Icon(
                                                      Icons.star_border,
                                                      color: Colors.amber
                                                          .withOpacity(0.8),
                                                      size: 20,
                                                    ))
                                        ],
                                      ),
                                    ),
                                    //   ),
                                    // )
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
              );
      },
    );
  }
}
