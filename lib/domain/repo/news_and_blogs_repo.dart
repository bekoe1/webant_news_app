import 'package:bloc_test_app/domain/models/paginated_news_model.dart';

abstract class NewsAndBlogsRepo {
  Future<PaginatedNewsModel> fetchNews({
    required int offset,
    required int limit,
    String? text,
  });
}
