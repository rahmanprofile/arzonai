import 'package:flutter/material.dart';

import '../../controller/constant.dart';

class MatchFound extends StatelessWidget {
  final String imageUrl;
  final String text;
  const MatchFound({Key? key, required this.text, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/img/$imageUrl", height: 80, width: 80),
        const SizedBox(height: 25.0),
        Center(
          child: Text(text, style: styleBlack14),
        )
      ],
    );
  }
}
