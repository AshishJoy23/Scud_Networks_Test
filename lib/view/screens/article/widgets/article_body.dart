import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';

class ArticleBody extends StatelessWidget {
  final String? imageUrl;
  final String? authorImageUrl;
  final String? author;
  final String? title;
  final String? content;
  const ArticleBody({
    super.key,
    this.imageUrl,
    this.authorImageUrl,
    this.author,
    this.title,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FadeInUp(
      child: Container(
        width: double.infinity,
        height: size.height*0.6,
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              children: [
                CustomTag(
                  backgroundColor: Colors.black,
                  children: [
                    authorImageUrl != null
                        ? CircleAvatar(
                            radius: 10,
                            backgroundImage: NetworkImage(
                              authorImageUrl!,
                            ),
                          )
                        : const CircleAvatar(
                            radius: 10,
                            backgroundImage: AssetImage(
                              'assets/image_not_found.png',
                            ),
                          ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: size.width*0.3,
                      child: Text(
                        author ?? 'Unknown',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              title ?? 'No Title Available',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              content ?? 'Content not Found',
              style:
                  Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.5),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
