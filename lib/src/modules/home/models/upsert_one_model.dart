import '../../../core/domain/entities/task_entity.dart';

class UpsertOneModel {
  final String errorMessage;
  final TaskEntity entity;

  UpsertOneModel({
    required this.errorMessage,
    required this.entity,
  });

  factory UpsertOneModel.fromMessage(String errorMessage, TaskEntity entity) {
    return UpsertOneModel(
      errorMessage: errorMessage,
      entity: entity,
    );
  }
}
