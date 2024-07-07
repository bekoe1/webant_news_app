part of 'all_news_bloc.dart';

@immutable
abstract class AllNewsState {}

class AllNewsInitial extends AllNewsState {}

class NewsFetchedSuccessfully extends AllNewsState {
  final List<NewsArticleModel> news;
  final bool isLoading;

  NewsFetchedSuccessfully({
    required this.news,
    required this.isLoading,
  });
}

class NewsFetchedWithError extends AllNewsState {
  final String error;

  NewsFetchedWithError({required this.error});
}
