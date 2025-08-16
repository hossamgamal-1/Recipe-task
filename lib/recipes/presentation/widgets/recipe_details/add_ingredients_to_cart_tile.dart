import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_sizer.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/event_bus.dart';
import '../../../../core/widgets/app_image.dart';
import '../../events/ingredients_mode_changed.dart';
import 'ingredients_count_tile.dart';

class AddIngredientsToCartTile extends StatefulWidget {
  final int count;
  const AddIngredientsToCartTile({super.key, required this.count});

  @override
  State<AddIngredientsToCartTile> createState() =>
      _AddIngredientsToCartTileState();
}

class _AddIngredientsToCartTileState extends State<AddIngredientsToCartTile> {
  bool _isIngredientsMode = true;
  StreamSubscription? _ingredientsSub;

  @override
  void initState() {
    super.initState();
    _ingredientsSub = eventBus.on<IngredientsModeChangedEvent>().listen((e) {
      if (!mounted) return;
      setState(() => _isIngredientsMode = e.isIngredients);
    });
  }

  @override
  void dispose() {
    _ingredientsSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isIngredientsMode) return const SizedBox.shrink();

    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        children: [
          SizedBox(width: 25.w),
          IngredientsCountTile(widget: widget),
          SizedBox(width: 25.w),
          const Spacer(),
          Container(
            height: 50.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: const BoxDecoration(
              color: AppColors.darkGreen,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(999),
                bottomLeft: Radius.circular(999),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: AppImage(
                AppAssets.basket,
                color: AppColors.limeYellow,
                width: 24.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
