import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:task/src/core/domain/entities/entity_base.dart';
import 'package:task/src/core/domain/repositories/i_repository.dart';

class HiveRepositoryMock<T extends EntityBase> extends Mock implements IRepository<T> {}

void main() {}
