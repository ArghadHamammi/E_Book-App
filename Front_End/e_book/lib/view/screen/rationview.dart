import 'package:e_book/controller/rateview_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

class RatingView extends GetView {
 final String bookid;
  const RatingView({super.key,required this.bookid});

  @override
  Widget build(BuildContext context) {
    // RatingVire_Controllerimp controller =
    Get.put(RatingVire_Controllerimp());

    return RatingDialog(
      enableComment: false,
      initialRating: 1.0,
      // your app's name ?
      title: Text(
        '95'.tr,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        'Tap a star to set your rating',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),

      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        RatingVire_Controllerimp controller = Get.find();
        controller.rating(
          response.rating,
          bookid
        );
      },
      submitButtonText: '96'.tr,
    );

    // show the dialog

    // GetBuilder<RatingVire_Controllerimp>(
    //   builder: (controller) => Container(
    //     width: 200,
    //     height: 300,
    //     padding: EdgeInsets.symmetric(horizontal: 20),
    //     child: Column(
    //       // crossAxisAlignment: CrossAxisAlignment.center,

    //       children: [
    //         Container(
    //             alignment: Alignment.topCenter,
    //             child: ListTile(
    //               title: Text(
    //                 "94".tr,
    //               ),
    //               subtitle: Text("95".tr),
    //             )),
    //         AnimatedPositioned(
    //             child: Row(
    //               children: [
    //                 ...List.generate(
    //                     5,
    //                     (index) => IconButton(
    //                         onPressed: () {
    //                           controller.rate = controller.checked(index);
    //                         },
    //                         icon: Obx(() => controller.rate > index
    //                             ? Icon(
    //                                 Icons.star,
    //                                 size: 32,
    //                                 color: Colors.amber,
    //                               )
    //                             : Icon(
    //                                 Icons.star_border_outlined,
    //                                 size: 32,
    //                               )))),
    //               ],
    //             ),
    //             duration: Duration(milliseconds: 800))
    //       ],
    //     ),
    //   ),
    // );
  }
}
