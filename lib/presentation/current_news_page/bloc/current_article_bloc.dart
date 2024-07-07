import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'current_article_event.dart';
part 'current_article_state.dart';

class CurrentArticleBloc
    extends Bloc<CurrentArticleEvent, CurrentArticleState> {
  CurrentArticleBloc() : super(CurrentArticleInitial()) {
    on<CurrentArticleEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
