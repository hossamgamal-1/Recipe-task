import 'package:flutter/material.dart';

import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_sizer.dart';
import '../../../core/theming/text_styles.dart';
import '../../../core/widgets/app_text.dart';
import '../../../data/model/detailed_item.dart';
import '../../data/mock.dart';
import '../widgets/creator_section.dart';
import '../widgets/product_details/add_ingredients_to_cart_tile.dart';
import '../widgets/product_details/ingredients_and_instructions_section.dart';
import '../widgets/product_details/product_details_app_bar.dart';
import '../widgets/spotlight_section.dart';
import '../widgets/time_section.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;
  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final DetailedItem item = detailedItem; // TODO: select by widget.productId

    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              ProductDetailsAppBar(
                item: item,
                scrollController: _scrollController,
              ),

              // Title + description + ingredients section
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 96.h),
                  // bottom padding leaves room for the persistent CTA when visible
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SpotlightSection(item: item),
                      SizedBox(height: 8.h),
                      AppText(
                        item.name,
                        maxLines: 2,
                        style: TextStyles.font20BoldBlack,
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Expanded(child: CreatorSection.details(item: item)),
                          TimeSection(
                            item: item,
                            backgroundColor: AppColors.gray,
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      IngredientsAndInstructionsSection(item: item),
                    ],
                  ),
                ),
              ),
            ],
          ),

          AddIngredientsToCartTile(count: item.ingredients.length),
        ],
      ),
    );
  }
}
