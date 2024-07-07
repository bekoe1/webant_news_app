part of 'all_news_bloc.dart';

@immutable
abstract class AllNewsEvent {}

class FetchingNewsEvent extends AllNewsEvent {
  final int offset;
  final int limit;

  FetchingNewsEvent({
    required this.offset,
    required this.limit,
  });
}

class SearchingNewsEvent extends AllNewsEvent {
  final String text;

  SearchingNewsEvent({required this.text});
}

class RefreshingNewsEvent extends AllNewsEvent {}
