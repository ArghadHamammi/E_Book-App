import 'package:e_book/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCard extends StatelessWidget {
  final Widget? text1;
  final Widget? text2;

  const HomeCard({super.key, this.text1, this.text2});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    var lang = myServices.sharedPreferences.getString("lang");
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            height: lang == "ar" ? 80 : 70,
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                text1!,
                SizedBox(width: 10),
                text2!,
              ],
            ),
          ),
          Positioned(
            top: lang == "en" ? -15 : null,
            right: lang == "en" ? -15 : null,
            bottom: lang == "ar" ? -15 : null,
            left: lang == "ar" ? -15 : null,
            child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: const Color(0xfff6e58d),
                    borderRadius: BorderRadius.circular(160)),
                child: Icon(Icons.tag_faces_sharp)),
          ),
        ],
      ),
    );
  }
}
