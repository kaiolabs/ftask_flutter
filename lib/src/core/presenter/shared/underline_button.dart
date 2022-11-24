import 'package:flutter/material.dart';
import 'package:task/src/core/presenter/theme/responsive_outlet.dart';

import '../theme/color_outlet.dart';

class UnderLineButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String description;

  const UnderLineButton({Key? key, required this.onPressed, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateColor.resolveWith((states) => ColorOutlet.secondary),
      ),
      onPressed: onPressed,
      child: Text(
        description,
        style: TextStyle(
          color: ColorOutlet.secondary,
          decoration: TextDecoration.underline,
          fontSize: ResponsiveOutlet.textDefault(context),
        ),
      ),
    );
  }
}
