import '../../domain/entities/entity_base.dart';
import '../../domain/repositories/i_repository.dart';
import '../../domain/repositories/i_repository_factory.dart';
import '../../domain/services/i_object_id_service.dart';
import '../mappers/entity_mapper_factory.dart';
import 'hive_repository.dart';

class HiveRepositoryFactory extends IRepositoryFactory {
  final IObjectIdService objectId;
  final String path;

  HiveRepositoryFactory({required this.objectId, required this.path});

  @override
  Future<IRepository<T>> get<T extends EntityBase>() async {
    EntityMapperFactory mapperFactory = EntityMapperFactory();
    HiveRepository<T> repository = HiveRepository<T>(
      mapper: mapperFactory.get<T>(),
      objectId: objectId,
    );
    await repository.init(path);
    return repository;
  }
}
