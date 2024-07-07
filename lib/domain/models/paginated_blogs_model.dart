import 'package:bloc_test_app/domain/models/blogs_article_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'paginated_blogs_model.g.dart';

@JsonSerializable()
class PaginatedBlogsModel {
  @JsonKey(name: "count")
  final int count;
  @JsonKey(name: "next")
  final String? next;
  @JsonKey(name: "previous")
  final String? previous;
  @JsonKey(name: "results")
  final List<BlogsArticleModel> results;

  PaginatedBlogsModel({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PaginatedBlogsModel.fromJson(Map<String, dynamic> json) =>
      _$PaginatedBlogsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedBlogsModelToJson(this);
}
