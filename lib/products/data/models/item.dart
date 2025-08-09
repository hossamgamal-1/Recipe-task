import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class PaginatedItems {
  final bool hasMore;
  final List<Item> items;
  final num total;
  final num pageNumber;
  final num pageSize;

  const PaginatedItems(
    this.hasMore,
    this.items,
    this.total,
    this.pageNumber,
    this.pageSize,
  );

  factory PaginatedItems.fromJson(dynamic json) =>
      _$PaginatedItemsFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedItemsToJson(this);
}

@JsonSerializable()
class Item {
  final int id;
  final String name;
  final String image;
  final bool isFeatured;
  final String? creatorLink;
  final String? description;
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
