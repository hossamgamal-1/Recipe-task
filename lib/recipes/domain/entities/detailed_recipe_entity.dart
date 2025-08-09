class DetailedRecipeEntity {
  final int id;
  final String name;
  final String image;
  final bool isFeatured;
  final String? creatorLink;
  final String? description;
  final String? creatorName;
  final String? creatorImage;
  final int timeMinutes;
  final List<IngredientEntity> ingredients;
  final List<StepEntity> steps;

  const DetailedRecipeEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    required this.creatorLink,
    required this.description,
    required this.creatorName,
    required this.creatorImage,
    required this.timeMinutes,
    required this.ingredients,
    required this.steps,
  });
}

class IngredientEntity {
  final int? quantity;
  final bool isFeatured;
  final ProductEntity product;

  const IngredientEntity({
    required this.quantity,
    required this.isFeatured,
    required this.product,
  });
}

class ProductEntity {
  final num id;
  final num basePrice;
  final num priceBeforeTax;
  final num vat;
  final num vatCost;
  final num priceBeforeBulkDiscount;
  final num? weight;
  final String? imageUrl;
  final bool inStock;
  final int replenishmentTime;
  final String unit;
  final String unitValue;
  final String name;

  const ProductEntity({
    required this.id,
    required this.basePrice,
    required this.priceBeforeTax,
    required this.vat,
    required this.vatCost,
    required this.priceBeforeBulkDiscount,
    required this.weight,
    required this.imageUrl,
    required this.inStock,
    required this.replenishmentTime,
    required this.unit,
    required this.unitValue,
    required this.name,
  });
}

class StepEntity {
  final num id;
  final int stepNum;
  final String? description;
  final String? image;

  const StepEntity({
    required this.id,
    required this.stepNum,
    this.description,
    this.image,
  });
}
