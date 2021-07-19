import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organizapet/shared/themes/app_colors.dart';

class TextStyles {
  static final nameApp = GoogleFonts.inter(
    fontSize: 48,
    color: AppColors.nameApp,
  );
  static final nameAppBarra = GoogleFonts.inter(
    fontSize: 25,
    color: Colors.white,
  );
  static final buttonGray = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );
}
