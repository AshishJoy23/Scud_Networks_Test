import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scud_networks_test/controller/news_controler.dart';
import 'package:scud_networks_test/core/utils.dart';
import 'package:scud_networks_test/view/widgets/widgets.dart';

class NewsListViewTile extends StatelessWidget {
  final String? imageUrl;
  final String? author;
  final String? title;
  final DateTime date;
  const NewsListViewTile({
    super.key,
    this.imageUrl,
    this.author,
    this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: size.width * 0.25,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: imageUrl != null
                  ? Image.network(
                      imageUrl!,
                      fit: BoxFit.cover,
                      width: size.width * 0.26,
                      height: size.width * 0.25,
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
                      width: size.width * 0.26,
                      height: size.width * 0.25,
                    ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  author ?? "No Author",
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(fontSize: 12),
                ),
                Text(
                  title ?? "No Title Available",
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                      AppDateFormatters.mdY(date),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
