part of 'all_blogs_bloc.dart';

@immutable
abstract class AllBlogsState {}

class AllBlogsInitial extends AllBlogsState {}

class BlogsFetchedSuccessfully extends AllBlogsState {
  final List<BlogsArticleModel> blogs;
  final bool isLoading;

  BlogsFetchedSuccessfully({
    required this.blogs,
    required this.isLoading,
  });
}

class BlogsFetchedWithError extends AllBlogsState {
  final String error;

  BlogsFetchedWithError({required this.error});
}
