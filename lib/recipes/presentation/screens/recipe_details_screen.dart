import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theming/app_colors.dart';
import '../bloc/recipe_details_cubit/recipe_details_cubit.dart';
import '../widgets/recipe_details/recipe_details_content.dart';
import '../widgets/recipe_details/recipe_details_skeleton_content.dart';

class RecipeDetailsScreen extends StatefulWidget {
  final int productId;
  const RecipeDetailsScreen({super.key, required this.productId});

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: BlocBuilder<RecipeDetailsCubit, RecipeDetailsState>(
        builder: (context, state) {
          return switch (state) {
            RecipeDetailsInitial() => const SizedBox.shrink(),
            RecipeDetailsLoading() => const RecipeDetailsSkeletonContent(),
            RecipeDetailsLoaded() => RecipeDetailsContent(
              detailedRecipe: state.details,
              scrollController: _scrollController,
            ),
            RecipeDetailsError(:final message) => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(message),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      // Attempt retry with the last used id if available via route args
                      context.read<RecipeDetailsCubit>().load(widget.productId);
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          };
        },
      ),
    );
  }
}
