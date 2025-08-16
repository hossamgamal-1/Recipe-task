import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_sizer.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../domain/entities/detailed_recipe_entity.dart';

class IngredientCardTrailingWidget extends StatelessWidget {
  final ProductEntity product;
  const IngredientCardTrailingWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    if (!product.inStock) {
      return _BackInBadge(days: product.replenishmentTime);
    }

    return Row(
      spacing: 6.w,
      children: [
        AppText(
          '${product.basePrice.toStringAsFixed(2)} EGP',
          style: TextStyles.font14MediumDarkGray,
        ),
        const _SuccessTick(),
      ],
    );
  }
}

class _BackInBadge extends StatelessWidget {
  final int days;
  const _BackInBadge({required this.days});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.w),
          topRight: Radius.circular(8.w),
          bottomRight: Radius.circular(8.w),
        ),
      ),
      child: AppText(_label, style: TextStyles.font10MediumDarkGray),
    );
  }

  String get _label {
    // remove s in case of 1 day
    return 'Back in $days Day${days == 1 ? '' : 's'}!';
  }
}

class _SuccessTick extends StatelessWidget {
  const _SuccessTick();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22.w,
      height: 22.w,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.darkGreen,
      ),
      alignment: Alignment.center,
      child: Icon(Icons.check, color: AppColors.white, size: 16.w),
    );
  }
}
