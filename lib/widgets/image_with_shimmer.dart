import 'dart:developer';

import 'package:bloc_test_app/widgets/shimmer_container.dart';
import 'package:flutter/material.dart';

class ImageWithShimmerAndErrorImage extends StatelessWidget {
  const ImageWithShimmerAndErrorImage({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
  });

  final String imageUrl;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Image.network(
        fit: BoxFit.cover,
        height: height,
        width: width,
        imageUrl,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return ShimmerContainer(
            height: height,
            width: width,
          );
        },
        errorBuilder: (context, error, stackTrace) {
          log(error.toString());
          return ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              "https://res.cloudinary.com/teepublic/image/private/s--NkspL6KL--/t_Preview/b_rgb:ffffff,c_lpad,f_jpg,h_630,q_90,w_1200/v1527296869/production/designs/2723988_2.jpg",
              height: height,
              width: width,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
