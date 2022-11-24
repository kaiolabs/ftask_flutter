import 'package:flutter/material.dart';
import 'package:task/src/core/presenter/theme/color_outlet.dart';
import 'package:task/src/core/presenter/theme/font_family_outlet.dart';
import 'package:task/src/core/presenter/theme/responsive_outlet.dart';

import '../../models/task_tile_model.dart';

class TextTaskRequestError extends StatelessWidget {
  final TaskTileModel taskItem;

  const TextTaskRequestError({Key? key, required this.taskItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return taskItem.errorMessage != null
        ? Text(
            taskItem.errorMessage ?? '',
            style: TextStyle(
              fontFamily: FontFamilyOutlet.sensation,
              color: ColorOutlet.accent,
              fontSize: ResponsiveOutlet.textDefault(context),
            ),
          )
        : const SizedBox();
  }
}
