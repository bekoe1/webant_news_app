part of 'current_article_bloc.dart';

@immutable
abstract class CurrentArticleEvent {}

class CurrentArticleInitialEvent extends CurrentArticleEvent {
  final int id;
  final bool isBlog;

  CurrentArticleInitialEvent({
    required this.id,
    required this.isBlog,
  });
}
