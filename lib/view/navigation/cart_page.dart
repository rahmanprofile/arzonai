import 'package:bwi_shopify/view/screen/fake_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../controller/constant.dart';
import '../components/cart_component.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  @override
  Widget build(BuildContext context) {
    final fakePro = Provider.of<FakeData>(context);
    final cartItems = Provider.of<FakeData>(context).cartList;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        //titleSpacing: 0,
        title: Text(
          "My Cart",
          style: GoogleFonts.roboto(
              fontSize: 26.0, color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              return CartComponent(
                data: cartItems[index],
              );
            }),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {},
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0.0),
            color: logoColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("₹${fakePro.totalAmount()}", style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w400,color: Colors.white)),
                    Text("Total Amount", style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w400,color: Colors.white)),
                    //......
                  ],
                ),
                Container(
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Center(
                    child: Text("Checkout", style: styleBlack14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
