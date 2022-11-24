import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:task/src/core/presenter/theme/color_outlet.dart';

import '../theme/size_outlet.dart';

class GlassEffect extends StatelessWidget {
  final Widget child;
  final double start;
  final double end;
  const GlassEffect({
    Key? key,
    required this.child,
    this.start = SizeOutlet.glassStart,
    this.end = SizeOutlet.glassEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(start),
                Colors.white.withOpacity(end),
              ],
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(SizeOutlet.cornerRadiusDefault)),
            //border: Border.all(width: SizeOutlet.borderWidth,color: borderColor.withOpacity(SizeOutlet.borderOpacity,)),
          ),
          child: child,
        ),
      ),
    );
  }
}
