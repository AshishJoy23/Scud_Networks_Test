import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/article_model.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/image_container.dart';
import 'article_screen.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  static const routeName = '/discover';
  @override
  Widget build(BuildContext context) {
    final articles = Article.articles;
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(index: 1),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            FadeInLeft(
              delay: const Duration(milliseconds: 500),
              child: Text(
                'Discover',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(height: 5),
            FadeInRight(
              child: Text(
                'What\'s going on!',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black45, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 5),
            FadeInUp(
              delay: const Duration(milliseconds: 600),
              child: ListView.builder(
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                itemCount: articles.length,
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        ArticleScreen.routeName,
                        arguments: articles[index],
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: MediaQuery.of(context).size.width * 0.22,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(
                                articles[index].imageUrl,
                                width:
                                    MediaQuery.of(context).size.width * 0.3,
                                height:
                                    MediaQuery.of(context).size.width * 0.2,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  articles[index].title,
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.schedule,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      '${DateTime.now().difference(articles[index].createdAt).inHours} hours ago',
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    const SizedBox(width: 20),
                                    const Icon(
                                      Icons.visibility,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      '${articles[index].views} views',
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

