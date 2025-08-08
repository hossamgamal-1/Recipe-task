import 'package:flutter/material.dart';

import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_sizer.dart';
import '../../../core/theming/text_styles.dart';
import '../../../core/widgets/app_text.dart';
import '../../../data/model/recipe.dart';

class TimeSection extends StatelessWidget {
  final Item product;
  const TimeSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final time = product.additionalInfo.time;
    if (time <= 0) return const SizedBox.shrink();

    return Container(
      width: 90.w,
      padding: EdgeInsets.symmetric(vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.white,
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
    );
  }
}
