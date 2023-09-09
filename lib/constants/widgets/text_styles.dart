import 'package:banking_app/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  AppStyle._();

  static TextStyle get poppins32xW500White => GoogleFonts.poppins(
        textStyle: const TextStyle(
          fontSize: 32,
          color: AppColors.white,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
      );

  static TextStyle get poppins24xW500White => GoogleFonts.poppins(
    textStyle:  TextStyle(
      fontSize: 24.sp,
      color: AppColors.white,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
    ),
  );
  static TextStyle get poppins28xW400White => GoogleFonts.poppins(
    textStyle:  TextStyle(
      fontSize: 28.sp,
      color: AppColors.white,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  );

  static TextStyle get poppins14xW400White => GoogleFonts.poppins(
    textStyle:  TextStyle(
      fontSize: 14.sp,
      color: AppColors.white,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  );

  static TextStyle get poppins22xW500Black => GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 22,
      color: AppColors.black,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
    ),
  );

  static TextStyle get poppins14xW400Black => GoogleFonts.poppins(
    textStyle:  TextStyle(
      fontSize: 14.sp,
      color: AppColors.black,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
    ),
  );
  static TextStyle get poppins16xW400Black => GoogleFonts.poppins(
    textStyle:  TextStyle(
      fontSize: 16.sp,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  );

  static TextStyle get poppins16xW300Black => GoogleFonts.poppins(
    textStyle:  TextStyle(
      fontSize: 16.h,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  );

  static TextStyle get poppins20xW400Black => GoogleFonts.poppins(
    textStyle:  TextStyle(
      fontSize: 20.sp,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  );
  static TextStyle get poppins20xW400White => GoogleFonts.poppins(
    textStyle:  TextStyle(
      fontSize: 20.sp,
      color: AppColors.white,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  );

  static TextStyle get poppins14xW500White => GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 14.sp,
      color: AppColors.white,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
    ),
  );

  static TextStyle get poppins18xW500Red => GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 14.sp,
      color:Colors.red,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
    ),
  );
}
