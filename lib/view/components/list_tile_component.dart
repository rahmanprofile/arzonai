import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ListTileComponent extends StatelessWidget {
  String text;
  IconData leadingIcon;
  VoidCallback onTap;
  ListTileComponent({
    Key? key,
    required this.text,
    required this.leadingIcon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        text,
        style: GoogleFonts.roboto(color: Colors.black, fontSize: 16),
      ),
      leading: Icon(
        leadingIcon,
        size: 22,
        color: Colors.blueGrey[600],
      ),
      trailing: Icon(
        CupertinoIcons.chevron_right,
        size: 18,
        color: Colors.blueGrey[500],
      ),
    );
  }
}
