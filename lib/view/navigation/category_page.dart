import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/category_card_component.dart';
import '../pages/products_item_details_overview.dart';
import '../pages/search_page.dart';
import '../pages/see_all_products_catrelate.dart';
import '../pages/slider_items.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Category",
          style: GoogleFonts.roboto(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SearchPage()));
            },
            icon: const Icon(CupertinoIcons.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 8.0),
            CategoryCardComponent(
              imageUrl:
                  'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SeeAllProductsCategoryRelated(titleText: "All ITEMS"),
                  ),
                );
              },
            ),
            const SizedBox(height: 15.0),
            Text(
              "CATEGORY & GIFT",
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 12.0),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey[200]),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _cardButton(
                          "Gift",
                          "assets/icons/store_icon.svg",
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SeeAllProductsCategoryRelated(
                                  titleText: "Gifts",
                                ),
                              ),
                            );
                          },
                        ),
                        _cardButton(
                          "Anniversary",
                          "assets/icons/all_icon.svg",
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SeeAllProductsCategoryRelated(
                                  titleText: "Anniversary",
                                ),
                              ),
                            );
                          },
                        ),
                        _cardButton(
                          "BirthDay",
                          "assets/icons/interface_icon.svg",
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SeeAllProductsCategoryRelated(
                                  titleText: "BirthDay",
                                ),
                              ),
                            );
                          },
                        ),
                        _cardButton(
                          "Cushions",
                          "assets/icons/offer_icon.svg",
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SeeAllProductsCategoryRelated(
                                  titleText: "Cushions",
                                ),
                              ),
                            );
                          },
                        ),
                        _cardButton(
                          "Other's",
                          "assets/icons/party_icon.svg",
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SeeAllProductsCategoryRelated(
                                  titleText: "Other's",
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            _productItem(
              "https://artoftesting.com/wp-content/uploads/2022/03/what-is-ecommerce.jpg",
              () {},
            ),
            const SizedBox(height: 8.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [1, 2, 3, 4, 5].map((e) {
                  return SliderItems(
                    productName: "The Signs of book",
                    productPrice: "1599",
                    productUrl:
                        "https://cdn.shopify.com/s/files/1/0641/2907/3385/products/Zeb-soundbomb1-pic2_1000x.jpg?v=1653541055",
                    discountPrice: "1999",
                    favouriteItem: false,
                    cartOnTap: () {},
                    favTap: () {},
                    productTap: () {},
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 8.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [1, 2, 3, 4, 5].map((e) {
                  return SliderItems(
                    productName: "The Signs of book",
                    productPrice: "1599",
                    productUrl:
                        "https://cdn.shopify.com/s/files/1/0641/2907/3385/products/Zeb-soundbomb1-pic2_1000x.jpg?v=1653541055",
                    discountPrice: "1999",
                    favouriteItem: false,
                    cartOnTap: () {},
                    favTap: () {},
                    productTap: () {},
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [1, 2, 3, 4, 5].map((e) {
                  return SliderItems(
                    productName: "The Signs of book",
                    productPrice: "1599",
                    productUrl:
                        "https://cdn.shopify.com/s/files/1/0641/2907/3385/products/Zeb-soundbomb1-pic2_1000x.jpg?v=1653541055",
                    discountPrice: "1999",
                    favouriteItem: false,
                    cartOnTap: () {},
                    favTap: () {},
                    productTap: () {},
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _cardButton(String text, String icon, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              height: 45.0,
              width: 45.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                // color: Colors.white,
              ),
              child: Center(
                child: SvgPicture.asset(icon),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              text,
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _productItem(String imageUrl, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 130,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.grey[200],
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageUrl),
          ),
        ),
      ),
    );
  }
}
