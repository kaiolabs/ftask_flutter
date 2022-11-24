import 'package:flutter/material.dart';
import 'package:task/src/modules/home/models/task_tile_model.dart';
import 'package:task/src/modules/home/shared/widgets/text_task_request_error.dart';

import '../../../../../core/presenter/shared/common_spacing.dart';
import '../../../../../core/presenter/theme/size_outlet.dart';
import '../../../shared/task_due_state_color_converter.dart';
import '../../../shared/widgets/button_card_task.dart';
import '../../../shared/widgets/row_due_date.dart';
import '../../../shared/widgets/row_time.dart';
import '../../../shared/widgets/row_title.dart';

class TaskDoneTile extends StatelessWidget {
  final TaskTileModel taskItem;
  final VoidCallback onLongPress;

  const TaskDoneTile({
    Key? key,
    required this.taskItem,
    required this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonCardTask(
      onLongPress: onLongPress,
      children: [
        RowTitle(taskItem: taskItem),
        CommonSpacing.height(factor: SizeOutlet.spacingFactor),
        RowDueDate(text: taskItem.dueDateString),
        CommonSpacing.height(factor: SizeOutlet.spacingFactor),
        RowTime(text: taskItem.timeElapsed, dueState: taskItem.dueState),
        CommonSpacing.height(factor: SizeOutlet.spacingFactor),
        TextTaskRequestError(taskItem: taskItem)
      ],
    );
  }
}
