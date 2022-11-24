import 'package:flutter/material.dart';

import '../../../../core/presenter/shared/common_spacing.dart';
import '../../../../core/presenter/shared/common_text.dart';
import '../../../../core/presenter/theme/responsive_outlet.dart';
import '../../../../core/presenter/theme/size_outlet.dart';
import '../../models/task_due_state.dart';
import '../task_due_state_color_converter.dart';

class RowTime extends StatelessWidget {
  final String text;
  final TaskDueState dueState;

  const RowTime({
    Key? key,
    required this.text,
    required this.dueState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.timer_off_outlined,
          size: ResponsiveOutlet.textMedium(context),
          color: TaskDueStateColorConverter.convert(dueState),
        ),
        CommonSpacing.width(factor: SizeOutlet.spacingFactor2),
        CommonText(
          fontColor: TaskDueStateColorConverter.convert(dueState),
          fontSize: ResponsiveOutlet.textDefault(context),
          text: text,
        ),
      ],
    );
  }
}
