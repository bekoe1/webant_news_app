import 'package:bloc_test_app/domain/models/news_article_model.dart';
import 'package:bloc_test_app/domain/models/paginated_blogs_model.dart';
import 'package:bloc_test_app/domain/models/paginated_news_model.dart';

import '../models/blogs_article_model.dart';

abstract class NewsAndBlogsRepo {
  Future<PaginatedNewsModel> fetchNews({
    required int offset,
    required int limit,
    String? text,
  });

  Future<NewsArticleModel> fetchNewsArticle({required int id});

  Future<PaginatedBlogsModel> fetchBlogs({
    required int offset,
    required int limit,
    String? text,
  });

  Future<BlogsArticleModel> fetchBlogsArticle({required int id});
}
