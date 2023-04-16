import 'package:flutter/material.dart';

class ProductsBuyDetailsPage extends StatefulWidget {
  const ProductsBuyDetailsPage({Key? key}) : super(key: key);

  @override
  State<ProductsBuyDetailsPage> createState() => _ProductsBuyDetailsPageState();
}

class _ProductsBuyDetailsPageState extends State<ProductsBuyDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title:const Text("Buy Items details"),
      ),
    );
  }
}
