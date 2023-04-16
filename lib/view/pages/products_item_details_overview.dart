import 'package:bwi_shopify/view/pages/product_buy_details_page.dart';
import 'package:bwi_shopify/view/screen/fake_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../controller/constant.dart';
import '../components/products_card_components.dart';
import '../navigation/cart_page.dart';

class ProductsItemDetailsOverView extends StatefulWidget {
  String productName;
  String productPrice;
  DummyData data;
  bool isAvailable;
  ProductsItemDetailsOverView({
    Key? key,
    required this.productPrice,
    required this.data,
    required this.productName,
    required this.isAvailable,
  }) : super(key: key);

  @override
  State<ProductsItemDetailsOverView> createState() =>
      _ProductsItemDetailsOverViewState();
}

class _ProductsItemDetailsOverViewState
    extends State<ProductsItemDetailsOverView> {

  final PageController _pageController = PageController();
  final PageController _pageController2 = PageController();
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    final fakeProv = Provider.of<FakeData>(context);
    List<String> imageList = [
      widget.data.imageUrl.toString()
    ];
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              centerTitle: false,
              pinned: true,
              forceElevated: true,
              stretch: true,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.grey[200],
              collapsedHeight: 100,
              actions: [
                InkWell(
                  onTap: () {},
                  child: const CircleAvatar(
                    radius: 15.0,
                    backgroundColor: Colors.black54,
                    child: Center(
                      child: Icon(
                        CupertinoIcons.heart,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      fakeProv.addToCart(widget.data,context);
                                    },
                                    child: Text("My Cart",
                                        style: styleBlackNormal15)),
                                TextButton(
                                    onPressed: () {},
                                    child: Text("Show Gallery",
                                        style: styleBlackNormal15)),
                                TextButton(
                                    onPressed: () {},
                                    child: Text("Save to Wishlist",
                                        style: styleBlackNormal15)),
                                TextButton(
                                    onPressed: () {},
                                    child: Text("Share",
                                        style: styleBlackNormal15)),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Cancel",
                                        style: styleBlackNormal15)),
                              ],
                            ),
                          );
                        });
                  },
                  child: const CircleAvatar(
                    radius: 15.0,
                    backgroundColor: Colors.white,
                    child: Center(
                      child: Icon(
                        CupertinoIcons.ellipsis_vertical,
                        size: 17,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0)
              ],
              title: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const CircleAvatar(
                  radius: 15.0,
                  backgroundColor: Colors.black54,
                  child: Center(
                    child: Icon(
                      CupertinoIcons.delete_left_fill,
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              expandedHeight: 500,
              flexibleSpace: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Stack(
                  children: [
                    PageView.builder(
                        itemCount: imageList.length,
                        controller: _pageController,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (int) {
                          setState(() {
                            selectedImage = int;
                          });
                        },
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedImage = imageList.indexWhere(
                                    (element) => element == imageList[index]);
                              });
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                _pageController2.animateToPage(
                                    imageList.indexWhere((element) =>
                                        element == imageList[index]),
                                    duration: const Duration(microseconds: 1),
                                    curve: Curves.ease);
                              });
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (ctx) => Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    child: PageView.builder(
                                      itemCount: imageList.length,
                                      controller: _pageController2,
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      onPageChanged: (int) {
                                        setState(() {
                                          selectedImage = int;
                                        });
                                      },
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          child: Container(
                                            width: double.infinity,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    imageList[index]),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(imageList[index]),
                                ),
                              ),
                            ),
                          );
                        }),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.0),
                            color: Colors.grey.withOpacity(0.3)),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: imageList.map((image) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 3.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedImage = imageList.indexWhere(
                                          (element) => element == image);
                                      _pageController.animateToPage(
                                          selectedImage,
                                          duration:
                                              const Duration(milliseconds: 1),
                                          curve: Curves.ease);
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      color: Colors.grey[200],
                                      border: Border.all(
                                        color: selectedImage ==
                                                imageList.indexWhere(
                                                    (element) =>
                                                        element == image)
                                            ? Colors.blue
                                            : Colors.white,
                                      ),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(image),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    //height: 1500,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.data.name.toString(),
                              style: styleBlack25, maxLines: 2),
                          const SizedBox(height: 20.0),
                          Text(
                            "₹${widget.data.realPrice.toString()}",
                            style: GoogleFonts.roboto(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            children: [
                              Text(
                                "Availability : ",
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                widget.isAvailable
                                    ? "in stock"
                                    : "not available",
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  color: widget.isAvailable
                                      ? Colors.orange
                                      : Colors.red,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Select the quantity", style: styleBlack16),
                              const SizedBox(width: 10.0),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      // Subtraction items .............................
                                      fakeProv.removeQuantity(widget.data);
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          color: Colors.grey[200]),
                                      child: const Center(
                                        child: Icon(CupertinoIcons.minus,
                                            size: 20),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8.0),
                                  Container(
                                    height: 40,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: Colors.grey[200]),
                                    child: Center(
                                      child: Text(widget.data.quantity.toString(), style: styleBlack14),
                                    ),
                                  ),
                                  const SizedBox(width: 8.0),
                                  InkWell(
                                    onTap: () {
                                      // Addition items .............................
                                      fakeProv.addToCart(widget.data,context);
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          color: Colors.grey[200]),
                                      child: const Center(
                                        child:
                                            Icon(CupertinoIcons.add, size: 20),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    fakeProv.addToCart(widget.data,context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ProductsBuyDetailsPage(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 50.0,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: logoColor,
                                    ),
                                    child: Center(
                                      child:
                                          Text("BUY NOW", style: styleWhite15),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: InkWell(
                                  onTap: () {

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const CartPage(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 50.0,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: bgColor,
                                    ),
                                    child: Center(
                                      child: Text("ADD TO CART",
                                          style: styleBlack15),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Container(
                            padding: const EdgeInsets.all(0.1),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: bgColor,
                            ),
                            child: ExpansionTile(
                              title: Text("DESCRIPTION", style: styleBlack13),
                              expandedCrossAxisAlignment:
                                  CrossAxisAlignment.start,
                              expandedAlignment: Alignment.topLeft,
                              childrenPadding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8.0),
                              children: [
                                Text("Lara Venoise",
                                    style: styleBlack17,
                                    textAlign: TextAlign.start),
                                const SizedBox(height: 10.0),
                                Text(
                                    "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
                                    style: styleGrey13,
                                    textAlign: TextAlign.start),
                                const SizedBox(height: 8.0),
                                Text("Size", style: styleBlack14),
                                Text(
                                  "Size : 8X12 \nSize : 12X18 \nSize : 18X24",
                                  style: styleBlackNormal13,
                                  textAlign: TextAlign.start,
                                ),
                                const SizedBox(height: 8.0),
                                Text("Delivery", style: styleBlack14),
                                Text(
                                  "Time : 5 TO 8 DAYS",
                                  style: styleBlackNormal13,
                                  textAlign: TextAlign.start,
                                ),
                                const SizedBox(height: 8.0),
                                Text("Help", style: styleBlack14),
                                Text(
                                  "Contacts : For any help with ordering contact on whatsapp",
                                  style: styleBlackNormal13,
                                  textAlign: TextAlign.start,
                                ),
                                const SizedBox(height: 10.0),
                                Text("How to place order ?",
                                    style: styleBlack14),
                                Text(
                                  "Lorem ipsum is placeholder text commonly used in the graphic, print, and \npublishing industries for previewing layouts and visual mockups. Lorem ipsum is placeholder text commonly used in the graphic, print, and \npublishing industries for previewing layouts and visual mockups.",
                                  style: styleGrey13,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Container(
                            padding: const EdgeInsets.all(0.1),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: bgColor,
                            ),
                            child: ExpansionTile(
                              title: Text("CATEGORY", style: styleBlack14),
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: Text("ANNIVERSARY",
                                          style: styleBlack13),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child:
                                          Text("BIRTHDAY", style: styleBlack13),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child:
                                          Text("TRENDING", style: styleBlack13),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: Text("ALL-PRODUCTS",
                                          style: styleBlack13),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child:
                                          Text("PAINTING", style: styleBlack13),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text("BEST SELLING",
                                          style: styleBlack13),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: Text("ELECTRONICS",
                                          style: styleBlack13),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child:
                                          Text("WATCH'S", style: styleBlack13),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Container(
                            padding: const EdgeInsets.all(0.1),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: bgColor,
                            ),
                            child: ExpansionTile(
                              title: Text("TAGS", style: styleBlack14),
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: Text("#ANNIVERSARY",
                                          style: styleBlack13),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text("#BIRTHDAY",
                                          style: styleBlack13),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text("#TRENDING",
                                          style: styleBlack13),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: Text("#ALL-PRODUCTS",
                                          style: styleBlack13),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text("#PAINTING",
                                          style: styleBlack13),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text("#BEST SELLING",
                                          style: styleBlack13),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text("You might also like", style: styleBlack25),
                          const SizedBox(height: 15.0),
                          // SizedBox(
                          //   height: 400,
                          //   child: GridView.builder(
                          //     itemCount: 10,
                          //     // physics: const NeverScrollableScrollPhysics(),
                          //     shrinkWrap: true,
                          //     scrollDirection: Axis.horizontal,
                          //     gridDelegate:
                          //         SliverGridDelegateWithFixedCrossAxisCount(
                          //       crossAxisCount: 1,
                          //       mainAxisExtent:
                          //           MediaQuery.of(context).size.width * 0.50 -
                          //               20,
                          //     ),
                          //     itemBuilder: (context, index) {
                          //       return ProductCardComponent(
                          //         productName: "Signature Perfume",
                          //         productPrice: "1500",
                          //         productUrl:
                          //             "https://ustraa.cdn.imgeng.in/media/catalog/product/b/a/base-camp-cologne_image-1.jpg",
                          //         discountPrice: "2000",
                          //         favouriteItem: true,
                          //         cartOnTap: () {},
                          //         favTap: () {},
                          //         productTap: () {
                          //           Navigator.push(
                          //             context,
                          //             MaterialPageRoute(
                          //               builder: (context) =>
                          //                   ProductsItemDetailsOverView(
                          //                 productPrice: "1500",
                          //                 productName: "Signature Perfume",
                          //                 isAvailable: true,
                          //               ),
                          //             ),
                          //           );
                          //         },
                          //       );
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
