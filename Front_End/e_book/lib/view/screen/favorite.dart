// import 'package:e_book/view/widget/Home/appbar.dart';
// import 'package:e_book/controller/books_controller.dart';
import 'package:e_book/controller/favorite_controlller.dart';
import 'package:e_book/core/constant/linkapi.dart';
import 'package:e_book/core/function/translatedatabase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController());

    return Container(child: GetBuilder<FavoriteController>(
      builder: (controller) {
        return GridView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.61),
          itemCount: controller.book.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(
                      "$linkBookimage/${controller.book[index]['Book_image']}",
                      height: 170,
                      width: 140,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      // "${controller.books[index]['Book_name']}",
                      "${translatdatabase(controller.book[index]['book_title'], controller.book[index]['book_title'])}",
                      style: TextStyle(fontSize: 15),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "${controller.book[index]['data_published']}",
                          style: TextStyle(fontSize: 15),
                        ),
                        // GetBuilder<BookControllerimp>(
                        //   builder: (controllerbook) {
                        //     return IconButton(
                        //       onPressed: () {},
                        //       icon: Icon(Icons.favorite),
                        //       color: Colors.red,
                        //       iconSize: 32,
                        //     );
                        //   },
                        // )
                         
                        IconButton(
                            onPressed: () {
                              controller.removefavotire(
                                  controller.book[index]['Book_id'].toString());
                             
                            },
                            icon: Icon(
                              Icons.remove_circle_outline,
                              color: Colors.red,
                              size: 30,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    ));
  }
}
