// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailed_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailedItem _$DetailedItemFromJson(Map<String, dynamic> json) => DetailedItem(
  json['id'] as num,
  json['name'] as String,
  json['image'] as String,
  json['isFeatured'] as bool,
  json['creatorLink'] as String?,
  json['description'],
  json['creatorName'] as String?,
  json['creatorImage'] as String?,
  AdditionalInfo.fromJson(json['additionalInfo']),
  ingredients:
      (json['listProducts'] as List<dynamic>).map(Ingredient.fromJson).toList(),
  steps: (json['steps'] as List<dynamic>).map(Step.fromJson).toList(),
);

Map<String, dynamic> _$DetailedItemToJson(DetailedItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'isFeatured': instance.isFeatured,
      'creatorLink': instance.creatorLink,
      'description': instance.description,
      'creatorName': instance.creatorName,
      'creatorImage': instance.creatorImage,
      'additionalInfo': instance.additionalInfo,
      'steps': instance.steps,
      'listProducts': instance.ingredients,
    };

Ingredient _$IngredientFromJson(Map<String, dynamic> json) => Ingredient(
  (json['quanitity'] as num).toInt(),
  json['isFeatured'] as bool,
  Product.fromJson(json['product']),
);

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'quanitity': instance.quanitity,
      'isFeatured': instance.isFeatured,
      'product': instance.product,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  json['id'] as num,
  json['basePrice'] as num,
  json['priceBeforeTax'] as num,
  json['vat'] as num,
  json['vatCost'] as num,
  json['priceBeforeBulkDiscount'] as num,
  json['status'] as String,
  json['weight'] as num?,
  json['erpNo'] as String?,
  json['remark'] as String?,
  json['arRemark'] as String?,
  json['coverPhoto'] as String?,
  (json['pack'] as num).toInt(),
  json['photoType'] as String?,
  json['imageUrl'] as String?,
  json['inStock'] as bool,
  (json['replenishmentTime'] as num).toInt(),
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'id': instance.id,
  'basePrice': instance.basePrice,
  'priceBeforeTax': instance.priceBeforeTax,
  'vat': instance.vat,
  'vatCost': instance.vatCost,
  'priceBeforeBulkDiscount': instance.priceBeforeBulkDiscount,
  'status': instance.status,
  'weight': instance.weight,
  'erpNo': instance.erpNo,
  'remark': instance.remark,
  'arRemark': instance.arRemark,
  'coverPhoto': instance.coverPhoto,
  'pack': instance.pack,
  'photoType': instance.photoType,
  'imageUrl': instance.imageUrl,
  'inStock': instance.inStock,
  'replenishmentTime': instance.replenishmentTime,
};

Step _$StepFromJson(Map<String, dynamic> json) => Step(
  json['id'] as num,
  (json['stepNum'] as num).toInt(),
  json['description'] as String?,
  json['image'] as String?,
);

Map<String, dynamic> _$StepToJson(Step instance) => <String, dynamic>{
  'id': instance.id,
  'stepNum': instance.stepNum,
  'description': instance.description,
  'image': instance.image,
};
