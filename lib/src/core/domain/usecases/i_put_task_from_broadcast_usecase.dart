import 'package:task/src/core/domain/entities/task_entity.dart';

abstract class IPutTaskFromBroadcastUsecase {
  Future<bool> call(TaskEntity entity);
}
