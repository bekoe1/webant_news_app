// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_blogs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedBlogsModel _$PaginatedBlogsModelFromJson(Map<String, dynamic> json) =>
    PaginatedBlogsModel(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => BlogsArticleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaginatedBlogsModelToJson(
        PaginatedBlogsModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
