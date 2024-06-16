// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextFormFieldd extends StatelessWidget {
  final String labeltext;
  final String hinttext;
  final IconData myicon;
  final String? Function(String?)? valid;
  final TextEditingController mycontroller;
  final TextInputType? type;
  final bool? visib;
  final void Function()? onTapicon;
  const TextFormFieldd({
    Key? key,
    required this.labeltext,
    required this.hinttext,
    required this.myicon,
    required this.mycontroller,
    required this.valid,
    required this.type,
    this.visib,
    this.onTapicon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: valid,
      controller: mycontroller,
      keyboardType: type,
      obscureText: visib == null || visib == false ? false : true,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          label: Text(
            labeltext,
            style: const TextStyle(fontSize: 22),
          ),
          hintText: hinttext,
          hintStyle: const TextStyle(fontSize: 14),
          suffixIcon: InkWell(
            onTap: onTapicon,
            child: Icon(myicon),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
  }
}
