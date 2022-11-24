import 'package:flutter_test/flutter_test.dart';
import 'package:task/src/core/domain/entities/entity_base.dart';

class EntityBaseMock extends EntityBase {
  EntityBaseMock({required String id}) : super(id: id, created: 0, persisted: 0);

  @override
  Map<String, dynamic> toJson() {
    //implent this toJson method
    return {};
  }
}

void main() {
  //test EntityBaseMock
  test('EntityBaseMock', () {
    final entityBaseMock = EntityBaseMock(id: 'id');
    expect(entityBaseMock.id, 'id');
  });

  //test EntityBaseMock with all parameters
  test('EntityBaseMock with all parameters', () {
    final entityBaseMock = EntityBaseMock(id: 'id');
    expect(entityBaseMock.id, 'id');
    expect(entityBaseMock.created, 0);
    expect(entityBaseMock.persisted, 0);
    expect(entityBaseMock.deleted, null);
    expect(entityBaseMock.updated, null);
  });

  //test toJson
  test('toJson', () {
    final entityBaseMock = EntityBaseMock(id: 'id');
    expect(entityBaseMock.toJson(), {});
  });
}
