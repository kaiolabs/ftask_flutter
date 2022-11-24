import 'package:flutter/material.dart';
import 'package:task/src/core/presenter/theme/responsive_outlet.dart';

import '../../../../core/presenter/shared/common_spacing.dart';
import '../../../../core/presenter/shared/common_text.dart';
import '../../../../core/presenter/theme/color_outlet.dart';
import '../../../../core/presenter/theme/size_outlet.dart';

class RowDueDate extends StatelessWidget {
  final String text;

  const RowDueDate({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.more_time_outlined,
          color: ColorOutlet.secondary,
          size: ResponsiveOutlet.textMedium(context),
        ),
        CommonSpacing.width(factor: SizeOutlet.spacingFactor2),
        CommonText(
          fontSize: ResponsiveOutlet.textDefault(context),
          text: text,
        ),
      ],
    );
  }
}
