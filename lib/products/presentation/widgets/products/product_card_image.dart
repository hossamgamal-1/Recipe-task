import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_sizer.dart';
import '../../../../core/utils/hero_tag_helper.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../data/models/item.dart';
import '../spotlight_section.dart';
import '../time_section.dart';

class ProductCardImage extends StatelessWidget {
  final Item item;
  const ProductCardImage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            child: Hero(
              tag: HeroTagHelper.getRecipeImageTag(item.id),
              child: AppImage(item.image, fit: BoxFit.cover),
            ),
          ),
        ),
        Positioned(top: 5, left: 5, child: SpotlightSection(item: item)),
        Positioned(bottom: 5, left: 5, child: TimeSection(item: item)),
      ],
    );
  }
}
