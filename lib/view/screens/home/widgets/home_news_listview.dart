import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scud_networks_test/controller/news_controler.dart';
import 'package:scud_networks_test/view/screens/screens.dart';
import '../../../widgets/news_list_tile.dart';

class HomeNewsListView extends StatelessWidget {
  const HomeNewsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final newsController = Get.put(NewsController());
    log('<<<<<<<cal length>>>>>>>');
    log('<<<<<<<${newsController.recommendationNewsList.length}>>>>>>>');
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: newsController.recommendationNewsList.length < 15
          ? newsController.recommendationNewsList.length
          : 15,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Get.to(() => ArticleScreen(
                  imageUrl:
                      newsController.recommendationNewsList[index].urlToImage,
                  authorImageUrl:
                      newsController.recommendationNewsList[index].url,
                  author: newsController.recommendationNewsList[index].author,
                  title: newsController.recommendationNewsList[index].title,
                  content: newsController.recommendationNewsList[index].content,
                  date: DateTime.parse(newsController
                          .recommendationNewsList[index].publishedAt ??
                      "2024-01-01T12:22:18.8405562Z"),
                ));
          },
          child: NewsListViewTile(
            imageUrl: newsController.recommendationNewsList[index].urlToImage,
            author: newsController.recommendationNewsList[index].author,
            title: newsController.recommendationNewsList[index].title,
            date: DateTime.parse(
                newsController.recommendationNewsList[index].publishedAt ??
                    "2024-01-01T12:22:18.8405562Z"),
          ),
        );
      },
    );
  }
}
