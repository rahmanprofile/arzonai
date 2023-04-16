import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardOrder extends StatelessWidget {
  final String orderId;
  final String productName;
  final String imageUrl;
  final String deliveryTime;
  final double productPrice;
  final VoidCallback viewOrder;
  const CardOrder({
    Key? key,
    required this.orderId,
    required this.productName,
    required this.productPrice,
    required this.imageUrl,
    required this.deliveryTime,
    required this.viewOrder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8.0),
        Container(
          padding: const EdgeInsets.all(8.0),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Text(
                "Placed on : $deliveryTime",
                style: GoogleFonts.jost(
                    fontSize: 14, fontWeight: FontWeight.normal),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Container(
                  height: 1,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    color: Colors.grey[500],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const SizedBox(width: 10),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        // color: Colors.grey[200],
                        border: Border.all(color: Colors.black54)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(imageUrl,
                          height: 150, width: 150, fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "₹$productPrice",
                        style: GoogleFonts.jost(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        productName,
                        style: GoogleFonts.jost(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        "Pending for delivery",
                        style: GoogleFonts.jost(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 8.0),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: viewOrder,
                child: Row(
                  children: [
                    const SizedBox(width: 2),
                    Text(
                      "Order Id : $orderId",
                      style: GoogleFonts.jost(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Text(
                      "View Order ",
                      style: GoogleFonts.jost(fontSize: 17, color: Colors.red),
                    ),
                    const SizedBox(width: 2),
                    const Icon(CupertinoIcons.arrow_right,
                        color: Colors.red, size: 20),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
