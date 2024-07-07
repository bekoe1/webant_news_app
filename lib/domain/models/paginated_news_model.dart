import 'package:bloc_test_app/domain/models/news_article_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'paginated_news_model.g.dart';

@JsonSerializable()
class PaginatedNewsModel {
  @JsonKey(name: "count")
  final int count;
  @JsonKey(name: "next")
  final String? next;
  @JsonKey(name: "previous")
  final String? previous;
  @JsonKey(name: "results")
  final List<NewsArticleModel> results;

  PaginatedNewsModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory PaginatedNewsModel.fromJson(Map<String, dynamic> json) =>
      _$PaginatedNewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedNewsModelToJson(this);
}
