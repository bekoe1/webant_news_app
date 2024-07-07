import 'package:bloc_test_app/utils/text_styles.dart';
import 'package:bloc_test_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 70),
          child: Column(
            children: [
              Text(
                'Тестовое задание от команды Webant - приложение для просмотра блогов/новостей с возможностью поиска',
                style: MyTextStyles.currentArticleTitleStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 150),
              Text(
                "Ссылки на автора:",
                style: MyTextStyles.currentArticleTitleStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              LaunchUrlButton(
                height: 65,
                width: 280,
                url: "https://t.me/qqqqqubs",
                text: "@telegram",
              ),
              SizedBox(height: 24),
              LaunchUrlButton(
                height: 65,
                width: 280,
                url: "https://github.com/bekoe1",
                text: "github",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
