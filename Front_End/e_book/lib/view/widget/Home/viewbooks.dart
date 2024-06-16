import 'package:e_book/controller/homepage_controller.dart';
import 'package:e_book/core/constant/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ViewBooks extends GetView<HomePageControllerimp> {
  const ViewBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        itemCount: controller.books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Image.network(
                  "$linkBookimage/${controller.books[index]['Book_image']}",
                  height: 280,
                  width: 120,
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
                child: Text("${controller.books[index]['book_title']}"),
              ),
            ],
          );
        },
      ),
    );
  }
}

