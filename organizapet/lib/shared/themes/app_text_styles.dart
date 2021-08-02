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

  static final title = GoogleFonts.inter(
      fontSize: 27,
      color: AppColors.title,
      fontWeight: FontWeight.w400,
      shadows: [
        Shadow(
          blurRadius: 4,
          color: Colors.black.withOpacity(0.25),
          offset: Offset(0, 3),
        )
      ]);

  static final button = GoogleFonts.actor(
    fontSize: 19,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static final titleBoxList = GoogleFonts.inter(
    fontSize: 19,
    color: AppColors.button,
  );

  static final subtitleBoxList = GoogleFonts.inter(
    fontSize: 14,
    color: AppColors.subtitleBoxList,
  );

  static final infoBox = GoogleFonts.inter(
    fontSize: 18,
    color: AppColors.infoBox,
  );
}
