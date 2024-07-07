import 'package:json_annotation/json_annotation.dart';

part 'news_article_model.g.dart';

@JsonSerializable()
class NewsArticleModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "url")
  final String url;
  @JsonKey(name: "image_url")
  final String imageUrl;
  @JsonKey(name: "news_site")
  final String newsSite;
  @JsonKey(name: "summary")
  final String summary;
  @JsonKey(name: "published_at")
  final String publishedAt;
  @JsonKey(name: "updated_at")
  final String updatedAt;
  @JsonKey(name: "featured")
  final bool featured;
  @JsonKey(name: "launches")
  final List<Launch> launches;
  @JsonKey(name: "events")
  final List<dynamic> events;

  NewsArticleModel({
    required this.id,
    required this.title,
    required this.url,
    required this.imageUrl,
    required this.newsSite,
    required this.summary,
    required this.publishedAt,
    required this.updatedAt,
    required this.featured,
    required this.launches,
    required this.events,
  });

  factory NewsArticleModel.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsArticleModelToJson(this);
}

@JsonSerializable()
class Launch {
  @JsonKey(name: "launch_id")
  final String launchId;
  @JsonKey(name: "provider")
  final String provider;

  Launch({
    required this.launchId,
    required this.provider,
  });

  factory Launch.fromJson(Map<String, dynamic> json) => _$LaunchFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchToJson(this);
}
