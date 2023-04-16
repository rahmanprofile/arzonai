import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundButton extends StatelessWidget {
  String text;
  Color color;
  Color textColor;
  VoidCallback onTap;
  RoundButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onTap,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45.0,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: color,
        ),
        child: Center(
          child: Text(text,
              style: GoogleFonts.roboto(
                  fontSize: 14, color: textColor, fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}
