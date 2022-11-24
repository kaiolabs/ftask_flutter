import 'package:flutter/material.dart';
import 'package:task/src/core/presenter/theme/responsive_outlet.dart';
import 'package:task/src/core/presenter/theme/size_outlet.dart';

import '../theme/color_outlet.dart';
import 'glass_effect.dart';

class CommonButton extends StatelessWidget {
  final String description;

  const CommonButton({Key? key, required this.onPressed, required this.description}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.all(
            ResponsiveOutlet.paddingSmall(context),
          ),
        ),
        overlayColor: MaterialStateColor.resolveWith(
          (states) => ColorOutlet.secondary,
        ),
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => ColorOutlet.primary,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeOutlet.cornerRadiusDefault),
            side: const BorderSide(
              color: ColorOutlet.secondary,
            ),
          ),
        ),
      ),
      child: Text(
        description,
        style: TextStyle(
          color: ColorOutlet.secondary,
          fontSize: ResponsiveOutlet.textMedium(context),
        ),
      ),
    );
  }
}
