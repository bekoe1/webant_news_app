import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_test_app/data/repo_implementation/news_and_blogs_repo_implementation.dart';
import 'package:bloc_test_app/domain/repo/news_and_blogs_repo.dart';
import 'package:meta/meta.dart';

part 'current_article_event.dart';
part 'current_article_state.dart';

class CurrentArticleBloc
    extends Bloc<CurrentArticleEvent, CurrentArticleState> {
  final NewsAndBlogsRepo repo = NewsAndBlogsRepoImplementation();

  CurrentArticleBloc() : super(CurrentArticleInitial()) {
    on<CurrentArticleInitialEvent>(_onAttemptToInitialLoad);
  }

  Future<void> _onAttemptToInitialLoad(
    CurrentArticleInitialEvent event,
    Emitter<CurrentArticleState> emit,
  ) async {
    try {
      emit(
        CurrentArticleFetchedState(
          data: null,
          isLoading: true,
          isBlog: event.isBlog,
        ),
      );
      final data;
      log(event.id.toString());
      if (!event.isBlog) {
        data = await repo.fetchNewsArticle(id: event.id);
      } else {
        data = await repo.fetchBlogsArticle(id: event.id);
      }
      emit(
        CurrentArticleFetchedState(
          data: data,
          isLoading: false,
          isBlog: event.isBlog,
        ),
      );
    } catch (e) {
      emit(
        CurrentArticleErrorState(
          error: e.toString(),
        ),
      );
    }
  }
}
