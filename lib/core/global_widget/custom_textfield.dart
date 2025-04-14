import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vid_move/core/utils/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    this.controller,
    this.onTap,
    this.hintText,
    this.isReadOnly,
    this.trailingIcon,
    this.validator,
    this.suffixImage,
    this.validationText,
    this.textInputType,
    this.isObsecure,
    this.onSuffixTap,
    this.inputFormatters,
    this.onPrefixTap,
    this.prefixImage,
  });

  final TextEditingController? controller;
  final void Function()? onTap;
  final void Function()? onSuffixTap;
  final void Function()? onPrefixTap;
  final String? hintText;
  final bool? isReadOnly;
  final Widget? trailingIcon;
  final String? suffixImage;
  final String? prefixImage;
  final String? validationText;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final bool? isObsecure;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: isReadOnly ?? false,
      cursorColor: AppColors.primary,
      keyboardType: textInputType ?? TextInputType.text,
      validator:
          validator ??
          (value) {
            if (value!.isEmpty) {
              return validationText ?? 'This field is required';
            }
            return null;
          },
      onTap: onTap,
      obscureText: isObsecure ?? false,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0xFFE3E3E9), width: 1.w),
          borderRadius: BorderRadius.circular(12.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0xFFE3E3E9), width: 1.w),
          borderRadius: BorderRadius.circular(12.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0xFFE3E3E9), width: 1.w),
          borderRadius: BorderRadius.circular(12.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 144, 14, 5),
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        hintText: hintText ?? 'Demo',
        hintStyle: GoogleFonts.poppins(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.lightGrey,
        ),
        prefixIcon:
            prefixImage != null
                ? GestureDetector(
                  onTap: onPrefixTap,
                  child: Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Image.asset(
                      prefixImage!,
                      width: 24.w,
                      height: 24.h,
                      color: Color(0xFF7F7F8A),
                    ),
                  ),
                )
                : trailingIcon,
        suffixIcon:
            suffixImage != null
                ? GestureDetector(
                  onTap: onSuffixTap,
                  child: Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Image.asset(
                      suffixImage!,
                      width: 24.w,
                      height: 24.h,
                      color: Color(0xFF7F7F8A),
                    ),
                  ),
                )
                : trailingIcon,
      ),
    );
  }
}

class CardExpirationFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text.replaceAll(
      RegExp(r'[^0-9]'),
      '',
    ); // Only digits
    String formattedText = '';

    if (text.length > 2) {
      formattedText =
          '${text.substring(0, 2)}/${text.substring(2, text.length)}';
    } else {
      formattedText = text;
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
