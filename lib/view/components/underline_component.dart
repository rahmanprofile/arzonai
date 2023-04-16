import 'package:flutter/material.dart';

class UnderLineComponent extends StatelessWidget {
  const UnderLineComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 72,right: 10.0),
      child: Container(
        height: 1,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.grey[300]
        ),
      ),
    );
  }
}
