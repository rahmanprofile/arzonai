import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../controller/constant.dart';
import '../pages/products_item_details_overview.dart';

class WishlistComponent extends StatefulWidget {
  const WishlistComponent({Key? key}) : super(key: key);

  @override
  State<WishlistComponent> createState() => _WishlistComponentState();
}

class _WishlistComponentState extends State<WishlistComponent> {
  var itemCountList = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];
  String currentItem = "1";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                  // MaterialPageRoute(
                    // builder: (context) => ProductsItemDetailsOverView(
                    //   data: ,
                    //   productPrice: "1399",
                    //   productName: "Example product name",
                    //   isAvailable: false,
                    // ),
                //   ),
                // );
              },
              child: Container(
                height: 100,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.grey),
                  //color: Colors.grey[200],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    "https://rukminim1.flixcart.com/image/832/832/xif0q/cycle/h/i/6/bolt-ut5000s26-steel-mtb-disc-brakes-free-installation-original-imagg5adz4ch3njb.jpeg?q=70",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Casual T-Shirt for men", maxLines: 2, style: styleBlack14),
              Text("₹ : 599", maxLines: 2, style: styleBlackNormal12),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(2.0)),
                      child: const Center(
                        child: Icon(CupertinoIcons.minus,
                            color: blackColor, size: 18),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  Container(
                    height: 30,
                    width: 45,
                    decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(2.0)),
                    child: Center(
                      child: Text("1", style: styleBlack15),
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(2.0)),
                      child: const Center(
                        child: Icon(CupertinoIcons.add,
                            color: blackColor, size: 18),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.delete,
                          color: redColor, size: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
