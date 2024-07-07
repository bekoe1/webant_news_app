import 'package:bloc_test_app/domain/models/news_article_model.dart';
import 'package:bloc_test_app/widgets/article_item.dart';
import 'package:bloc_test_app/widgets/shimmer_container.dart';
import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  const NewsList({
    super.key,
    required this.isLoading,
    required this.onTap,
    required this.news,
    required this.scrollController,
  });

  final List<NewsArticleModel> news;
  final bool isLoading;
  final ScrollController scrollController;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        if (index < news.length) {
          return GestureDetector(
            onTap: onTap,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  //TODO goto article page
                },
                child: ArticleItem(
                  imageUrl: news[index].imageUrl,
                  id: news[index].id,
                  title: news[index].title,
                  description: news[index].summary,
                ),
              ),
            ),
          );
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
      itemCount: news.length + (isLoading ? 10 : 0),
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 16);
      },
      controller: scrollController,
    );
  }
}
