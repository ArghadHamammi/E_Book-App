import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class MyAppBar extends StatelessWidget {
  final String? hint;
  final void Function()? myonpressed;

  final void Function(String)? myonChanged;
  final void Function()? searchonPressed;
  final TextEditingController mycontroller;
  const MyAppBar({
    super.key,
    this.hint,
    this.searchonPressed,
    this.myonpressed,
    this.myonChanged, required this.mycontroller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
                controller: mycontroller,
            onChanged: myonChanged,
            decoration: InputDecoration(
                prefixIcon: IconButton(
                    icon: const Icon(Icons.search), onPressed: searchonPressed),
                hintText: hint,
                hintStyle: const TextStyle(fontSize: 16),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25)),
                filled: true,
                fillColor: Colors.grey[200]),
          )),
          const SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.amber[100],
            ),
            width: 50,
            child: IconButton(
                onPressed: myonpressed,
                icon: const Icon(
                  Icons.notifications_active_outlined,
                  size: 33,
                  color: Colors.black38,
                )),
          ),
          SizedBox(
            width: 7,
          ),
        ],
      ),
    );
  }
}
