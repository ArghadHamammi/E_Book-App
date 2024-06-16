import 'package:e_book/controller/homepage_controller.dart';
import 'package:e_book/core/constant/linkapi.dart';
import 'package:e_book/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCate extends GetView<HomePageControllerimp> {
  const HomeCate({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        separatorBuilder: ((context, index) {
          return const SizedBox(
            height: 70,
          );
        }),
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return Categories(
            categoriesmodel: CategoriesModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categories extends StatelessWidget {
  final CategoriesModel categoriesmodel;
  const Categories({super.key, required this.categoriesmodel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                color: Colors.amber[200],
                borderRadius: BorderRadius.circular(50)),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 70,
            child: Image.network(
              "$linkcategoriesimage/${categoriesmodel.categoriesImage}",
              color: Colors.black,
            )),
        Text(
          "$linkcategoriesimage/${categoriesmodel.categoriesName}",
          style: const TextStyle(fontSize: 18, color: Colors.black),
        ),
      ],
    );
  }
}
