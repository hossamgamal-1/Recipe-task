import 'package:flutter/material.dart';

import '../../../core/theming/app_colors.dart';
import '../widgets/recipes/recipes_grid_bloc_builder.dart';
import '../widgets/recipes/recipes_sliver_app_bar.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.lightGray,
      body: CustomScrollView(
        slivers: [RecipesSliverAppBar(), RecipesGridBlocBuilder()],
      ),
    );
  }
}
