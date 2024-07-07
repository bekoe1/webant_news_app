import 'package:bloc_test_app/domain/models/paginated_news_model.dart';
import 'package:bloc_test_app/domain/repo/news_and_blogs_repo.dart';
import 'package:dio/dio.dart';

class NewsAndBlogsRepoImplementation implements NewsAndBlogsRepo {
  final Dio dio = Dio(
    BaseOptions(baseUrl: "https://api.spaceflightnewsapi.net"),
  );

  @override
  Future<PaginatedNewsModel> fetchNews(
      {required int offset, required int limit, String? text}) async {
    // TODO: implement fetchNews
    final response = await dio.get("/v4/articles/", queryParameters: {
      "offset": offset,
      "limit": limit,
      "search": text,
    });
    return PaginatedNewsModel.fromJson(response.data);
  }
}
