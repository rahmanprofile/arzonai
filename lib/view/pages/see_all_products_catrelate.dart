import 'package:bwi_shopify/view/pages/products_item_details_overview.dart';
import 'package:bwi_shopify/view/screen/fake_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../controller/constant.dart';
import '../components/products_card_components.dart';
import '../components/search_componnet.dart';
import '../navigation/cart_page.dart';
import 'my_wishlist.dart';

class SeeAllProductsCategoryRelated extends StatefulWidget {
  String titleText;
  SeeAllProductsCategoryRelated({Key? key, required this.titleText})
      : super(key: key);

  @override
  State<SeeAllProductsCategoryRelated> createState() =>
      _SeeAllProductsCategoryRelatedState();
}

class _SeeAllProductsCategoryRelatedState
    extends State<SeeAllProductsCategoryRelated> {
  bool isCart = false;
  int selectedIndex = -1;
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final fakeProv = Provider.of<FakeData>(context);
    List<DummyData> productList = fakeProv.dummyData.where((element) => element.category == widget.titleText).toList();
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: SearchComponent(
          text: 'Search',
          onChanged: (value) {},
          controller: searchController,
          onTap: () {},
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CartPage()));
                  },
                  child: Row(
                    children: [
                      const Icon(CupertinoIcons.cart),
                      const SizedBox(width: 10.0),
                      Text("My Cart", style: styleBlack12),
                    ],
                  ),
                ),
              ),
              PopupMenuItem(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyWishlist()));
                  },
                  child: Row(
                    children: [
                      const Icon(CupertinoIcons.heart),
                      const SizedBox(width: 10.0),
                      Text("My Wishlist", style: styleBlack12),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 10.0),
            child: Text(widget.titleText,
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500, fontSize: 22.0)),
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: GridView.builder(
              itemCount: productList.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 400,
              ),
              itemBuilder: (context, index) {
                return ProductCardComponent(
                  productName: productList[index].name.toString(),
                  productPrice: productList[index].realPrice.toString(),
                  productUrl: productList[index].imageUrl.toString(),
                  discountPrice: productList[index].discountPrice.toString(),
                  cartOnTap: () {
                    fakeProv.addToCart(productList[index],context);
                  },
                  productTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsItemDetailsOverView(
                          data: productList[index],
                          productPrice: productList[index].realPrice.toString(),
                          productName: productList[index].name.toString(),
                          isAvailable: true,
                        ),
                      ),
                    );
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
          ),
        ],
      ),
    );
  }
}
