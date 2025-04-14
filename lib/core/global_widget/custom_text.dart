import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextPoppins extends StatelessWidget {
  const CustomTextPoppins({super.key, required this.text, this.fontSize, this.fontWeight, this.color, this.textAlign, this.overflow, this.maxLines});

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      overflow: overflow,
      maxLines: maxLines,
      style: GoogleFonts.poppins(fontSize: fontSize, fontWeight: fontWeight ?? FontWeight.w600, color: color),
    );
  }
}
