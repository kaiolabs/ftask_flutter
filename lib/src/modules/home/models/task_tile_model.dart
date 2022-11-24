import 'package:intl/intl.dart';
import 'package:task/src/modules/home/models/task_due_state.dart';
import 'package:task/src/modules/home/models/task_due_time.dart';

import '../../../core/domain/entities/task_entity.dart';
import '../../../core/infra/application/logger.dart';
import '../../../core/presenter/theme/lexicon.dart';

class TaskTileModel {
  final String id;
  final String title;
  final String dueDateString;
  final String description;
  final bool onBoard;
  TaskDueState dueState;
  String timeElapsed;
  final DateTime? _updated;
  final int _dueDate;
  final bool pending;
  String? errorMessage;
  double progress;

  TaskTileModel({
    required this.id,
    required this.title,
    required this.dueDateString,
    required this.description,
    required this.dueState,
    required this.timeElapsed,
    required this.onBoard,
    required this.pending,
    required this.progress,
    required int dueDate,
    DateTime? updated,
  })  : _updated = updated,
        _dueDate = dueDate;

  refresh() {
    try {
      if (_dueDate == 0) {
        timeElapsed = Lexicon.noDueDate;
        dueState = TaskDueState.none;
        return;
      }

      final dueDateParsed = DateTime.fromMillisecondsSinceEpoch(_dueDate);
      final now = DateTime.now();
      Duration tElapsed = now.difference(dueDateParsed);
      dueState = tElapsed.inSeconds > TaskDueTime.late && tElapsed.inSeconds < TaskDueTime.veryLate
          ? TaskDueState.late
          : tElapsed.inSeconds > TaskDueTime.veryLate
              ? TaskDueState.veryLate
              : TaskDueState.onTime;

      int progressHelper = tElapsed.inSeconds > 1 ? tElapsed.inSeconds : 1;
      progress = tElapsed.inSeconds < 0 ? 0.0 : tElapsed.inSeconds % 60;
      tElapsed = tElapsed.inSeconds < 0 ? tElapsed * -1 : tElapsed;
      timeElapsed = tElapsed.toString().substring(0, 7);
    } catch (e) {
      fLog.e(e);
      timeElapsed = Lexicon.anErrorOccurred;
      dueState = TaskDueState.error;
    }
  }

  factory TaskTileModel.fromEntity(TaskEntity entity) {
    try {
      if (entity.dueDate == 0) {
        return TaskTileModel(
          id: entity.id,
          title: entity.title,
          dueDateString: Lexicon.dueDate,
          description: entity.description,
          dueState: TaskDueState.none,
          timeElapsed: Lexicon.noDueDate,
          onBoard: entity.onBoard,
          dueDate: entity.dueDate,
          pending: entity.pending,
          progress: 0,
        );
      }

      final dueDateParsed = DateTime.fromMillisecondsSinceEpoch(entity.dueDate);
      final now = DateTime.now();
      Duration tElapsed = now.difference(dueDateParsed);
      final dueState = tElapsed.inSeconds > TaskDueTime.late && tElapsed.inSeconds < TaskDueTime.veryLate
          ? TaskDueState.late
          : tElapsed.inSeconds > TaskDueTime.veryLate
              ? TaskDueState.veryLate
              : TaskDueState.onTime;

      double progress = tElapsed.inSeconds < 0 ? 0.0 : tElapsed.inSeconds / TaskDueTime.veryLate;
      tElapsed = tElapsed.inSeconds < 0 ? tElapsed * -1 : tElapsed;
      final timeElapsed = tElapsed.toString().substring(0, 7);
      final dueDateDate = DateFormat('dd/MM/yyyy').format(dueDateParsed);
      final dueDateHour = DateFormat('HH:mm').format(dueDateParsed);

      return TaskTileModel(
        id: entity.id,
        title: entity.title,
        dueDateString: '$dueDateDate\n$dueDateHour',
        description: entity.description,
        dueState: dueState,
        timeElapsed: timeElapsed,
        onBoard: entity.onBoard,
        dueDate: entity.dueDate,
        pending: entity.pending,
        progress: progress,
      );
    } catch (e) {
      fLog.e(e);
      return TaskTileModel(
        id: entity.id,
        title: entity.title,
        description: entity.description,
        dueDateString: '???',
        dueState: TaskDueState.error,
        onBoard: entity.onBoard,
        timeElapsed: Lexicon.anErrorOccurred,
        dueDate: 0,
        pending: entity.pending,
        progress: 0,
      );
    }
  }
}
