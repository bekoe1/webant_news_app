import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_test_app/data/repo_implementation/news_and_blogs_repo_implementation.dart';
import 'package:bloc_test_app/domain/models/news_article_model.dart';
import 'package:bloc_test_app/domain/repo/news_and_blogs_repo.dart';
import 'package:meta/meta.dart';

part 'all_news_event.dart';
part 'all_news_state.dart';

class AllNewsBloc extends Bloc<AllNewsEvent, AllNewsState> {
  final NewsAndBlogsRepo repo = NewsAndBlogsRepoImplementation();

  AllNewsBloc() : super(AllNewsInitial()) {
    on<FetchingNewsEvent>(_onAttemptToFetchNews);
    on<RefreshingNewsEvent>(_onAttemptToRefreshNews);
    on<SearchingNewsEvent>(_onAttemptToSearch);
  }

  int offset = 0;
  static const int _limit = 10;

  Future<void> _fetchNews({
    required Emitter<AllNewsState> emit,
    String? text,
  }) async {
    log("$offset $text");
    final List<NewsArticleModel> news = (state is NewsFetchedSuccessfully)
        ? (state as NewsFetchedSuccessfully).news
        : [];
    final response = await repo.fetchNews(
      offset: offset,
      limit: _limit,
      text: text,
    );
    offset += response.results.length;
    emit(
      NewsFetchedSuccessfully(
        news: [...news, ...response.results],
        isLoading: false,
      ),
    );
  }

  Future<void> _onAttemptToSearch(
    SearchingNewsEvent event,
    Emitter<AllNewsState> emit,
  ) async {
    try {
      offset = 0;
      emit(
        NewsFetchedSuccessfully(
          news: [],
          isLoading: true,
        ),
      );
      await _fetchNews(
        emit: emit,
        text: event.text,
      );
    } catch (e) {
      emit(
        NewsFetchedWithError(
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> _onAttemptToRefreshNews(
      RefreshingNewsEvent event, Emitter<AllNewsState> emit) async {
    try {
      emit(
        NewsFetchedSuccessfully(
          news: [],
          isLoading: true,
        ),
      );
      offset = 0;
      await _fetchNews(emit: emit);
    } catch (e) {
      emit(
        NewsFetchedWithError(
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> _onAttemptToFetchNews(
      FetchingNewsEvent event, Emitter<AllNewsState> emit) async {
    try {
      List<NewsArticleModel> news = [];
      if (state is NewsFetchedSuccessfully) {
        news = (state as NewsFetchedSuccessfully).news;
      }
      emit(
        NewsFetchedSuccessfully(
          news: news,
          isLoading: true,
        ),
      );
      await _fetchNews(emit: emit);
    } catch (e) {
      emit(
        NewsFetchedWithError(
          error: e.toString(),
        ),
      );
    }
  }
}
