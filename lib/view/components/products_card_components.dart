import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCardComponent extends StatelessWidget {
  String productName;
  String productPrice;
  String productUrl;
  String discountPrice;
  bool favouriteItem;
  VoidCallback productTap;
  VoidCallback cartOnTap;
  VoidCallback favTap;
  ProductCardComponent({
    Key? key,
    required this.productName,
    required this.productPrice,
    required this.productUrl,
    required this.discountPrice,
    required this.favouriteItem,
    required this.cartOnTap,
    required this.favTap,
    required this.productTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: productTap,
                    child: Container(
                      height: 300.0,
                      width: MediaQuery.of(context).size.width * 0.50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0),
                        color: Colors.black54,
                      ),
                      child: Image.asset(productUrl, fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10.0),
                          Text(
                            productName,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                                color: Colors.blueGrey, fontSize: 15),
                          ),
                          const SizedBox(height: 5.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "₹$productPrice",
                                style: GoogleFonts.jost(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(width: 10.0),
                              Text(
                                "₹$discountPrice",
                                style: GoogleFonts.jost(
                                    color: Colors.red,
                                    fontSize: 15.0,
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.w400),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: cartOnTap,
                                child:
                                    const Icon(CupertinoIcons.cart, size: 18),
                              ),
                              const SizedBox(
                                width: 5,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 10.0,
                right: 10.0,
                child: CircleAvatar(
                  radius: 15.0,
                  backgroundColor: Colors.grey[200],
                  child: Center(
                    child: InkWell(
                      onTap: favTap,
                      child: Icon(
                        favouriteItem
                            ? CupertinoIcons.heart_fill
                            : CupertinoIcons.heart,
                        color: favouriteItem ? Colors.red : Colors.red,
                        size: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
