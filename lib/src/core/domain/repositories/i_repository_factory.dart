import '../entities/entity_base.dart';
import 'i_repository.dart';

abstract class IRepositoryFactory {
  Future<IRepository<T>> get<T extends EntityBase>();
}
