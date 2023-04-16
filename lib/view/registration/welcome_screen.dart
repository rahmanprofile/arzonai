import 'package:bwi_shopify/view/registration/phone_authentication.dart';
import 'package:bwi_shopify/view/registration/users_details_register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/constant.dart';
import '../screen/home.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    assetImage();
    super.initState();
  }

  void assetImage() {
    Image.asset(imageUrl);
  }

  String imageUrl = "assets/imp/next_logo.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                  (route) => false);
            },
            child: Text(
              "SKIP",
              style: GoogleFonts.roboto(
                decoration: TextDecoration.underline,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: logoColor,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 300,
            width: 220,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Image.asset(imageUrl,
                height: 300, width: 220, fit: BoxFit.cover),
          ),
          const SizedBox(height: 50.0),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Welcome',
                  style: GoogleFonts.raleway(
                      fontSize: 35, fontWeight: FontWeight.w600),
                ),
                //const SizedBox(height: 5.0),
                Text("Never a better time to than now start today",
                    style: styleBlackNormal15),
                const SizedBox(height: 20),
                // InkWell(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => const UserDetailsRegister(),
                //       ),
                //     );
                //   },
                //   child: Container(
                //     height: 45,
                //     width: double.infinity,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(5.0),
                //       color: const Color(0xFFBEA268),
                //     ),
                //     child: Center(
                //       child: Text(
                //         "Create account",
                //         style: GoogleFonts.roboto(
                //           fontSize: 14,
                //           color: Colors.white,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PhoneAuthentication(),
                      ),
                    );
                  },
                  child: Container(
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: logoColor,
                    ),
                    child: Center(
                      child: Text("Login with phone",
                          style: GoogleFonts.roboto(
                              fontSize: 14, color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
