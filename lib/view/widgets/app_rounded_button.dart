import 'package:flutter/material.dart';

class AppRoundedButton extends StatelessWidget {
  final Function()? onTap;
  final IconData iconData;
  final Color color;
  const AppRoundedButton({
    super.key,
    required this.onTap,
    required this.iconData,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Material(
      color: color.withAlpha(30),
      borderRadius: BorderRadius.circular((size.width * 0.1)),
      child: InkWell(
        borderRadius: BorderRadius.circular((size.width * 0.1)),
        onTap: onTap,
        child: SizedBox(
          width: size.width * 0.1,
          height: size.width * 0.1,
          child: Icon(
            iconData,
            size: 20,
            color: color,
          ),
        ),
      ),
    );
  }
}
