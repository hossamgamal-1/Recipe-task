import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_sizer.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_inkwell.dart';
import '../../../domain/entities/detailed_recipe_entity.dart';

class RecipeDetailsAppBar extends StatefulWidget {
  final DetailedRecipeEntity detailedRecipe;
  final ScrollController scrollController;
  const RecipeDetailsAppBar({
    super.key,
    required this.detailedRecipe,
    required this.scrollController,
  });

  @override
  State<RecipeDetailsAppBar> createState() => _RecipeDetailsAppBarState();
}

class _RecipeDetailsAppBarState extends State<RecipeDetailsAppBar> {
  bool _collapsed = false;
  bool _halfCollapsed = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_handleScroll);
  }

  final expandedHeight = 270.h;
  void _handleScroll() {
    if (!widget.scrollController.hasClients) return;
    // a bit before fully collapsed
    final threshold = expandedHeight - MediaQuery.of(context).padding.top;
    final shouldCollapse = widget.scrollController.offset > threshold;
    final shouldHalfCollapse = widget.scrollController.offset > threshold / 2;
    if (shouldCollapse != _collapsed || shouldHalfCollapse != _halfCollapsed) {
      setState(() {
        _collapsed = shouldCollapse;
        _halfCollapsed = shouldHalfCollapse;
      });
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_handleScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: expandedHeight,
      scrolledUnderElevation: 2,
      surfaceTintColor: AppColors.white,
      backgroundColor: AppColors.white,
      shadowColor: AppColors.lightGray,
      title: AnimatedOpacity(
        opacity: _collapsed ? 1 : 0,
        duration: const Duration(milliseconds: 120),
        child: AppText(
          widget.detailedRecipe.name,
          style: TextStyles.font16SemiBoldBlack,
        ),
      ),
      leading: Padding(
        padding: EdgeInsets.only(left: 8.w),
        child: CustomInkWell(
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20.w,
            color: _collapsed ? AppColors.darkGreen : AppColors.black,
          ),
          onTap: () => Navigator.of(context).maybePop(),
        ),
      ),
      actions: [
        AppImage(
          AppAssets.upload,
          width: 20.w,
          height: 20.w,
          color: _collapsed ? AppColors.darkGreen : AppColors.black,
        ),
        SizedBox(width: 12.w),
      ],
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        collapseMode: CollapseMode.none,
        background: Stack(
          fit: StackFit.expand,
          alignment: const Alignment(0, 0),
          children: [
            AppImage(widget.detailedRecipe.image, fit: BoxFit.cover),
            //TODO: Fix this
            // Play button removed (no video info in entity)
          ],
        ),
      ),
    );
  }
}
