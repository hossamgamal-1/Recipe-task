import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_sizer.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/app_text.dart';
import 'add_ingredients_to_cart_tile.dart';

class IngredientsCountTile extends StatelessWidget {
  final AddIngredientsToCartTile widget;
  const IngredientsCountTile({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColors.limeYellow,
        borderRadius: BorderRadius.circular(26.w),
      ),
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 34.w,
            height: 34.w,
            decoration: const BoxDecoration(
              color: AppColors.darkGreen,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: AppText(
              '${widget.count}',
              style: TextStyles.font13SemiBoldBlack.copyWith(
                color: AppColors.limeYellow,
              ),
            ),
          ),
          Container(width: 12.w),
          AppText(
            'Add ingredients to cart',
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyles.font16SemiBoldBlack.copyWith(
              color: AppColors.darkGreen,
            ),
          ),
        ],
      ),
    );
  }
}
