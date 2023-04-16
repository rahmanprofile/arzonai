import 'package:flutter/material.dart';

import '../constant.dart';
class CheckoutPlace extends StatefulWidget {
  const CheckoutPlace({Key? key}) : super(key: key);

  @override
  State<CheckoutPlace> createState() => _CheckoutPlaceState();
}

class _CheckoutPlaceState extends State<CheckoutPlace> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Checkout",style: styleBlack20),
          bottom:const TabBar(
            labelStyle: TextStyle(color: Colors.black),
            physics: BouncingScrollPhysics(),
            isScrollable: false,
            unselectedLabelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            tabs: [
              Tab(
                child: Text("Address"),
              ),
              Tab(
                child: Text("Shipping"),
              ),
              Tab(
                child: Text("Preview"),
              ),
              Tab(
                child: Text("Payment"),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
