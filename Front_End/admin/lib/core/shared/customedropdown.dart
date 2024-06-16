import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class CustomeDropDown extends StatefulWidget {
  final String title;
  final List<SelectedListItem> listdata;
  final TextEditingController selectefname;
  final TextEditingController selectedid;
  final IconData myicon;

  const CustomeDropDown(
      {super.key,
      required this.title,
      required this.listdata,
      required this.selectefname,
      required this.selectedid,
      required this.myicon});

  @override
  State<CustomeDropDown> createState() => _CustomeDropDownState();
}

class _CustomeDropDownState extends State<CustomeDropDown> {
  void show() {
    DropDownState(
      DropDown(
        isDismissible: true,
        bottomSheetTitle: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        clearButtonChild: const Text(
          'Clear',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.listdata,
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem select = selectedList[0];
          widget.selectefname.text = select.name;
          widget.selectedid.text = select.value!;
        },
        // enableMultipleSelection: true,
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.selectefname,
      cursorColor: Colors.black,
      onTap: () {
        FocusScope.of(context).unfocus();
        show();
      },
      decoration: InputDecoration(
        icon: Icon(widget.myicon),
        filled: true,
        fillColor: Colors.amber.withOpacity(0.41),
        contentPadding:
            const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
        hintText: widget.selectefname.text == ""
            ? widget.title
            : widget.selectefname.text,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
