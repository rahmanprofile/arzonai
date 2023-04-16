import 'package:bwi_shopify/controller/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrdersCartItem extends StatefulWidget {
  const OrdersCartItem({Key? key}) : super(key: key);

  @override
  State<OrdersCartItem> createState() => _OrdersCartItemState();
}

class _OrdersCartItemState extends State<OrdersCartItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[500],
        title: Text("My Orders",
            style: GoogleFonts.roboto(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.white,),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.grey[200]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Shipping Address",
                        style: GoogleFonts.jost(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Checkbox(value: true, onChanged: (value) {}),
                      const Spacer(),
                      Text(
                        "Shipping Address",
                        style: GoogleFonts.jost(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Checkbox(value: false, onChanged: (value) {}),
                    ],
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text("Pitampura, New-Delhi", style: styleBlack14),
                  const SizedBox(height: 5.0),
                  Text("Delhi, 110034", style: styleBlack14),
                  const SizedBox(height: 5.0),
                  Text("+918052399848", style: styleBlack14),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            Container(
              height: 45.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.black54),
              child: Center(
                child: Text("Change or Add Address", style: styleWhite14),
              ),
            ),
            const SizedBox(height: 8.0),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.grey[200],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Product", style: styleBlack17),
                  const SizedBox(height: 10.0),
                  Container(
                    height: 1,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.black54),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      Container(
                        height: 120,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                              "https://www.fitbit.com/global/content/dam/fitbit/global/marketing-pages/quiz/desktop/fall2022-quiz-pathing-module-trackers.jpg",
                              height: 120,
                              width: 150,
                              fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("₹2999", style: styleBlack18),
                          const SizedBox(height: 8.0),
                          Text("Smart watch", style: styleBlack14),
                          const SizedBox(height: 2.0),
                          Text("Smart Watch cool exclusive", style: styleGrey13),
                        ],
                      ),
                      const SizedBox(width: 10.0),
                    ],
                  ),
                ],
              ),
            ),

            //..............
            const SizedBox(height: 8.0),
            Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.grey[200],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Product", style: styleBlack17),
                  const SizedBox(height: 10.0),
                  Container(
                    height: 1,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.black54),
                  ),
                  const SizedBox(height: 10.0),
                  ListTile(
                    title: Text("Subtotal",style: styleBlack17),
                    trailing: Text("₹999",style: styleBlack17),
                  ),
                  ListTile(
                    title: Text("Delivery Charge",style: styleBlack17),
                    trailing: Text("Free",style: GoogleFonts.roboto(fontSize: 17,color: Colors.green)),
                  ),
                  ListTile(
                    title: Text("Total amount",style: styleBlack17),
                    trailing: Text("₹999.0",style: styleBlack17),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0.0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 3.0,
                        blurRadius: 5.0,
                        offset: Offset(0.7, 0.7))
                  ]),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("₹999", style: styleBlack20),
                      Text(
                        "Place My Order",
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 45,
                    width: 110,
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(4.0)),
                    child: Center(
                      child: Text("Place Order", style: styleWhite14),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
