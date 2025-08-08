import 'package:json_annotation/json_annotation.dart';

import 'recipe.dart';

part 'detailed_item.g.dart';

@JsonSerializable()
class DetailedItem extends Item {
  final List<Step> steps;

  @JsonKey(name: 'listProducts')
  final List<Ingredient> ingredients;

  const DetailedItem(
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

  factory DetailedItem.fromJson(dynamic json) => _$DetailedItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DetailedItemToJson(this);
}

@JsonSerializable()
class Ingredient {
  final int quanitity;
  final bool isFeatured;
  final Product product;

  const Ingredient(this.quanitity, this.isFeatured, this.product);

  factory Ingredient.fromJson(dynamic json) => _$IngredientFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}

@JsonSerializable()
class Product {
  final num id;
  final num basePrice;
  final num priceBeforeTax;
  final num vat;
  final num vatCost;
  final num priceBeforeBulkDiscount;
  final String status;
  final num? weight;
  final String? erpNo;
  final String? remark;
  final String? arRemark;
  final String? coverPhoto;
  final int pack;
  final String? photoType;
  final String? imageUrl;
  final bool inStock;
  final int replenishmentTime;

  const Product(
    this.id,
    this.basePrice,
    this.priceBeforeTax,
    this.vat,
    this.vatCost,
    this.priceBeforeBulkDiscount,
    this.status,
    this.weight,
    this.erpNo,
    this.remark,
    this.arRemark,
    this.coverPhoto,
    this.pack,
    this.photoType,
    this.imageUrl,
    this.inStock,
    this.replenishmentTime,
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
