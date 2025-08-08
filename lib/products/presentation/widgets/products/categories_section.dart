import 'package:flutter/material.dart';

import '../../../../core/theming/app_sizer.dart';
import '../../../data/mock.dart';
import 'category_chip.dart';

class CategoriesSection extends StatelessWidget implements PreferredSizeWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) return CategoryChip.all();

          return CategoryChip(category: categories[index - 1]);
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55.h);
}
