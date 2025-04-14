import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextbox extends StatelessWidget {
  const CustomTextbox({
    super.key,
    required this.hint,
    this.controller,
    this.isOptional = true,
    this.isEnableField = true,
    this.fillColor = Colors.white,
    this.isNoneBorderSide,
  });

  final String hint;
  final TextEditingController? controller;
  final bool isOptional;
  final bool isEnableField;
  final Color fillColor;
  final BorderSide? isNoneBorderSide;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          enabled: isEnableField,
          textAlignVertical: TextAlignVertical.top,
          maxLines: null,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              bottom: 50,
              left: 10.w,
              top: 10.h,
              right: 10.w,
            ),
            hintText: hint,
            hintStyle: TextStyle(fontSize: 18, color: Colors.grey.shade600),
            filled: true,
            fillColor: fillColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  isNoneBorderSide ?? BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  isNoneBorderSide ?? BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  isNoneBorderSide ?? BorderSide(color: Colors.blue.shade300),
            ),
          ),
        ),
      ],
    );
  }
}
