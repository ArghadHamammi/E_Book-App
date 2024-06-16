import 'package:admin/controller/genre/genreview_controller.dart';
import 'package:admin/core/constant/linkapi.dart';
import 'package:admin/core/function/translatedatabase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenreView extends StatelessWidget {
  const GenreView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GenreViewControllerimp());
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.amber.withOpacity(0.8),
            onPressed: () {
              Get.toNamed("genreadd");
            },
            child: const Icon(Icons.add)),
        appBar: AppBar(
          title: Text("97".tr),
          centerTitle: true,
          backgroundColor: Colors.amber.withOpacity(0.7),
        ),
        body: GetBuilder<GenreViewControllerimp>(
            builder: (controller) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                      itemCount: controller.genre.length,
                      itemBuilder: (context, index) => Card(
                              child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Image.network(
                                  "$linkcategoriesimage/${controller.genre[index]['genre_image']}",
                                  scale: 1.0,
                                  height: 80,
                                  width: 60,
                                ),
                              ),
                              Expanded(
                                  flex: 3,
                                  child: Row(
                                    children: [
                                      Text(
                                        "${translatdatabase(controller.genre[index]['genre_ar'], controller.genre[index]['genre'])}",
                                      ),
                                    ],
                                  )),
                              IconButton(
                                  onPressed: () {
                                    controller.delete(
                                        controller.genre[index]['categories_id']
                                            .toString(),
                                        controller.genre[index]['genre_image']);
                                  },
                                  icon: const Icon(Icons.delete)),
                              IconButton(
                                  onPressed: () {
                                    controller.gotoedit(
                                      controller.genre[index]['categories_id']
                                          .toString(),
                                      controller.genre[index]['genre'],
                                      controller.genre[index]['genre_ar'],
                                      controller.genre[index]['genre_image'],
                                    );
                                  },
                                  icon: const Icon(Icons.edit)),
                            ],
                          ))),
                )));
  }
}
