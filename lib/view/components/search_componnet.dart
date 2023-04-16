import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchComponent extends StatelessWidget {
  String text;
  ValueChanged onChanged;
  TextEditingController controller;
  VoidCallback onTap;
  SearchComponent({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.controller,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey[200],
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          onChanged: onChanged,
          onTap: onTap,
          decoration: InputDecoration(
            hintText: text,
            suffix:const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Text(""),
            ),
            prefixIcon: const Icon(
              CupertinoIcons.search,
              size: 18,
              color: Colors.black,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
