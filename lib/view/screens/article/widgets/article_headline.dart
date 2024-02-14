import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:scud_networks_test/core/utils.dart';

import '../../../widgets/widgets.dart';

class ArticleHeadline extends StatelessWidget {
  final String? category;
  final String? title;
  final DateTime date;
  const ArticleHeadline({
    super.key,
    this.category,
    this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          category != null
              ? FlipInY(
                  child: CustomTag(
                    backgroundColor: Colors.black,
                    children: [
                      Text(
                        category!,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              : const SizedBox(
                  height: 15,
                ),
          const SizedBox(height: 10),
          FadeInLeft(
            child: Text(
              title ?? 'No Title Available',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.25,
                  ),
            ),
          ),
          const SizedBox(height: 10),
          FadeInRight(
            child: Text(
              AppDateFormatters.mdY(date),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
