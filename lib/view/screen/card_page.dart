import 'package:flutter/material.dart';
import '../components/products_card_components.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  bool isCart = false;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: const Text("CardPage"),
      ),
      body: GridView.builder(
        itemCount: 40,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 400,
        ),
        itemBuilder: (context, index) {
          return ProductCardComponent(
            productName: 'Photo shadow view',
            productPrice: "1200",
            productUrl:
                "https://cdn.shopify.com/s/files/1/0515/6169/3382/products/vital-c-cleanser-with-background_b5d9d318-4ecb-42ba-8bf4-ddeb3de5f9c8_800x.jpg?v=1617285263",
            discountPrice: "1250",
            cartOnTap: () {
              debugPrint("cart items taps");
            },
            productTap: () {
              debugPrint("product items taps");
            },
            favouriteItem: selectedIndex == index,
            favTap: () {
              setState(() {
                isCart = !isCart;
                selectedIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}
