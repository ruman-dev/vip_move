import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomRichtext extends StatelessWidget {
  const CustomRichtext({
    super.key,
    required this.primaryText,
    this.secondaryText,
    this.primeTextColor,
    this.secTextColor,
    this.primeFontWeight,
    this.secFontWeight,
    this.primeFontSize,
    this.secFontSize,
    this.onPrimePressed,
    this.onSecPressed,
    this.textDecoration,
  });

  final String primaryText;
  final String? secondaryText;
  final Color? primeTextColor;
  final Color? secTextColor;
  final FontWeight? primeFontWeight;
  final FontWeight? secFontWeight;
  final double? primeFontSize;
  final double? secFontSize;
  final void Function()? onPrimePressed;
  final void Function()? onSecPressed;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: primaryText,
            style: GoogleFonts.poppins(
              color: primeTextColor ?? const Color(0xFF1A202C),
              fontWeight: primeFontWeight ?? FontWeight.w400,
              fontSize: primeFontSize ?? 14.sp,
            ),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = onSecPressed, // Click event for secondary text
          ),

          TextSpan(
            text: secondaryText,

            style: GoogleFonts.poppins(
              fontWeight: secFontWeight ?? FontWeight.w600,
              fontSize: secFontSize ?? 14.sp,
              color: secTextColor ?? const Color(0xFFFF3D00),
              decoration: textDecoration ?? TextDecoration.none,
            ),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = onSecPressed, // Click event for secondary text
          ),
        ],
      ),
    );
  }
}
