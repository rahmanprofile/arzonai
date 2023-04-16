import 'package:bwi_shopify/view/pages/see_all_products_catrelate.dart';
import 'package:bwi_shopify/view/registration/welcome_screen.dart';
import 'package:bwi_shopify/view/screen/fake_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'blog_pages.dart';

class DrawerPages extends StatefulWidget {
  const DrawerPages({Key? key}) : super(key: key);

  @override
  State<DrawerPages> createState() => _DrawerPagesState();
}

class _DrawerPagesState extends State<DrawerPages> {
  @override
  Widget build(BuildContext context) {
    final fakeprov = Provider.of<FakeData>(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height * 1.0,
          width: MediaQuery.of(context).size.width * 1.0,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey[200],
                child: Padding(
                  padding:const EdgeInsets.all(5.0),
                  child: Image.asset("assets/imp/next_logo.png"),
                ),
              ),
              const SizedBox(height: 10.0),
              ListTile(
                onTap: () {},
                leading: const Icon(CupertinoIcons.home, size: 18),
                title: Text("Home",
                    style: GoogleFonts.roboto(
                        color: Colors.blueGrey, fontSize: 14)),
              ),
              Column(
                children: [
                  ExpansionTile(
                    title: Row(
                      children: [
                        const Icon(CupertinoIcons.sparkles, size: 18),
                        const SizedBox(width: 35),
                        Text("Category",
                            style: GoogleFonts.roboto(
                                color: Colors.blueGrey, fontSize: 14)),
                      ],
                    ),
                    children: fakeprov.dummyCategory.map((e) {
                      return _tileButton(e['name'], () {
                        Navigator.push(context, MaterialPageRoute(builder: (ctx)=> SeeAllProductsCategoryRelated(titleText: e['name'])));
                      });
                    }).toList()
                    // [
                    //   _tileButton("Anniversary", () {}),
                    //   _tileButton("Birthday", () {}),
                    //   _tileButton("Coushins", () {}),
                    //   _tileButton("Family Tree", () {}),
                    //   _tileButton("Frames", () {}),
                    //   _tileButton("Mugs", () {}),
                    //   _tileButton("Top Table", () {}),
                    //   _tileButton("Rotating Lamp", () {}),
                    //   _tileButton("Top Trending Product", () {}),
                    //   _tileButton("Moon Lamp", () {}),
                    //   _tileButton("Shadow Box", () {}),
                    //   _tileButton("Wall Clock", () {}),
                    //   _tileButton("Handmade Gift", () {}),
                    //   _tileButton("Best Selling", () {}),
                    //   _tileButton("Paintings", () {}),
                    //   _tileButton("Neon Signs", () {}),
                    //   _tileButton("Electronics", () {}),
                    // ],
                  ),
                ],
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BlogPage()),
                  );
                },
                leading: const Icon(CupertinoIcons.arrow_swap, size: 18),
                title: Text("My Orders",
                    style: GoogleFonts.roboto(
                        color: Colors.blueGrey, fontSize: 14)),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BlogPage()),
                  );
                },
                leading: const Icon(CupertinoIcons.person_alt_circle, size: 18),
                title: Text("Profile",
                    style: GoogleFonts.roboto(
                        color: Colors.blueGrey, fontSize: 14)),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BlogPage()),
                  );
                },
                leading: const Icon(CupertinoIcons.paperclip, size: 18),
                title: Text("Blog",
                    style: GoogleFonts.roboto(
                        color: Colors.blueGrey, fontSize: 14)),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(CupertinoIcons.helm, size: 18),
                title: Text("About Us",
                    style: GoogleFonts.roboto(
                        color: Colors.blueGrey, fontSize: 14)),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(CupertinoIcons.headphones, size: 18),
                title: Text("Contact Us",
                    style: GoogleFonts.roboto(
                        color: Colors.blueGrey, fontSize: 14)),
              ),
              ListTile(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Alert"),
                          content: const Text("Are you sure want to logout."),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "No",
                                  style: GoogleFonts.roboto(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                )),
                            TextButton(
                                onPressed: () async {
                                  await FirebaseAuth.instance.signOut().then(
                                      (value) => Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const WelcomeScreen()),
                                          (route) => false));
                                },
                                child: Text(
                                  "Yes",
                                  style: GoogleFonts.roboto(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                )),
                          ],
                        );
                      });
                },
                leading:
                    const Icon(CupertinoIcons.arrow_right_square, size: 18),
                title: Text("Logout",
                    style: GoogleFonts.roboto(
                        color: Colors.blueGrey, fontSize: 14)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tileButton(String text, VoidCallback onTap) {
    return ListTile(
      onTap: onTap,
      title: Text(text,
          style: GoogleFonts.roboto(color: Colors.blueGrey, fontSize: 13)),
      trailing: const Icon(CupertinoIcons.chevron_right,
          size: 18, color: Colors.blueGrey),
    );
  }
}
