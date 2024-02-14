import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class DiscoverHeadline extends StatelessWidget {
  const DiscoverHeadline({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: size.height * 0.1,
        ),
        FadeInLeft(
          delay: const Duration(milliseconds: 500),
          child: Text(
            'Discover',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: size.width * 0.01,
        ),
        FadeInRight(
          child: Text(
            'Lets know what\'s going on!',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.black45, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
