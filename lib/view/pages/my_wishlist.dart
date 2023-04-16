import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/constant.dart';
import '../components/wishlist_component.dart';

class MyWishlist extends StatefulWidget {
  const MyWishlist({Key? key}) : super(key: key);

  @override
  State<MyWishlist> createState() => _MyWishlistState();
}

class _MyWishlistState extends State<MyWishlist> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("My Wishlist",
            style: GoogleFonts.raleway(fontWeight: FontWeight.w600)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Center(
          child: ListView.builder(
            itemCount: 1,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Center(
                child: Text("No items found",style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w500)),
              );
            },
          ),
        ),
      ),
      // bottomNavigationBar: GestureDetector(
      //   onTap: () {},
      //   child: Container(
      //     height: 60,
      //     width: double.infinity,
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(0.0),
      //       color: logoColor,
      //     ),
      //     child: Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 10.0),
      //       child: Row(
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Column(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Text("Total amount", style: styleWhite16),
      //               Text("₹1,278", style: styleWhite13),
      //             ],
      //           ),
      //           Container(
      //             height: 35,
      //             width: 100,
      //             decoration: BoxDecoration(
      //                 color: whiteColor,
      //                 borderRadius: BorderRadius.circular(5.0)),
      //             child: Center(
      //               child: Text("Checkout", style: styleBlack14),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

/*Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/img/heart.png", height: 70.0, width: 70.0),
            const SizedBox(height: 30.0),
            Text(
              "No favourites yet",
              style: GoogleFonts.raleway(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 15.0),
            Text(
                "Tap any heart next to a product to favourite. We will save them",
                style: styleBlackNormal12),
            Text("for you here!", style: styleBlackNormal12),
            const SizedBox(height: 25.0),
            isLoading
                ? Center(
                    child: CircularProgressIndicator(color: royalBlue),
                  )
                : InkWell(
                    onTap: () {},
                    child: Container(
                      height: 45.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: blackColor,
                      ),
                      child: Center(
                        child:
                            Text("START SHOPPING", style: styleWhiteNormal13),
                      ),
                    ),
                  ),
            const SizedBox(height: 15.0),
            InkWell(
              onTap: () {},
              child: Container(
                height: 45.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: cardColor,
                ),
                child: Center(
                  child: Text("SEARCH FOR ITEM", style: styleBlackNormal13),
                ),
              ),
            ),
          ],
        ),
      ),*/
