import 'package:bloc_test_app/domain/models/blogs_article_model.dart';
import 'package:bloc_test_app/domain/models/news_article_model.dart';
import 'package:bloc_test_app/widgets/article_item.dart';
import 'package:bloc_test_app/widgets/shimmer_container.dart';
import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  const NewsList({
    super.key,
    required this.isLoading,
    required this.onTap,
    required this.articles,
    required this.scrollController,
  });

  final List<dynamic> articles;
  final bool isLoading;
  final ScrollController scrollController;
  final void Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        if (index < articles.length) {
          if (articles.every((element) => element is NewsArticleModel) ||
              (articles.every((element) => element is BlogsArticleModel))) {
            return Center(
              child: GestureDetector(
                onTap: () {
                  onTap(articles[index].id);
                },
                child: ArticleItem(
                  imageUrl: articles[index].imageUrl,
                  id: articles[index].id,
                  title: articles[index].title,
                  description: articles[index].summary,
                ),
              ),
            );
          }
        } else {
          return const Padding(
            padding: EdgeInsets.only(
              left: 12,
              top: 16,
            ),
            child: Row(
              children: [
                ShimmerContainer(height: 70, width: 70),
                SizedBox(width: 8),
                ShimmerContainer(height: 70, width: 286),
              ],
            ),
          );
        }
      },
      itemCount: articles.length + (isLoading ? 10 : 0),
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 16);
      },
      controller: scrollController,
    );
  }
}
