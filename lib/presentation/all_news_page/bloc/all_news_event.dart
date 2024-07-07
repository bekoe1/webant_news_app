part of 'all_news_bloc.dart';

@immutable
abstract class AllNewsEvent {}

class FetchingNewsEvent extends AllNewsEvent {}

class SearchingNewsEvent extends AllNewsEvent {
  final String text;

  SearchingNewsEvent({required this.text});
}

class RefreshingNewsEvent extends AllNewsEvent {}
