import 'package:flutter/material.dart';

abstract class MyTextStyles {
  static const articleDescriptionStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Color.fromRGBO(78, 75, 102, 1),
  );

  static const articleTitleStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  static const appBarTitleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static const currentArticleTitleStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 24,
    color: Color.fromRGBO(5, 5, 5, 1),
  );

  static const currentArticleDescriptionStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: Color.fromRGBO(78, 75, 102, 1),
  );
}
