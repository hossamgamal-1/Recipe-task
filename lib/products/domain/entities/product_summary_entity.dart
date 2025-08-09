class ProductSummaryEntity {
  final int id;
  final String name;
  final String image;
  final bool isFeatured;
  final String? creatorLink;
  final String? description;
  final String? creatorName;
  final String? creatorImage;
  final int timeMinutes;

  const ProductSummaryEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    required this.creatorLink,
    required this.description,
    required this.creatorName,
    required this.creatorImage,
    required this.timeMinutes,
  });
}
