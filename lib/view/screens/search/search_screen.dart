import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/news_controler.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newsController = Get.put(NewsController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  BounceInDown(
                    child: AppRoundedButton(
                      onTap: () {
                        Get.back();
                      },
                      iconData: Icons.arrow_back_ios,
                    ),
                  ),
                ],
              ),
            ),
            FadeInLeft(
              child: const HomeHeading(
                title: 'Searched Results',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: newsController.suggestionNewsList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => ArticleScreen(
                            imageUrl: newsController
                                .suggestionNewsList[index].urlToImage,
                            authorImageUrl:
                                newsController.suggestionNewsList[index].url,
                            author:
                                newsController.suggestionNewsList[index].author,
                            title:
                                newsController.suggestionNewsList[index].title,
                            content: newsController
                                .suggestionNewsList[index].content,
                            date: DateTime.parse(newsController
                                    .suggestionNewsList[index].publishedAt ??
                                "2024-01-01T12:22:18.8405562Z"),
                          ));
                    },
                    child: NewsListViewTile(
                      imageUrl:
                          newsController.suggestionNewsList[index].urlToImage,
                      author: newsController.suggestionNewsList[index].author,
                      title: newsController.suggestionNewsList[index].title,
                      date: DateTime.parse(newsController
                              .suggestionNewsList[index].publishedAt ??
                          "2024-01-01T12:22:18.8405562Z"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
