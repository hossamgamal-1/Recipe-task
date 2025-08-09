import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/app_sizer.dart';
import '../../../../core/utils/constants.dart';
import '../../../domain/entities/recipe_entity.dart';
import '../../bloc/recipes_cubit/recipes_cubit.dart';
import 'recipes_grid.dart';

class RecipesGridBlocBuilder extends StatelessWidget {
  const RecipesGridBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipesCubit, RecipesState>(
      builder: (context, state) {
        return SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          sliver: switch (state) {
            RecipesLoading() => RecipesGrid.skeleton(recipes: _mockRecipes),
            RecipesLoaded() => RecipesGrid(recipes: state.recipes),
            RecipesError(:final message) => SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 40.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(child: Text(message)),
                    SizedBox(height: 12.h),
                    ElevatedButton(
                      onPressed:
                          () =>
                              context.read<RecipesCubit>().load(refresh: true),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
            _ => const SliverToBoxAdapter(child: SizedBox.shrink()),
          },
        );
      },
    );
  }

  List<RecipeEntity> get _mockRecipes {
    return List.generate(
      6,
      (i) => RecipeEntity(
        id: i,
        name: 'name $i',
        image: Constants.placeholder,
        isFeatured: false,
        creatorLink: '',
        description: '',
        creatorName: 'creatorName $i',
        creatorImage: Constants.placeholder,
        timeMinutes: 80,
      ),
    );
  }
}
