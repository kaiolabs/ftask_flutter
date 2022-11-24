import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../theme/color_outlet.dart';
import '../theme/responsive_outlet.dart';

class CommonLoading extends StatelessWidget {
  final int size;
  final Color? color;

  const CommonLoading(this.size, {Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.dotsTriangle(
      color: color ?? ColorOutlet.secondary,
      size: ResponsiveOutlet.loadingResponsiveSize(context, size),
    );
  }

  factory CommonLoading.responsive(int size, {Color? color}) => CommonLoading(size, color: color);
}
