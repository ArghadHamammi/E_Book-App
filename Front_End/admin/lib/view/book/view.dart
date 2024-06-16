import 'package:admin/controller/books/bookview_controller.dart';
import 'package:admin/core/constant/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookView extends StatelessWidget {
  const BookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BookViewcontrollerimp());
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber.withOpacity(0.8),
          onPressed: () {
            Get.toNamed("bookadd");
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text("99".tr),
          centerTitle: true,
          backgroundColor: Colors.amber.withOpacity(0.7),
        ),
        body: GetBuilder<BookViewcontrollerimp>(
          builder: (controller) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.builder(
                itemCount: controller.genre.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 200),
                itemBuilder: (context, index) => Card(
                      child: Column(children: [
                        Row(
                          children: [
                            Image.network(
                              "$linkBookimage/${controller.genre[index]['Book_image']}",
                              height: 100,
                              width: 80,
                            ),
                            IconButton(
                                onPressed: () {
                                  controller.delete(
                                      controller.genre[index]['Book_id']
                                          .toString(),
                                      controller.genre[index]['Book_image']);
                                },
                                icon: const Icon(Icons.delete)),
                            IconButton(
                                onPressed: () {
                                  controller.gotoedit(
                                      controller.genre[index]['Book_id']
                                          .toString(),
                                      controller.genre[index]['book_title'],
                                      controller.genre[index]['book_auther'],
                                      controller.genre[index]['data_published'],
                                      controller.genre[index]['Book_image'],
                                      controller.genre[index]['book_link'],
                                      controller.genre[index]['book_publisher'],
                                      controller.genre[index]['Book_ca'].toString());
                                },
                                icon: const Icon(Icons.edit)),
                          ],
                        ),
                        ListTile(
                          title:
                              Text("${controller.genre[index]['book_title']}"),
                        ),
                      ]),
                    )),
          ),
        ));
  }
}
