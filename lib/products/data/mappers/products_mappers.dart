import '../../domain/entities/category_entity.dart';
import '../../domain/entities/product_details_entity.dart';
import '../../domain/entities/product_summary_entity.dart';
import '../models/category.dart' as dto;
import '../models/detailed_item.dart' as dto;
import '../models/item.dart' as dto;

extension CategoryMapper on dto.Category {
  CategoryEntity toEntity() => CategoryEntity(id: id, name: name);
}

extension ItemMapper on dto.Item {
  ProductSummaryEntity toEntity() => ProductSummaryEntity(
    id: id,
    name: name,
    image: image,
    isFeatured: isFeatured,
    creatorLink: creatorLink,
    description: description,
    creatorName: creatorName,
    creatorImage: creatorImage,
    timeMinutes: additionalInfo.time,
  );
}

extension DetailedItemMapper on dto.DetailedItem {
  ProductDetailsEntity toEntity() => ProductDetailsEntity(
    id: id,
    name: name,
    image: image,
    isFeatured: isFeatured,
    creatorLink: creatorLink,
    description: description,
    creatorName: creatorName,
    creatorImage: creatorImage,
    timeMinutes: additionalInfo.time,
    steps: steps.map((e) => e.toEntity()).toList(),
    ingredients: ingredients.map((e) => e.toEntity()).toList(),
  );
}

extension IngredientMapper on dto.Ingredient {
  IngredientEntity toEntity() => IngredientEntity(
    quantity: quanitity,
    isFeatured: isFeatured,
    product: product.toEntity(),
  );
}

extension ProductMapper on dto.Product {
  ProductEntity toEntity() => ProductEntity(
    id: id,
    vat: vat,
    name: name,
    unit: unit,
    weight: weight,
    inStock: inStock,
    vatCost: vatCost,
    imageUrl: imageUrl,
    unitValue: unitValue,
    basePrice: basePrice,
    priceBeforeTax: priceBeforeTax,
    replenishmentTime: replenishmentTime,
    priceBeforeBulkDiscount: priceBeforeBulkDiscount,
  );
}

extension StepMapper on dto.Step {
  StepEntity toEntity() => StepEntity(
    id: id,
    image: image,
    stepNum: stepNum,
    description: description,
  );
}
