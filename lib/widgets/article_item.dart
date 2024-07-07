import 'package:bloc_test_app/utils/text_styles.dart';
import 'package:bloc_test_app/widgets/shimmer_container.dart';
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
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              fit: BoxFit.fill,
              height: 70,
              width: 70,
              imageUrl,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const ShimmerContainer(
                  height: 70,
                  width: 70,
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  "no_data.svg",
                  height: 70,
                  width: 70,
                );
              },
            ),
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
