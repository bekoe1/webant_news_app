// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedNewsModel _$PaginatedNewsModelFromJson(Map<String, dynamic> json) =>
    PaginatedNewsModel(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => NewsArticleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaginatedNewsModelToJson(PaginatedNewsModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
