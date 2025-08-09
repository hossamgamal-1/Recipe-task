import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';

@JsonSerializable()
class Recipe {
  final bool hasMore;
  final List<Item> items;
  final num total;
  final num pageNumber;
  final num pageSize;

  Recipe(this.hasMore, this.items, this.total, this.pageNumber, this.pageSize);

  factory Recipe.fromJson(dynamic json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}

@JsonSerializable()
class Item {
  final int id;
  final String name;
  final String image;
  final bool isFeatured;
  final String? creatorLink;
  final dynamic description;
  final String? creatorName;
  final String? creatorImage;
  final AdditionalInfo additionalInfo;

  const Item(
    this.id,
    this.name,
    this.image,
    this.isFeatured,
    this.creatorLink,
    this.description,
    this.creatorName,
    this.creatorImage,
    this.additionalInfo,
  );

  factory Item.fromJson(dynamic json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

@JsonSerializable()
class AdditionalInfo {
  final num id;
  final int time;
  final String? videoLink;

  const AdditionalInfo(this.id, this.time, this.videoLink);

  factory AdditionalInfo.fromJson(dynamic json) =>
      _$AdditionalInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AdditionalInfoToJson(this);
}
