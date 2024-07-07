import 'package:bloc_test_app/domain/models/blogs_article_model.dart';
import 'package:bloc_test_app/domain/models/news_article_model.dart';
import 'package:bloc_test_app/presentation/current_article_page/bloc/current_article_bloc.dart';
import 'package:bloc_test_app/presentation/current_article_page/widgets/show_summary_or_not.dart';
import 'package:bloc_test_app/utils/nav_bar_helper.dart';
import 'package:bloc_test_app/utils/text_styles.dart';
import 'package:bloc_test_app/widgets/image_with_shimmer.dart';
import 'package:bloc_test_app/widgets/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentArticlePage extends StatelessWidget {
  const CurrentArticlePage({super.key, required this.id, required this.isBlog});

  final int id;
  final bool isBlog;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: const Color.fromRGBO(78, 75, 102, 1),
          onPressed: () {
            NavigationBarState().setShowNavigationBar(true);
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => CurrentArticleBloc()
          ..add(
            CurrentArticleInitialEvent(
              id: id,
              isBlog: isBlog,
            ),
          ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 50),
          child: SingleChildScrollView(
            child: BlocConsumer<CurrentArticleBloc, CurrentArticleState>(
              listener: (context, state) {
                if (state is CurrentArticleErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.error),
                      backgroundColor: Colors.grey,
                      duration: const Duration(seconds: 4),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is CurrentArticleFetchedState) {
                  if (state.isLoading == false) {
                    return Column(
                      children: [
                        ImageWithShimmerAndErrorImage(
                          imageUrl: state.isBlog
                              ? (state.data! as BlogsArticleModel).imageUrl
                              : (state.data! as NewsArticleModel).imageUrl,
                          height: 235,
                          width: 380,
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Text(
                          state.isBlog
                              ? (state.data! as BlogsArticleModel).title
                              : (state.data! as NewsArticleModel).title,
                          style: MyTextStyles.currentArticleTitleStyle,
                          maxLines: 5,
                        ),
                        const SizedBox(height: 7),
                        const Divider(
                          color: Color.fromRGBO(196, 196, 196, 1),
                        ),
                        const SizedBox(height: 8),
                        LaunchUrlOrShowText(
                          elem: state.data,
                          isBlog: isBlog,
                        ),
                      ],
                    );
                  } else {
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ShimmerContainer(height: 235, width: 380),
                        SizedBox(height: 18),
                        ShimmerContainer(height: 280, width: 380),
                        SizedBox(height: 25),
                        ShimmerContainer(height: 40, width: 236),
                      ],
                    );
                  }
                }
                return const SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerContainer(height: 235, width: 380),
                      SizedBox(height: 18),
                      ShimmerContainer(height: 280, width: 380),
                      SizedBox(height: 25),
                      ShimmerContainer(height: 40, width: 236),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
