import 'dart:math';

import 'package:bwi_shopify/view/pages/feedback_page.dart';
import 'package:bwi_shopify/view/pages/terms_conditions_page.dart';
import 'package:bwi_shopify/view/registration/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/constant.dart';
import 'my_order_history.dart';
import '../pages/my_wishlist.dart';
import '../pages/notification_pages.dart';
import '../pages/profile_pages_details.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoading = false;
  final system = const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(system);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 30.0),
              _buildCard(
                  'https://images.unsplash.com/photo-1618641986557-1ecd230959aa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                  'Rahman',
                  'rahman@gmail.com'),
              const SizedBox(height: 20),
              Container(
                height: 1,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.black54),
              ),
              const SizedBox(height: 5.0),
              const SizedBox(height: 15),
              _widgetCard(
                  'Profile', 'Account settings', CupertinoIcons.person_fill,
                  () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePagesDetails()));
              }),
              _widgetCard(
                  'Notification', 'Your notifications', CupertinoIcons.bell,
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationPages()),
                );
              }),
              _widgetCard(
                  'My order', 'My order history', CupertinoIcons.share_up, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyOrderHistory(),
                  ),
                );
              }),
              _widgetCard(
                  'Wishlist', 'Favourite items', CupertinoIcons.bag_badge_plus,
                  () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyWishlist()));
              }),
              _widgetCard(
                  "Terms & Conditions",
                  'Privacy policy and conditions',
                  CupertinoIcons.personalhotspot, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TermsConditionsPage()));
              }),
              _widgetCard(
                'Feedback',
                'Rate your review',
                CupertinoIcons.pen,
                () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FeedbackPage()));
                },
              ),
              _widgetCard('Logout', 'Account sign-out', CupertinoIcons.escape,
                  () async {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Alert?", style: styleBlack17),
                        content: Text("Are sure, you want to logout.",
                            style: styleBlack13),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("No", style: styleBlack14)),
                          TextButton(
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                await FirebaseAuth.instance.signOut().then(
                                    (value) => Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const WelcomeScreen(),
                                        ),
                                        (route) => false));
                                setState(() {
                                  isLoading = false;
                                });
                              },
                              child: Text("Yes", style: styleBlack14)),
                        ],
                      );
                    });
              }),
              ListTile(
                onTap: () {},
                trailing: const Icon(CupertinoIcons.chevron_forward, size: 20),
                title: Text(
                  'Delete Account',
                  style: GoogleFonts.roboto(
                      color: logoColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                subtitle: Text("Delete your account permanently",
                    style: GoogleFonts.roboto(
                        color: logoColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w600)),
                leading: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[200]),
                  child: const Center(
                    child: Icon(CupertinoIcons.delete,
                        color: logoColor, size: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  // height: 300.0,
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _bottomButton("WhatsApp", () {},
                            CupertinoIcons.bubble_left_bubble_right),
                        _underLine(),
                        _bottomButton("Facebook", () {},
                            CupertinoIcons.bubble_left_bubble_right),
                        _underLine(),
                        _bottomButton("Twitter", () {},
                            CupertinoIcons.bubble_left_bubble_right),
                        _underLine(),
                        _bottomButton("Call Us", () {}, CupertinoIcons.phone),
                        _underLine(),
                        _bottomButton("Talk Chat", () {},
                            CupertinoIcons.bubble_middle_bottom),
                        _underLine(),
                        _bottomButton("Send Message", () {},
                            CupertinoIcons.bubble_middle_bottom),
                        _underLine(),
                        _bottomButton("Cancel", () {
                          Navigator.pop(context);
                        }, CupertinoIcons.delete_left),
                      ],
                    ),
                  ),
                );
              });
        },
        child: const Center(
          child: Icon(CupertinoIcons.captions_bubble, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildCard(String url, String name, String email) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey,
          backgroundImage: NetworkImage(url),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style:
                  GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(
              email,
              style: GoogleFonts.roboto(
                  color: Colors.black54,
                  fontSize: 13,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ],
    );
  }

  Widget _widgetCard(
      String title, String subTitle, IconData icon, VoidCallback onTap) {
    return ListTile(
      onTap: onTap,
      trailing: const Icon(CupertinoIcons.chevron_forward, size: 20),
      title: Text(title, style: styleBlack15),
      subtitle: Text(subTitle, style: styleBlack13),
      leading: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.grey[200]),
        child: Center(
          child: Icon(icon, size: 20),
        ),
      ),
    );
  }

  Widget _bottomButton(String text, VoidCallback onTap, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            Text(text, style: styleBlack18),
          ],
        ),
      ),
    );
  }

  Widget _underLine() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 1.0,
        width: 300.0,
        decoration: const BoxDecoration(color: Colors.black54),
      ),
    );
  }
}

