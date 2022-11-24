import 'package:flutter/material.dart';
import 'package:task/src/core/presenter/theme/responsive_outlet.dart';

import '../theme/size_outlet.dart';
import '../theme/spacing_mode.dart';

class CommonSpacing extends StatelessWidget {
  final double factor;
  final SpacingMode type;

  const CommonSpacing(this.type, {Key? key, this.factor = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return type == SpacingMode.height
        ? SizedBox(height: ResponsiveOutlet.height(context) * factor)
        : SizedBox(width: ResponsiveOutlet.width(context) * factor);
  }

  ///Pass a SizeOutlet spacing factor to get a responsive spacing
  factory CommonSpacing.height({double factor = SizeOutlet.spacingFactor}) =>
      CommonSpacing(SpacingMode.height, factor: factor);

  ///Pass a SizeOutlet spacing factor to get a responsive spacing
  factory CommonSpacing.width({double factor = SizeOutlet.spacingFactor}) =>
      CommonSpacing(SpacingMode.width, factor: factor);
}
