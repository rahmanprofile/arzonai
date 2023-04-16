import 'package:bwi_shopify/view/pages/slider_items.dart';
import 'package:bwi_shopify/view/screen/fake_data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../controller/constant.dart';
import '../pages/drawer_pages.dart';
import '../pages/search_page.dart';
import '../pages/see_all_products_catrelate.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> myImages = [
    "assets/cate/bag1.png",
    "assets/cate/bag2.png",
    "assets/cate/bag3.png",
  ];
  // Next Images
  List<String> shopImages = [
    "assets/cate/new-banner.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    final fake = Provider.of<FakeData>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const Drawer(
        child: DrawerPages(),
      ),
      appBar: AppBar(
        title: const Text("ARZONAI"),
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
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          // controller: _pageController,
          children: [
            CarouselSlider.builder(
              itemCount: myImages.length,
              options: CarouselOptions(
                height: 150,
                autoPlay: true,
                viewportFraction: 1.0,
              ),
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: Container(
                    height: 150.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.grey[200],
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(myImages[itemIndex].toString()),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 8.0),

            const SizedBox(height: 12.0),
            Text(
              "Shop By Category",
              style:
              GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w400),
            ),

            const SizedBox(height: 15.0),
            Wrap(children: fake.dummyCategory.map((item) {
              return _shopByCategoryCard(
                item['name'],
                item['image'],
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SeeAllProductsCategoryRelated(
                          titleText: item['name']),
                    ),
                  );
                },
              );
            }).toList(),),
            const SizedBox(height: 12.0),
            Container(
              height: 150.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.grey[200],
                image:const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/cate/new-banner.jpg"),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
          ],
        ),
      ),
    );
  }

  Widget _shopByCategoryCard(String text, String imageUrl, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.width / 3 - 15,
            width: MediaQuery.of(context).size.width / 3 - 15,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),
                color: bgColor,
                border: Border.all(color: Colors.grey[300]!, width: 2)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            text,
            style: GoogleFonts.raleway(
                fontSize: 15, color: Colors.black, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     Text("BEST SELLING", style: styleBlack17),w
//     TextButton(
//       onPressed: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => SeeAllProductsCategoryRelated(
//               titleText: "BEST SELLING",
//             ),
//           ),
//         );
//       },
//       child: Text('See All', style: styleBlackNormal13),
//     ),
//   ],
// ),
//const SizedBox(height: 12.0),
// Container(
//   padding:
//       const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
//   width: double.infinity,
//   decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(5.0),
//     color: Colors.grey[200],
//   ),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: [
//       _cardButton("Birthday", CupertinoIcons.bag, () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => SeeAllProductsCategoryRelated(
//                 titleText: "Birthday"),
//           ),
//         );
//       }),
//       _cardButton(
//         "Anniversary",
//         CupertinoIcons.app_badge,
//         () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => SeeAllProductsCategoryRelated(
//                   titleText: "Anniversary"),
//             ),
//           );
//         },
//       ),
//       _cardButton(
//         "Electronics",
//         Icons.electric_bolt_outlined,
//         () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => SeeAllProductsCategoryRelated(
//                   titleText: "Electronics"),
//             ),
//           );
//         },
//       ),
//       _cardButton("Frames", CupertinoIcons.film, () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) =>
//                 SeeAllProductsCategoryRelated(titleText: "Frames"),
//           ),
//         );
//       }),
//       _cardButton("Others", CupertinoIcons.pencil_outline, () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) =>
//                 SeeAllProductsCategoryRelated(titleText: "Frames"),
//           ),
//         );
//       }),
//     ],
//   ),
// ),

// Category title products ...............................................

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     Text("TOP TRENDING", style: styleBlack17),
//     TextButton(
//       onPressed: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => SeeAllProductsCategoryRelated(
//                     titleText: "TOP TRENDING",
//                   ),
//           ),
//         );
//       },
//       child: Text('See All', style: styleBlackNormal13),
//     ),
//   ],
// ),
//const SizedBox(height: 0.0),

// CategoryCardComponent(
//     imageUrl:
//         "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
//     onTap: () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => SeeAllProductsCategoryRelated(
//             titleText: "TOP TRENDING",
//           ),
//         ),
//       );
//     }),

//................Other Components.................................................
// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     // _shopByCategoryCard(
//     //   "Ethnic Clutches",
//     //   "assets/cate/ethinics.jpg",
//     //   () {
//     //     Navigator.push(
//     //       context,
//     //       MaterialPageRoute(
//     //         builder: (context) => SeeAllProductsCategoryRelated(
//     //             titleText: "Ethnic Clutches"),
//     //       ),
//     //     );
//     //   },
//     // ),
//     // _shopByCategoryCard(
//     //   "Minis",
//     //   "assets/cate/minis.jpg",
//     //   () {
//     //     Navigator.push(
//     //       context,
//     //       MaterialPageRoute(
//     //         builder: (context) =>
//     //             SeeAllProductsCategoryRelated(titleText: "Minis"),
//     //       ),
//     //     );
//     //   },
//     // ),
//     // _shopByCategoryCard(
//     //   "Jute Bags",
//     //   "assets/cate/Jute_Bags.jpg",
//     //   () {
//     //     Navigator.push(
//     //       context,
//     //       MaterialPageRoute(
//     //         builder: (context) => SeeAllProductsCategoryRelated(
//     //             titleText: "Jute Bags"),
//     //       ),
//     //     );
//     //   },
//     // ),
//   ],
// ),
// const SizedBox(height: 15.0),
// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     _shopByCategoryCard(
//       "Kids Collection",
//       "assets/cate/kids.jpg",
//       () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => SeeAllProductsCategoryRelated(
//                 titleText: "Kids Collection"),
//           ),
//         );
//       },
//     ),
//     _shopByCategoryCard(
//       "Bagpacks",
//       "assets/cate/bagpacks.jpg",
//       () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => SeeAllProductsCategoryRelated(
//                 titleText: "Bagpacks"),
//           ),
//         );
//       },
//     ),
//     _shopByCategoryCard(
//       "Duffle Bags",
//       "assets/cate/duffle.jpg",
//       () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => SeeAllProductsCategoryRelated(
//                 titleText: "Duffle Bags"),
//           ),
//         );
//       },
//     ),
//   ],
// ),
// const SizedBox(height: 15.0),

// const SizedBox(height: 12.0),
// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     _shopByCategoryCard("Sling Bags", "assets/cate/slings.png", () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => SeeAllProductsCategoryRelated(
//               titleText: "Sling Bags"),
//         ),
//       );
//     }),
//     _shopByCategoryCard("Tote Bags", "assets/cate/Tote_Bags.jpg",
//         () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) =>
//               SeeAllProductsCategoryRelated(titleText: "Tote Bags"),
//         ),
//       );
//     }),
//     _shopByCategoryCard(
//       "Shoulder Bags",
//       "assets/cate/Shoulder_bags.jpg",
//       () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => SeeAllProductsCategoryRelated(
//                 titleText: "Shoulder Bags"),
//           ),
//         );
//       },
//     ),
//   ],
// ),