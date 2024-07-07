import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_test_app/data/repo_implementation/news_and_blogs_repo_implementation.dart';
import 'package:bloc_test_app/domain/repo/news_and_blogs_repo.dart';
import 'package:meta/meta.dart';

import '../../../domain/models/blogs_article_model.dart';

part 'all_blogs_event.dart';
part 'all_blogs_state.dart';

class AllBlogsBloc extends Bloc<AllBlogsEvent, AllBlogsState> {
  final NewsAndBlogsRepo repo = NewsAndBlogsRepoImplementation();

  AllBlogsBloc() : super(AllBlogsInitial()) {
    on<FetchingBlogsEvent>(_onAttemptToFetchBlogs);
    on<RefreshingBlogsEvent>(_onAttemptToRefreshBlogs);
    on<SearchingBlogsEvent>(_onAttemptToSearch);
  }

  int offset = 0;
  static const int _limit = 10;

  Future<void> _fetchBlogs({
    required Emitter<AllBlogsState> emit,
    String? text,
  }) async {
    log("$offset $text");
    final List<BlogsArticleModel> Blogs = (state is BlogsFetchedSuccessfully)
        ? (state as BlogsFetchedSuccessfully).blogs
        : [];
    final response = await repo.fetchBlogs(
      offset: offset,
      limit: _limit,
      text: text,
    );
    offset += response.results.length;
    emit(
      BlogsFetchedSuccessfully(
        blogs: [...Blogs, ...response.results],
        isLoading: false,
      ),
    );
  }

  Future<void> _onAttemptToSearch(
    SearchingBlogsEvent event,
    Emitter<AllBlogsState> emit,
  ) async {
    try {
      offset = 0;
      emit(
        BlogsFetchedSuccessfully(
          blogs: [],
          isLoading: true,
        ),
      );
      await _fetchBlogs(
        emit: emit,
        text: event.text,
      );
    } catch (e) {
      emit(
        BlogsFetchedWithError(
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> _onAttemptToRefreshBlogs(
      RefreshingBlogsEvent event, Emitter<AllBlogsState> emit) async {
    try {
      emit(
        BlogsFetchedSuccessfully(
          blogs: [],
          isLoading: true,
        ),
      );
      offset = 0;
      await _fetchBlogs(emit: emit);
    } catch (e) {
      emit(
        BlogsFetchedWithError(
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> _onAttemptToFetchBlogs(
      FetchingBlogsEvent event, Emitter<AllBlogsState> emit) async {
    try {
      List<BlogsArticleModel> Blogs = [];
      if (state is BlogsFetchedSuccessfully) {
        Blogs = (state as BlogsFetchedSuccessfully).blogs;
      }
      emit(
        BlogsFetchedSuccessfully(
          blogs: Blogs,
          isLoading: true,
        ),
      );
      await _fetchBlogs(emit: emit);
    } catch (e) {
      emit(
        BlogsFetchedWithError(
          error: e.toString(),
        ),
      );
    }
  }
}
