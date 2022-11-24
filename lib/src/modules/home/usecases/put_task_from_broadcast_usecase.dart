import '../../../core/domain/entities/task_entity.dart';
import '../../../core/domain/repositories/i_repository_factory.dart';
import '../../../core/domain/usecases/i_put_task_from_broadcast_usecase.dart';

class PutTaskFromBroadcastUsecase implements IPutTaskFromBroadcastUsecase {
  final IRepositoryFactory repositoryFactory;

  PutTaskFromBroadcastUsecase({required this.repositoryFactory});

  @override
  Future<bool> call(TaskEntity entity) async {
    var repository = await repositoryFactory.get<TaskEntity>();
    await repository.put(entity.id, entity);
    return true;
  }
}
