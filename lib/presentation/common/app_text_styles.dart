import 'package:flutter/material.dart';
import 'package:flutter_arhitect/presentation/common/app_colors.dart';

abstract class AppTextStyles {
  static TextStyle get tiny => TextStyle(
        color: AppColors.white,
        fontSize: 12,
        fontWeight: FontWeight.w300,
        height: 1.02,
        fontFamily: 'HKGrotesk-Regular',
      );
  static TextStyle get base => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.4,
        color: AppColors.darkFacilityTile,
        fontFamily: 'HKGrotesk-Regular',
      );

  static TextStyle get baseSemiBold => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.darkFacilityTile,
        height: 1.15,
        fontFamily: 'HKGrotesk-Regular',
      );
  static TextStyle get labelSmall => TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 3,
        height: 0.92,
        color: AppColors.text4,
        fontFamily: 'HKGrotesk-Regular',
      );
  static TextStyle get label => TextStyle(
        fontSize: 12,
        height: 1.28,
        letterSpacing: 3,
        fontWeight: FontWeight.w400,
        color: AppColors.text4,
        fontFamily: 'HKGrotesk-Regular',
      );
  static TextStyle get labelMid => TextStyle(
        fontSize: 14,
        height: 1.1,
        fontWeight: FontWeight.w400,
        color: AppColors.darkFacilityTile,
        letterSpacing: 3,
        fontFamily: 'HKGrotesk-Regular',
      );
  static TextStyle get small => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: AppColors.text5,
        height: 1.1,
        fontFamily: 'HKGrotesk-Regular',
      );
  static TextStyle get medium => TextStyle(
        fontSize: 20,
        height: 1.07,
        fontWeight: FontWeight.w300,
        color: AppColors.white,
        fontFamily: 'HKGrotesk-Regular',
      );
  static TextStyle get mediumAlt => TextStyle(
        fontSize: 22,
        height: 0.98,
        wordSpacing: 0.22,
        fontWeight: FontWeight.w300,
        color: AppColors.white,
        fontFamily: 'HKGrotesk-Regular',
      );
  static TextStyle get large => TextStyle(
        fontSize: 36,
        height: 0.85,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
        fontFamily: 'HKGrotesk-Regular',
      );
  static TextStyle get logoText => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.text5,
        fontFamily: 'HKGrotesk-Regular',
      );
  static TextStyle get button => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.text1,
        height: 1.1,
        fontFamily: 'HKGrotesk-Regular',
      );
  static TextStyle get buttonBig => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
        height: 1.15,
        fontFamily: 'HKGrotesk-Regular',
      );
  static TextStyle get buttonSmall => TextStyle(
        fontSize: 12,
        height: 1.02,
        fontWeight: FontWeight.w600,
        color: AppColors.text5,
        fontFamily: 'HKGrotesk-Regular',
      );
}
