import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:webant_news_app/data/repo_implementation/news_and_blogs_repo_impl.dart';
import 'package:webant_news_app/domain/models/news_article_model.dart';

part 'all_news_event.dart';
part 'all_news_state.dart';

class AllNewsBloc extends Bloc<AllNewsEvent, AllNewsState> {
  final NewsBlogsRepoImplementation repo = NewsBlogsRepoImplementation();

  AllNewsBloc() : super(AllNewsInitial()) {
    on<FetchingNewsEvent>(_onAttemptToFetchNews);
  }

  Future<void> _onAttemptToFetchNews(
      FetchingNewsEvent event, Emitter<AllNewsState> emit) async {
    try {
      emit(NewsLoading(news: []));
      final data = await repo.FetchNews(
        offset: event.offset,
        limit: event.limit,
      );

      emit(
        NewsFetchedSuccessfully(
          news: data.results,
        ),
      );
    } catch (e) {
      emit(
        NewsFetchedWithError(
          error: e.toString(),
        ),
      );
    }
  }
}
