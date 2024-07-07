part of 'current_article_bloc.dart';

@immutable
abstract class CurrentArticleState {}

class CurrentArticleInitial extends CurrentArticleState {}

class CurrentArticleFetchedState extends CurrentArticleState {
  final dynamic data;
  final bool isLoading;
  final bool isBlog;
  CurrentArticleFetchedState({
    required this.isBlog,
    required this.data,
    required this.isLoading,
  });
}

class CurrentArticleErrorState extends CurrentArticleState {
  final String error;

  CurrentArticleErrorState({required this.error});
}
