import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_sizer.dart';
import '../../../data/mock.dart';
import 'categories_section.dart';
import 'products_app_bar_title.dart';

class ProductsSliverAppBar extends StatelessWidget {
  const ProductsSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 140.h,
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.paleGreen,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(color: AppColors.paleGreen),
      ),
      title: const ProductsAppBarTitle(),
      bottom: categories.isEmpty ? null : const CategoriesSection(),
    );
  }
}
