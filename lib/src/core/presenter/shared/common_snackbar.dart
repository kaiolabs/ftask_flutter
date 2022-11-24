import 'package:flutter/material.dart';
import 'package:task/src/core/presenter/theme/color_outlet.dart';

class CommonSnackBar extends SnackBar {
  const CommonSnackBar({super.key, required super.content, required super.backgroundColor});

  @override
  Duration get duration => const Duration(milliseconds: 1500);

  factory CommonSnackBar.fromSuccess(String content, {Key? key}) => CommonSnackBar(
        key: key,
        content: Text(content),
        backgroundColor: ColorOutlet.secondary,
      );

  factory CommonSnackBar.fromError(String content, {Key? key, required}) => CommonSnackBar(
        key: key,
        content: Text(content),
        backgroundColor: ColorOutlet.accent,
      );
}
