import 'package:flutter/material.dart';

import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_sizer.dart';
import '../../data/mock.dart';
import '../widgets/products/product_card.dart';
import '../widgets/products/products_sliver_app_bar.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      body: CustomScrollView(
        slivers: [
          const ProductsSliverAppBar(),

          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                final product = items[index];
                return ProductCard(product, key: ValueKey(product.id));
              }, childCount: items.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.64,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
