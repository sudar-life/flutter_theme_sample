import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFont extends StatelessWidget {
  final String text;
  final Color? color;
  final double size;
  final TextAlign? align;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final double? lineHeight;

  const AppFont(
    this.text, {
    super.key,
    this.color,
    this.align,
    this.size = 15,
    this.fontWeight,
    this.letterSpacing,
    this.lineHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: GoogleFonts.notoSans(
        color: size >= 28
            ? color ?? Theme.of(context).textTheme.titleLarge!.color!
            : color ?? Theme.of(context).textTheme.titleSmall!.color!,
        fontSize: size,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: lineHeight,
      ),
    );
  }
}
