import 'package:flutter/material.dart';

class MyButtomAppBar extends StatelessWidget {
  final void Function() myonpressed;
  final String text1;
  final IconData myicon;
  // final Color mycolor;
  final bool active;
  const MyButtomAppBar(
      {super.key,
      required this.myonpressed,
      required this.text1,
      required this.myicon,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: myonpressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            myicon,
            color: active == true ? Colors.amber : Colors.black54,
          ),
          Text(
            text1,
            style: TextStyle(
                color: active == true ? Colors.amber : Colors.black38),
          ),
        ],
      ),
    );
  }
}
