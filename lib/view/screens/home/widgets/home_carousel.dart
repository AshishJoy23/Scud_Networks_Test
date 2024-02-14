import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scud_networks_test/controller/news_controler.dart';
import 'package:scud_networks_test/core/utils.dart';
import '../../../widgets/widgets.dart';
import '../../screens.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({super.key});

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  late final PageController _pageController;
  int _pageIndex = 0;
  final newsController = Get.put(NewsController());

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: 1000,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.25,
      child: PageView.builder(
        itemCount: 5,
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            _pageIndex = value;
          });
        },
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.to(() => ArticleScreen(
                    imageUrl: newsController.breakingNewsList[index].urlToImage,
                    authorImageUrl: newsController.breakingNewsList[index].url,
                    author: newsController.breakingNewsList[index].author,
                    title: newsController.breakingNewsList[index].title,
                    content: newsController.breakingNewsList[index].content,
                    date: DateTime.parse(
                        newsController.breakingNewsList[index].publishedAt ??
                            "2024-01-01T12:22:18.8405562Z"),
                  ));
            },
            child: HomeCarouselItem(
              isActive: _pageIndex == index,
              imageUrl: newsController.breakingNewsList[index].urlToImage,
              author: newsController.breakingNewsList[index].author,
              title: newsController.breakingNewsList[index].title,
              source: newsController.breakingNewsList[index].source!.name,
              date: DateTime.parse(
                  newsController.breakingNewsList[index].publishedAt ??
                      "2024-01-01T12:22:18.8405562Z"),
            ),
          );
        },
      ),
    );
  }
}

class HomeCarouselItem extends StatelessWidget {
  final bool isActive;
  final String? imageUrl;
  final String? author;
  final String? title;
  final String? source;
  final DateTime date;
  const HomeCarouselItem({
    super.key,
    required this.isActive,
    required this.imageUrl,
    required this.author,
    required this.title,
    required this.source,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FractionallySizedBox(
      widthFactor: 1.09,
      child: AnimatedScale(
        duration: const Duration(
          milliseconds: 500,
        ),
        scale: isActive ? 1.0 : 0.8,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Container(
                child: imageUrl != null
                    ? Image.network(
                        imageUrl!,
                        fit: BoxFit.cover,
                        width: double.maxFinite,
                        height: double.maxFinite,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return const LoadingIndicator(
                              color: Colors.amberAccent,
                              scale: 0.6,
                            );
                          }
                        },
                      )
                    : Image.asset(
                        'assets/image_not_found.png',
                        fit: BoxFit.cover,
                        width: double.maxFinite,
                        height: double.maxFinite,
                      ),
              ),
              Positioned(
                top: size.height * 0.01,
                left: size.height * 0.02,
                child: CustomTag(
                  backgroundColor: Colors.black,
                  children: [
                    Text(
                      source ?? "No Data",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xCC000000),
                    Color(0x99000000),
                    Color(0x00000000),
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          author ?? "No Author",
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.white.withAlpha(200),
                                  ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          AppDateFormatters.mdY(date),
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.white.withAlpha(200),
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      title ?? "No Title Available",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
