import 'package:flutter/material.dart';

import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_sizer.dart';
import '../../../core/theming/text_styles.dart';
import '../../../core/widgets/app_image.dart';
import '../../../core/widgets/app_text.dart';
import '../../../data/model/recipe.dart';

class CreatorSection extends StatelessWidget {
  final Item product;
  const CreatorSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    if (product.creatorName == null || product.creatorImage == null) {
      return const SizedBox.shrink();
    }

    return Row(
      children: [
        Container(
          width: 30.w,
          height: 30.w,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: AppColors.gray,
            borderRadius: BorderRadius.circular(12),
          ),
          child: AppImage(product.creatorImage!, fit: BoxFit.cover),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText('Prepared by', style: TextStyles.font10MediumDarkGray),
              AppText(
                product.creatorName!,
                style: TextStyles.font13SemiBoldDarkGreen,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
