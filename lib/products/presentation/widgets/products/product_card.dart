import 'package:flutter/material.dart';

import '../../../../core/theming/app_sizer.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../data/model/recipe.dart';
import '../creator_section.dart';
import 'product_card_image.dart';

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
          ProductCardImage(product: product),
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
