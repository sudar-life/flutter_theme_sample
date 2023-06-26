import 'package:flutter/material.dart';
import 'package:flutter_theme_sample/src/components/app_font.dart';

class Btn extends StatelessWidget {
  final String text;
  final Function() onTap;
  final EdgeInsets padding;
  final Color? color;
  const Btn({
    super.key,
    required this.text,
    required this.onTap,
    this.color,
    this.padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: Container(
          padding: padding,
          color: color ??
              Theme.of(context).buttonTheme.colorScheme!.primaryContainer,
          child: Center(
            child: AppFont(
              text,
              size: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
