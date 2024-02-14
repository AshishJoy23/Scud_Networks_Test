import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/news_controler.dart';
import '../../../widgets/widgets.dart';
import '../../screens.dart';

class CategoryWiseNews extends StatelessWidget {
  const CategoryWiseNews({
    super.key,
    required this.newsController,
  });

  final NewsController newsController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      itemCount: newsController.categoryWiseNewsList.length,
      itemBuilder: ((context, index) {
        return InkWell(
          onTap: () {
            Get.to(() => ArticleScreen(
                  imageUrl:
                      newsController.categoryWiseNewsList[index].urlToImage,
                  authorImageUrl:
                      newsController.categoryWiseNewsList[index].url,
                  author: newsController.categoryWiseNewsList[index].author,
                  title: newsController.categoryWiseNewsList[index].title,
                  category: newsController.selectedCategory.value,
                  content: newsController.categoryWiseNewsList[index].content,
                  date: DateTime.parse(newsController
                          .categoryWiseNewsList[index].publishedAt ??
                      "2024-01-01T12:22:18.8405562Z"),
                ));
          },
          child: NewsListViewTile(
            imageUrl: newsController
                .categoryWiseNewsList[index].urlToImage,
            author: newsController
                .categoryWiseNewsList[index].author,
            title: newsController
                .categoryWiseNewsList[index].title,
            date: DateTime.parse(newsController
                    .categoryWiseNewsList[index]
                    .publishedAt ??
                "2024-01-01T12:22:18.8405562Z"),
          ),
        );
      }),
    );
  }
}


