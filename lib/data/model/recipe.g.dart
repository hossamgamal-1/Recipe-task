// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
  json['hasMore'] as bool,
  (json['items'] as List<dynamic>).map(Item.fromJson).toList(),
  json['total'] as num,
  json['pageNumber'] as num,
  json['pageSize'] as num,
);

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
  'hasMore': instance.hasMore,
  'items': instance.items,
  'total': instance.total,
  'pageNumber': instance.pageNumber,
  'pageSize': instance.pageSize,
};

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  json['id'] as num,
  json['name'] as String,
  json['image'] as String,
  json['isFeatured'] as bool,
  json['creatorLink'] as String?,
  json['description'],
  json['creatorName'] as String?,
  json['creatorImage'] as String?,
  AdditionalInfo.fromJson(json['additionalInfo']),
);

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
  'isFeatured': instance.isFeatured,
  'creatorLink': instance.creatorLink,
  'description': instance.description,
  'creatorName': instance.creatorName,
  'creatorImage': instance.creatorImage,
  'additionalInfo': instance.additionalInfo,
};

AdditionalInfo _$AdditionalInfoFromJson(Map<String, dynamic> json) =>
    AdditionalInfo(
      json['id'] as num,
      (json['time'] as num).toInt(),
      json['videoLink'] as String?,
    );

Map<String, dynamic> _$AdditionalInfoToJson(AdditionalInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'time': instance.time,
      'videoLink': instance.videoLink,
    };
