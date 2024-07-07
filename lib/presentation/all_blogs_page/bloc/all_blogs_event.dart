part of 'all_blogs_bloc.dart';

@immutable
abstract class AllBlogsEvent {}

class FetchingBlogsEvent extends AllBlogsEvent {}

class SearchingBlogsEvent extends AllBlogsEvent {
  final String text;

  SearchingBlogsEvent({required this.text});
}

class RefreshingBlogsEvent extends AllBlogsEvent {}
