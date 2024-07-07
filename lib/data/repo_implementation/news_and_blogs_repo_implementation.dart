import 'package:bloc_test_app/domain/models/news_article_model.dart';
import 'package:bloc_test_app/domain/models/paginated_blogs_model.dart';
import 'package:bloc_test_app/domain/models/paginated_news_model.dart';
import 'package:bloc_test_app/domain/repo/news_and_blogs_repo.dart';
import 'package:dio/dio.dart';

import '../../domain/models/blogs_article_model.dart';

class NewsAndBlogsRepoImplementation implements NewsAndBlogsRepo {
  final Dio dio = Dio(
    BaseOptions(baseUrl: "https://api.spaceflightnewsapi.net"),
  );

  @override
  Future<PaginatedNewsModel> fetchNews(
      {required int offset, required int limit, String? text}) async {
    final response = await dio.get("/v4/articles/", queryParameters: {
      "offset": offset,
      "limit": limit,
      "search": text,
    });
    return PaginatedNewsModel.fromJson(response.data);
  }

  @override
  Future<NewsArticleModel> fetchNewsArticle({required int id}) async {
    final response = await dio.get("/v4/articles/$id/");
    return NewsArticleModel.fromJson(response.data);
  }

  @override
  Future<PaginatedBlogsModel> fetchBlogs(
      {required int offset, required int limit, String? text}) async {
    final response = await dio.get("/v4/blogs/", queryParameters: {
      "offset": offset,
      "limit": limit,
      "search": text,
    });
    return PaginatedBlogsModel.fromJson(response.data);
  }

  @override
  Future<BlogsArticleModel> fetchBlogsArticle({required int id}) async {
    final response = await dio.get("/v4/blogs/$id/");
    return BlogsArticleModel.fromJson(response.data);
  }
}
