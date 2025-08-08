import 'package:flutter/material.dart';

import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_sizer.dart';
import '../../../core/theming/text_styles.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/app_image.dart';
import '../../../core/widgets/app_text.dart';
import '../../../data/model/recipe.dart';
import 'creator_section.dart';

class ProductCard extends StatelessWidget {
  final Items product;
  const ProductCard(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Center(
                child: Container(
                  width: 170.w,
                  height: 170.w,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: AppColors.gray,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: AppImage(product.image, fit: BoxFit.cover),
                ),
              ),
              Positioned(
                top: 5,
                left: 5,
                child: SpotlightSection(product: product),
              ),
              Positioned(
                bottom: 5,
                left: 5,
                child: TimeSection(product: product),
              ),
            ],
          ),
          Expanded(
            child: AppText(
              product.name,
              style: TextStyles.font16MediumBlack,
              maxLines: 2,
            ),
          ),
          SizedBox(height: 8.h),
          CreatorSection(product: product),
        ],
      ),
    );
  }
}

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

class TimeSection extends StatelessWidget {
  final Items product;
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
