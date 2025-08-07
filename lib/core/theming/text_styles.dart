import 'package:flutter/material.dart';

import '../widgets/app_text_style.dart';
import 'app_colors.dart';
import 'app_sizer.dart';

class FontConstants {
  const FontConstants._();

  static const fontFamily = 'inter';
}

class FontWeightHelper {
  const FontWeightHelper._();

  static const light = FontWeight.w300;
  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const semiBold = FontWeight.w600;
  static const bold = FontWeight.w700;
  static const extraBold = FontWeight.w800;
  static const black = FontWeight.w900;
}

class TextStyles {
  const TextStyles._();

  static final font12SemiBoldDarkGreen = appTextStyle(
    fontSize: 12.sp,
    color: AppColors.darkGreen,
    fontWeight: FontWeightHelper.semiBold,
  );

  static final font24BlackDarkGreen = appTextStyle(
    fontSize: 24.sp,
    color: AppColors.darkGreen,
    fontWeight: FontWeightHelper.black,
  );
}
