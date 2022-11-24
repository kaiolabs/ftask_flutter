import 'package:flutter/material.dart';
import 'package:task/src/core/presenter/theme/responsive_outlet.dart';

import '../../../../core/presenter/shared/common_loading.dart';
import '../../../../core/presenter/shared/common_spacing.dart';
import '../../../../core/presenter/shared/common_text.dart';
import '../../../../core/presenter/theme/color_outlet.dart';
import '../../../../core/presenter/theme/size_outlet.dart';
import '../../models/task_tile_model.dart';

class RowTitle extends StatelessWidget {
  final TaskTileModel taskItem;

  const RowTitle({
    Key? key,
    required this.taskItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CommonText(
            text: taskItem.title,
            fontSize: ResponsiveOutlet.textLarge(context),
            fontColor: ColorOutlet.secondaryLight,
          ),
        ),
        CommonSpacing.width(),
        taskItem.pending
            ? CommonLoading.responsive(SizeOutlet.loadingForTaskTile, color: ColorOutlet.secondary)
            : SizedBox(
                width: ResponsiveOutlet.loadingResponsiveSize(context, SizeOutlet.loadingForTaskTile),
                height: ResponsiveOutlet.loadingResponsiveSize(context, SizeOutlet.loadingForTaskTile),
              ),
      ],
    );
  }
}
