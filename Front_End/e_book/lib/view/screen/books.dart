import 'package:e_book/controller/books_controller.dart';
import 'package:e_book/core/function/translatedatabase.dart';
// import 'package:e_book/view/widget/Home/appbar.dart';
import 'package:e_book/view/widget/Home/listbooks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Books extends StatelessWidget {
  Books({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BookControllerimp());
    // FavoriteController controllerfa = Get.put(FavoriteController());

    return GetBuilder<BookControllerimp>(
        builder: (controller) => Scaffold(
              body: Container(
                padding: const EdgeInsets.all(15),
                child: ListView(children: [
                  // MyAppBar(
                  //   hint: "58".tr,
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  SizedBox(
                    height: 50,
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
                        // ignore: unused_local_variable
                        // var i = index;
                        return InkWell(
                          onTap: () {
                            // print("The index is $index");
                            controller.changcat(
                                index,
                                controller.categories[index]['categories_id']
                                    .toString());
                            controller.changebook(index);

                            // print(
                            //     "${controller.categories[index]['categories_id']}");
                            //   print(
                            //       "${controller.books[index]['Book_name']}");
                            //
                          },
                          child: Column(
                            children: [
                              // Container(
                              //   decoration: BoxDecoration(
                              //       color: Colors.amber[200],
                              //       borderRadius: BorderRadius.circular(50)),
                              //   padding:
                              //       const EdgeInsets.symmetric(horizontal: 10),
                              //   child: Image.network(
                              //     "$linkcategoriesimage/${controller.categories[index]['genre_image']}",
                              //     height: 60,
                              //     width: 40,
                              //   ),
                              // ),
                              Container(
                                decoration: controller.checked == index
                                    ? BoxDecoration(
                                        color: Colors.amber.withOpacity(0.4),

                                        // border: Border(
                                        //     bottom: BorderSide(
                                        // width: 3, color: Colors.amber))

                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)))
                                    : null,
                                child: Text(
                                  "${translatdatabase(controller.categories[index]['genre_ar'], controller.categories[index]['genre'])}",
                                  style: controller.checked == index
                                      ? const TextStyle(
                                          fontSize: 20, color: Colors.black)
                                      : const TextStyle(
                                          fontSize: 18, color: Colors.black54),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  ListBooks(checked: true)
                ]),
              ),
            ));
  }
}
