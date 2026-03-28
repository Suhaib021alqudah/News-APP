import 'package:api/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFont {
  static final TextStyle catoegry = GoogleFonts.inter(
    fontSize: 14.sp,
    fontStyle: FontStyle.italic,
    color: AppColor.primaryColor,
  );
  static final TextStyle homePageHeadText = GoogleFonts.inter(
    fontSize: 18.sp,
    fontStyle: FontStyle.italic,
    color: AppColor.primaryColor,
  );

  static final TextStyle homePagedescText = GoogleFonts.inter(
    fontSize: 12.sp,
    fontStyle: FontStyle.italic,
    color: AppColor.primaryColor,
  );
}
