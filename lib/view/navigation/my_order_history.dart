import 'package:bwi_shopify/controller/payments/order_summary.dart';
import 'package:bwi_shopify/view/components/card_order.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyOrderHistory extends StatefulWidget {
  const MyOrderHistory({Key? key}) : super(key: key);

  @override
  State<MyOrderHistory> createState() => _MyOrderHistoryState();
}

class _MyOrderHistoryState extends State<MyOrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        // backgroundColor: Colors.grey[400],
        title: Text("My Orders",
            style: GoogleFonts.jost(fontSize: 23, fontWeight: FontWeight.w400)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CardOrder(
                orderId: "ORD2002",
                productName: "Stylish Kids Bags",
                productPrice: 599.0,
                imageUrl: "assets/cate/packs2.webp",
                deliveryTime: "21/04/2023",
                viewOrder: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OrderSummary()),
                  );
                },
              ),
              CardOrder(
                orderId: "ORD4393",
                productName: "Stylish Jute Bags",
                productPrice: 999.0,
                imageUrl: "assets/cate/jute5.webp",
                deliveryTime: "23/04/2023",
                viewOrder: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OrderSummary()),
                  );
                },
              ),
              CardOrder(
                orderId: "ORD1293",
                productName: "Stylish Jute Bags",
                productPrice: 1999.0,
                imageUrl: "assets/cate/jute2.webp",
                deliveryTime: "24/04/2023",
                viewOrder: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OrderSummary()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
