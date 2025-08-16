import 'package:json_annotation/json_annotation.dart';

import 'recipe.dart';

part 'detailed_recipe.g.dart';

@JsonSerializable()
class DetailedRecipe extends Recipe {
  final List<Step> steps;

  @JsonKey(name: 'listProducts')
  final List<Ingredient> ingredients;

  const DetailedRecipe(
    super.id,
    super.name,
    super.image,
    super.isFeatured,
    super.creatorLink,
    super.description,
    super.creatorName,
    super.creatorImage,
    super.additionalInfo, {
    required this.ingredients,
    required this.steps,
  });

  factory DetailedRecipe.fromJson(dynamic json) =>
      _$DetailedRecipeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DetailedRecipeToJson(this);
}

@JsonSerializable()
class Ingredient {
  final int? quantity;
  final bool isFeatured;
  final Product product;

  const Ingredient(this.quantity, this.isFeatured, this.product);

  factory Ingredient.fromJson(dynamic json) => _$IngredientFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}

@JsonSerializable()
class Product {
  final int id;
  final num vat;
  final num vatCost;
  final num? weight;
  final String unit;
  final String name;
  final bool inStock;
  final num basePrice;
  final String unitValue;
  final String? imageUrl;
  final num priceBeforeTax;
  final int replenishmentTime;
  final num priceBeforeBulkDiscount;
  const Product(
    this.id,
    this.basePrice,
    this.priceBeforeTax,
    this.vat,
    this.vatCost,
    this.priceBeforeBulkDiscount,
    this.weight,
    this.imageUrl,
    this.inStock,
    this.replenishmentTime,
    this.unit,
    this.unitValue,
    this.name,
  );

  factory Product.fromJson(dynamic json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class Step {
  final num id;
  final int stepNum;
  final String? description;
  final String? image;

  const Step(this.id, this.stepNum, this.description, this.image);

  factory Step.fromJson(dynamic json) => _$StepFromJson(json);

  Map<String, dynamic> toJson() => _$StepToJson(this);
}
