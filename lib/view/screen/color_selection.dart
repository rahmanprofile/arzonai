import 'package:flutter/material.dart';

class ColorSelection extends StatefulWidget {
  const ColorSelection({Key? key}) : super(key: key);

  @override
  State<ColorSelection> createState() => _ColorSelectionState();
}

class _ColorSelectionState extends State<ColorSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Color Selection"),
      ),
      body: Column(
        children: [
          Container(
            height: 190,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0.0),
              color: Colors.red
            ),
          ),

          Container(
            height: 190,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),
                color: Colors.orange
            ),
          ),

          Container(
            height: 190,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),
                color: Colors.blue
            ),
          ),

          Container(
            height: 190,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),
                color: Colors.green
            ),
          ),
        ],
      ),
    );
  }
}
