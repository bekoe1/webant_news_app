// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blogs_article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogsArticleModel _$BlogsArticleModelFromJson(Map<String, dynamic> json) =>
    BlogsArticleModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      url: json['url'] as String,
      imageUrl: json['image_url'] as String,
      newsSite: json['news_site'] as String,
      summary: json['summary'] as String,
      publishedAt: json['published_at'] as String,
      updatedAt: json['updated_at'] as String,
      featured: json['featured'] as bool,
      launches: (json['launches'] as List<dynamic>)
          .map((e) => Launch.fromJson(e as Map<String, dynamic>))
          .toList(),
      events: (json['events'] as List<dynamic>)
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BlogsArticleModelToJson(BlogsArticleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'image_url': instance.imageUrl,
      'news_site': instance.newsSite,
      'summary': instance.summary,
      'published_at': instance.publishedAt,
      'updated_at': instance.updatedAt,
      'featured': instance.featured,
      'launches': instance.launches,
      'events': instance.events,
    };

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      eventId: (json['event_id'] as num).toInt(),
      provider: json['provider'] as String,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'event_id': instance.eventId,
      'provider': instance.provider,
    };

Launch _$LaunchFromJson(Map<String, dynamic> json) => Launch(
      launchId: json['launch_id'] as String,
      provider: json['provider'] as String,
    );

Map<String, dynamic> _$LaunchToJson(Launch instance) => <String, dynamic>{
      'launch_id': instance.launchId,
      'provider': instance.provider,
    };
