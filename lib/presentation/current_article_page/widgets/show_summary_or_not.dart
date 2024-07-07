import 'package:bloc_test_app/domain/models/blogs_article_model.dart';
import 'package:bloc_test_app/domain/models/news_article_model.dart';
import 'package:bloc_test_app/utils/text_styles.dart';
import 'package:bloc_test_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LaunchUrlOrShowText extends StatelessWidget {
  const LaunchUrlOrShowText(
      {super.key, required this.elem, required this.isBlog});

  final dynamic elem;
  final bool isBlog;

  @override
  Widget build(BuildContext context) {
    if (isBlog) {
      if ((elem as BlogsArticleModel).summary.isNotEmpty) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              (elem as BlogsArticleModel).summary,
              style: MyTextStyles.currentArticleDescriptionStyle,
              maxLines: 12,
            ),
            const SizedBox(height: 25),
            LaunchUrlButton(
              text: "Перейти к источнику",
              url: elem.url,
              height: 40,
              width: 236,
            ),
          ],
        );
      } else {
        return LaunchUrlButton(
          text: "Перейти к источнику",
          url: elem.url,
          height: 40,
          width: 236,
        );
      }
    } else {
      if ((elem as NewsArticleModel).summary.isNotEmpty) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              (elem as NewsArticleModel).summary,
              style: MyTextStyles.currentArticleDescriptionStyle,
              maxLines: 12,
            ),
            const SizedBox(height: 25),
            LaunchUrlButton(
              url: elem.url,
              height: 40,
              width: 236,
              text: 'Перейти к источнику',
            ),
          ],
        );
      } else {
        return LaunchUrlButton(
          text: "Перейти к источнику",
          url: elem.url,
          height: 40,
          width: 236,
        );
      }
    }
  }
}
