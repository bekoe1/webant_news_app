import 'package:bloc_test_app/utils/text_styles.dart';
import 'package:bloc_test_app/widgets/image_with_shimmer.dart';
import 'package:flutter/material.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({
    super.key,
    required this.imageUrl,
    required this.description,
    required this.title,
    required this.id,
  });

  final String imageUrl;
  final String description;
  final String title;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86,
      width: 380,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          ImageWithShimmerAndErrorImage(
            imageUrl: imageUrl,
            height: 70,
            width: 70,
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 230,
                child: Text(
                  title,
                  style: MyTextStyles.articleTitleStyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              const SizedBox(height: 4),
              SizedBox(
                width: 286,
                child: Text(
                  description,
                  style: MyTextStyles.articleDescriptionStyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
