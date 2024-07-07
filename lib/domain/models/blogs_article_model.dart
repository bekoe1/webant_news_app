import 'package:json_annotation/json_annotation.dart';

part 'blogs_article_model.g.dart';

@JsonSerializable()
class BlogsArticleModel {
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
  final List<Event> events;

  BlogsArticleModel({
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

  factory BlogsArticleModel.fromJson(Map<String, dynamic> json) =>
      _$BlogsArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$BlogsArticleModelToJson(this);
}

@JsonSerializable()
class Event {
  @JsonKey(name: "event_id")
  final int eventId;
  @JsonKey(name: "provider")
  final String provider;

  Event({
    required this.eventId,
    required this.provider,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
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
