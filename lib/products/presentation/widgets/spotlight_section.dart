import 'package:flutter/material.dart';

import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_sizer.dart';
import '../../../core/theming/text_styles.dart';
import '../../../core/widgets/app_text.dart';
import '../../../data/model/recipe.dart';

class SpotlightSection extends StatelessWidget {
  final Items product;
  const SpotlightSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    if (!product.isFeatured) return const SizedBox.shrink();

    return Container(
      width: 90.w,
      padding: EdgeInsets.symmetric(vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.shiningGreen,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star_border, size: 16.w, color: AppColors.darkGreen),
            SizedBox(width: 4.w),
            AppText('Spotlight', style: TextStyles.font12ExtraBoldDarkGreen),
          ],
        ),
      ),
    );
  }
}
