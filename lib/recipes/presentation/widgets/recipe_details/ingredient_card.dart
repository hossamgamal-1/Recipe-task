import 'package:flutter/material.dart';

import '../../../../core/theming/app_sizer.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../domain/entities/detailed_recipe_entity.dart';
import 'ingredient_card_trailing_widget.dart';

class IngredientCard extends StatelessWidget {
  final ProductEntity product;
  const IngredientCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Image
        ClipRRect(
          borderRadius: BorderRadius.circular(8.w),
          child: SizedBox(width: 52.w, height: 52.w, child: _getImage()),
        ),
        SizedBox(width: 12.w),

        // Title and quantity
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4.h,
            children: [
              AppText(
                product.name,
                maxLines: 2,
                style: TextStyles.font13RegularBlack,
              ),
              AppText(
                product.label,
                style: TextStyles.font12SemiBoldBlack.copyWith(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),

        // Trailing widget (back in x Days or price with SuccessTick)
        IngredientCardTrailingWidget(product: product),
      ],
    );
  }

  Widget _getImage() {
    if (product.imageUrl == null) return const SizedBox.shrink();

    return AppImage(product.imageUrl!, fit: BoxFit.contain);
  }
}
