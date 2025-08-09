import 'package:flutter/material.dart';

import '../../../../core/widgets/app_shimmer.dart';
import '../../../domain/entities/recipe_entity.dart';
import 'recipe_card.dart';

class RecipesGrid extends StatelessWidget {
  final List<RecipeEntity> recipes;
  final bool isLoading;

  const RecipesGrid({super.key, required this.recipes}) : isLoading = false;
  const RecipesGrid.skeleton({super.key, required this.recipes})
    : isLoading = true;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.64,
      ),
      delegate: SliverChildBuilderDelegate((_, index) {
        return AppShimmer(
          enabled: isLoading,
          child: RecipeCard(recipes[index], key: ValueKey(recipes[index].id)),
        );
      }, childCount: recipes.length),
    );
  }
}
