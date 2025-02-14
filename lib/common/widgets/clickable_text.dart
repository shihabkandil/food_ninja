import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'gradient_text.dart';

class ClickableText extends StatelessWidget {
  const ClickableText({
    Key? key,
    required this.text,
    this.textStyle,
    required this.onTap,
    this.alignment = Alignment.center,
  }) : super(key: key);
  final String text;
  final TextStyle? textStyle;
  final void Function() onTap;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: InkWell(
        onTap: onTap,
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        child: GradientText(
          text: text,
          style: textStyle ??
               const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.lightGreen,
                decoration: TextDecoration.underline,
              ),
          gradient: AppColors.greenGradient,
        ),
      ),
    );
  }
}
