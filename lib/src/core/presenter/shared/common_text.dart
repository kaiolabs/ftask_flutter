import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:task/src/core/presenter/theme/size_outlet.dart';

import '../theme/color_outlet.dart';

class CommonText extends StatelessWidget {
  final String text;
  final Color? fontColor;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? fontSize;
  final int flex;

  const CommonText({
    Key? key,
    required this.text,
    this.fontColor,
    this.fontWeight,
    this.fontStyle,
    this.fontSize,
    this.flex = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxLines: 2,
      maxFontSize: SizeOutlet.textSizeLarge,
      minFontSize: SizeOutlet.textSizeBase,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: fontColor ?? ColorOutlet.secondary,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        fontSize: fontSize,
      ),
    );
  }
}
