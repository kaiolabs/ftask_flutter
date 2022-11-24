import 'package:flutter/material.dart';

import '../../../../core/presenter/shared/glass_effect.dart';
import '../../../../core/presenter/theme/color_outlet.dart';
import '../../../../core/presenter/theme/responsive_outlet.dart';
import '../../../../core/presenter/theme/size_outlet.dart';

class ButtonCardTask extends StatelessWidget {
  final List<Widget> children;
  final VoidCallback onLongPress;

  const ButtonCardTask({
    Key? key,
    required this.children,
    required this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(SizeOutlet.cornerRadiusDefault),
      overlayColor: MaterialStateProperty.all(ColorOutlet.onSelection),
      radius: 0,
      onLongPress: onLongPress,
      child: GlassEffect(
        child: Padding(
          padding: EdgeInsets.all(
            ResponsiveOutlet.paddingDefault(context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }
}
