import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:scud_networks_test/core/utils.dart';
import '../../widgets/app_rounded_button.dart';
import '../../widgets/custom_tag.dart';
import '../screens.dart';

class ArticleScreen extends StatelessWidget {
  final String? imageUrl;
  final String? authorImageUrl;
  final String? author;
  final String? title;
  final String? category;
  final String? content;
  final DateTime date;
  const ArticleScreen({
    super.key,
    this.imageUrl,
    this.authorImageUrl,
    this.author,
    this.title,
    this.category,
    this.content,
    required this.date,
  });
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      decoration: imageUrl != null
          ? BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  imageUrl!,
                ),
                fit: BoxFit.cover,
              ),
            )
          : const BoxDecoration(
              color: Colors.black54,
            ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: BounceInDown(
            child: Padding(
              padding: EdgeInsets.all(size.width * 0.02),
              child: AppRoundedButton(
                onTap: () {
                  Navigator.pop(context);
                },
                iconData: Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: ListView(
          children: [
            ArticleHeadline(
              title: title,
              category: category,
              date: date,
            ),
            ArticleBody(
              imageUrl: imageUrl,
              authorImageUrl: authorImageUrl,
              author: author,
              title: title,
              content: content,
            )
          ],
        ),
      ),
    );
  }
}


