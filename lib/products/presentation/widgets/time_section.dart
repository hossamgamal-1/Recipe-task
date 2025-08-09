import 'package:flutter/material.dart';

import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_sizer.dart';
import '../../../core/theming/text_styles.dart';
import '../../../core/utils/hero_tag_helper.dart';
import '../../../core/widgets/app_text.dart';
import '../../data/models/item.dart';

class TimeSection extends StatelessWidget {
  final Item item;
  final Color? backgroundColor;
  const TimeSection({super.key, required this.item, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    final time = item.additionalInfo.time;
    if (time <= 0) return const SizedBox.shrink();

    return Hero(
      tag: HeroTagHelper.getTimeSectionTag(item.id),
      child: Container(
        width: 90.w,
        padding: EdgeInsets.symmetric(vertical: 4.h),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.timer_outlined, size: 16.w, color: AppColors.black),
              SizedBox(width: 4.w),
              AppText(
                '$time mins',
                style: TextStyles.font12ExtraBoldDarkGreen.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeightHelper.semiBold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
