part of 'all_news_bloc.dart';

@immutable
abstract class AllNewsState {}

class AllNewsInitial extends AllNewsState {}

class NewsFetchedSuccessfully extends AllNewsState {
  final List<NewsArticleModel> news;

  NewsFetchedSuccessfully({required this.news});
}

class NewsFetchedWithError extends AllNewsState {
  final String error;

  NewsFetchedWithError({required this.error});
}

class NewsLoading extends AllNewsState {
  final List<NewsArticleModel> news;

  NewsLoading({required this.news});
}
