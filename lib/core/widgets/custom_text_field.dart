import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Color fillColor;
  final Color borderColor;
  final Color focusedborderColor;
  final Color enabledborderColor;
  final Color textColor;
  final Color hintTextColor;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.fillColor,
    required this.borderColor,
    required this.focusedborderColor,
    required this.enabledborderColor,
    required this.textColor,
    required this.hintTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: GoogleFonts.inter(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.inter(color: hintTextColor.withOpacity(0.5)),
        filled: true,
        fillColor: fillColor,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: borderColor, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: enabledborderColor, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: focusedborderColor, width: 1.5),
        ),
      ),
    );
  }
}
