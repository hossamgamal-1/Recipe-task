import 'package:flutter/material.dart';

import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_sizer.dart';
import '../../../core/theming/text_styles.dart';
import '../../../core/widgets/app_image.dart';
import '../../../core/widgets/app_text.dart';
import '../../../data/model/recipe.dart';

class CreatorSection extends StatelessWidget {
  final Item item;
  final bool isDetailsScreen;
  const CreatorSection({super.key, required this.item})
    : isDetailsScreen = false;

  const CreatorSection.details({super.key, required this.item})
    : isDetailsScreen = true;

  @override
  Widget build(BuildContext context) {
    if (item.creatorName == null || item.creatorImage == null) {
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
          child: AppImage(item.creatorImage!, fit: BoxFit.cover),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText('Prepared by', style: TextStyles.font10MediumDarkGray),
              Row(
                children: [
                  AppText(
                    item.creatorName!,
                    style: TextStyles.font13SemiBoldDarkGreen.copyWith(
                      color:
                          isDetailsScreen
                              ? AppColors.black
                              : AppColors.darkGreen,
                    ),
                  ),

                  if (isDetailsScreen && item.creatorLink != null) ...[
                    SizedBox(width: 4.w),
                    Icon(Icons.link_outlined, size: 16.w),
                  ],
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
