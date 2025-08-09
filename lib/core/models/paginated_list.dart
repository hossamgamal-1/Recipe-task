import 'package:json_annotation/json_annotation.dart';

part 'paginated_list.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PaginatedList<T> {
  final bool hasMore;
  final List<T> items;
  final num total;
  final num pageNumber;
  final num pageSize;

  const PaginatedList(
    this.hasMore,
    this.items,
    this.total,
    this.pageNumber,
    this.pageSize,
  );

  factory PaginatedList.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$PaginatedListFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$PaginatedListToJson(this, toJsonT);
}
