// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedList<T> _$PaginatedListFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => PaginatedList<T>(
  json['hasMore'] as bool,
  (json['items'] as List<dynamic>).map(fromJsonT).toList(),
  json['total'] as num,
  json['pageNumber'] as num,
  json['pageSize'] as num,
);

Map<String, dynamic> _$PaginatedListToJson<T>(
  PaginatedList<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'hasMore': instance.hasMore,
  'items': instance.items.map(toJsonT).toList(),
  'total': instance.total,
  'pageNumber': instance.pageNumber,
  'pageSize': instance.pageSize,
};
