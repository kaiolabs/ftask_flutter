import 'package:flutter/material.dart';
import 'package:task/src/modules/home/models/task_due_state.dart';

import '../../../core/presenter/theme/color_outlet.dart';

abstract class TaskDueStateColorConverter {
  static Color convert(TaskDueState state) {
    switch (state) {
      case TaskDueState.onTime:
        return ColorOutlet.taskOnTime;
      case TaskDueState.late:
        return ColorOutlet.taskLate;
      case TaskDueState.veryLate:
        return ColorOutlet.taskVeryLate;
      case TaskDueState.error:
        return ColorOutlet.taskError;
      default:
        return Colors.transparent;
    }
  }
}
