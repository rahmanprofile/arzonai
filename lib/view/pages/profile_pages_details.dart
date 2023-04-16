import 'package:bwi_shopify/view/pages/payments_details.dart';
import 'package:bwi_shopify/view/pages/users_address.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/constant.dart';

class ProfilePagesDetails extends StatefulWidget {
  const ProfilePagesDetails({Key? key}) : super(key: key);

  @override
  State<ProfilePagesDetails> createState() => _ProfilePagesDetailsState();
}

class _ProfilePagesDetailsState extends State<ProfilePagesDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0.0, bottom: 30),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                    ),
                    color: logoColor,
                  ),
                ),
                Positioned(
                  top: 135,
                  left: 0.0,
                  right: 0.0,
                  child: InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.grey[200],
                      child: const Center(
                        child: Icon(
                          CupertinoIcons.person_fill,
                          size: 40,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(CupertinoIcons.person, size: 20),
                  title: Text("Name",
                      style: GoogleFonts.roboto(
                          fontSize: 15, fontWeight: FontWeight.w400)),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.pencil)),
                  subtitle: Text("Rahman Developers",
                      style: GoogleFonts.roboto(
                          fontSize: 15, fontWeight: FontWeight.w600)),
                ),
                const SizedBox(height: 10),
                ListTile(
                  leading: const Icon(CupertinoIcons.mail, size: 20),
                  trailing: const Icon(CupertinoIcons.lock_shield, size: 20),
                  title: Text("Email",
                      style: GoogleFonts.roboto(
                          fontSize: 15, fontWeight: FontWeight.w400)),
                  subtitle: Text("innovation@gmail.com",
                      style: GoogleFonts.roboto(
                          fontSize: 15, fontWeight: FontWeight.w600)),
                ),
                const SizedBox(height: 10),
                ListTile(
                  onTap: () {},
                  leading: const Icon(CupertinoIcons.creditcard, size: 20),
                  title: Text("Payments",
                      style: GoogleFonts.roboto(
                          fontSize: 15, fontWeight: FontWeight.w400)),
                  trailing: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const PaymentsDetails()));
                                        },
                                        child: Text("Edit",
                                            style: GoogleFonts.roboto(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400))),
                                    TextButton(
                                        onPressed: () {},
                                        child: Text("Remove",
                                            style: GoogleFonts.roboto(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400))),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel",
                                            style: GoogleFonts.roboto(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400))),
                                  ],
                                ),
                              );
                            });
                      },
                      icon: const Icon(CupertinoIcons.pencil)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Holder : Rahman",
                          style: GoogleFonts.roboto(
                              fontSize: 15, fontWeight: FontWeight.w400)),
                      Text("Card number :  0000 0000 0000",
                          style: GoogleFonts.roboto(
                              fontSize: 15, fontWeight: FontWeight.w400)),
                      Text("Type : Debit Card",
                          style: GoogleFonts.roboto(
                              fontSize: 15, fontWeight: FontWeight.w400)),
                      Text("CVV : ***",
                          style: GoogleFonts.roboto(
                              fontSize: 15, fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ListTile(
                  onTap: () {},
                  leading: const Icon(CupertinoIcons.placemark, size: 20),
                  title: Text("Address",
                      style: GoogleFonts.roboto(
                          fontSize: 15, fontWeight: FontWeight.w400)),
                  trailing: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const UsersAddress()));
                                        },
                                        child: Text("Edit",
                                            style: GoogleFonts.roboto(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400))),
                                    TextButton(
                                        onPressed: () {},
                                        child: Text("Remove",
                                            style: GoogleFonts.roboto(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400))),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel",
                                            style: GoogleFonts.roboto(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400))),
                                  ],
                                ),
                              );
                            });
                      },
                      icon: const Icon(CupertinoIcons.pencil)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Home/Area : Pearl business complex",
                          style: GoogleFonts.roboto(
                              fontSize: 15, fontWeight: FontWeight.w400)),
                      Text("City : Pitampura",
                          style: GoogleFonts.roboto(
                              fontSize: 15, fontWeight: FontWeight.w400)),
                      Text("District : New-Delhi",
                          style: GoogleFonts.roboto(
                              fontSize: 15, fontWeight: FontWeight.w400)),
                      Text("State : Delhi",
                          style: GoogleFonts.roboto(
                              fontSize: 15, fontWeight: FontWeight.w400)),
                      Text("Country : India",
                          style: GoogleFonts.roboto(
                              fontSize: 15, fontWeight: FontWeight.w400)),
                      Text("ZipCode : 110034",
                          style: GoogleFonts.roboto(
                              fontSize: 15, fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
