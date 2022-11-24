import 'package:flutter_test/flutter_test.dart';
import 'package:task/src/core/domain/entities/task_entity.dart';
import 'package:task/src/core/infra/extensions/date_time_extensions.dart';

void main() {
  //teste create a new instance of TaskEntity with all parameters
  test('create a new instance of TaskEntity with all parameters', () {
    TaskEntity taskEntity = TaskEntity(
      description: 'description',
      title: 'title',
      onBoard: true,
      id: 'id',
      created: 0,
      persisted: 0,
      dueDate: 0,
      pending: true,
    );
    expect(taskEntity.description, 'description');
    expect(taskEntity.title, 'title');
    expect(taskEntity.onBoard, true);
    expect(taskEntity.id, 'id');
    expect(taskEntity.created, 0);
    expect(taskEntity.persisted, 0);
    expect(taskEntity.deleted, null);
    expect(taskEntity.updated, null);
    expect(taskEntity.dueDate, 0);
    expect(taskEntity.pending, true);
  });

  //test create a new instance of TaskEntity.empty
  test('create a new instance of TaskEntity.empty', () {
    TaskEntity taskEntity = TaskEntity.empty();
    expect(taskEntity.description, '');
    expect(taskEntity.title, '');
    expect(taskEntity.onBoard, false);
    expect(taskEntity.dueDate, 0);
    expect(taskEntity.pending, false);
  });

  //test setDescription
  test('setDescription', () {
    TaskEntity taskEntity = TaskEntity.empty();
    taskEntity.setDescription('description');
    expect(taskEntity.description, 'description');
  });

  //test setTitle
  test('setTitle', () {
    TaskEntity taskEntity = TaskEntity.empty();
    taskEntity.setTitle('title');
    expect(taskEntity.title, 'title');
  });

  //test setOnBoard
  test('setOnBoard', () {
    TaskEntity taskEntity = TaskEntity.empty();
    taskEntity.setOnBoard(true);
    expect(taskEntity.onBoard, true);
  });

  //test setDueDate
  test('setDueDate', () {
    TaskEntity taskEntity = TaskEntity.empty();
    taskEntity.setDueDate(0);
    expect(taskEntity.dueDate, 0);
  });

  //test setPending
  test('setPending', () {
    TaskEntity taskEntity = TaskEntity.empty();
    taskEntity.setPending(true);
    expect(taskEntity.pending, true);
  });

  //test setId
  test('setId', () {
    TaskEntity taskEntity = TaskEntity.empty();
    taskEntity.setId('id');
    expect(taskEntity.id, 'id');
  });

  //test setCreated
  test('setCreated', () {
    TaskEntity taskEntity = TaskEntity.empty();
    taskEntity.setCreated(0);
    expect(taskEntity.created, 0);
  });

  //test setPersisted
  test('setPersisted', () {
    TaskEntity taskEntity = TaskEntity.empty();
    taskEntity.setPersisted(0);
    expect(taskEntity.persisted, 0);
  });

  //test setDeleted
  test('setDeleted', () {
    TaskEntity taskEntity = TaskEntity.empty();
    taskEntity.setDeleted(0);
    expect(taskEntity.deleted, 0);
  });

  //test setUpdated
  test('setUpdated', () {
    TaskEntity taskEntity = TaskEntity.empty();
    taskEntity.setUpdated(0);
    expect(taskEntity.updated, 0);
  });

  test('Taskentity from empty to json', () {
    TaskEntity taskEntity = TaskEntity.empty();
    expect(taskEntity.toJson(), {
      'description': '',
      'title': '',
      'dueDate': 0,
      'onBoard': false,
      'id': '',
      'created': 0,
      'persisted': 0,
      'deleted': null,
      'updated': null,
      'pending': false
    });
  });

  test('TaskEntity from json to empty', () {
    TaskEntity taskEntity = TaskEntity.fromJson({
      'description': '',
      'title': '',
      'onBoard': false,
      'dueDate': 0,
      'pending': false,
      'id': '',
      'created': 0,
      'persisted': 0,
      'deleted': null,
      'updated': null,
    });
    expect(taskEntity.description, '');
    expect(taskEntity.title, '');
    expect(taskEntity.onBoard, false);
    expect(taskEntity.dueDate, 0);
    expect(taskEntity.pending, false);
    expect(taskEntity.id, '');
    expect(taskEntity.created, 0);
    expect(taskEntity.persisted, 0);
    expect(taskEntity.deleted, null);
    expect(taskEntity.updated, null);
  });

  test('TaskEntity toCloud fromEmpty', () {
    TaskEntity taskEntity = TaskEntity.empty();
    expect(taskEntity.toCloud(), {
      'description': '',
      'title': '',
      'dueDate': DateTime.fromMillisecondsSinceEpoch(0).toCloud(),
      'onBoard': false,
      'id': '',
      'insertDate': DateTime.fromMillisecondsSinceEpoch(0).toCloud(),
      'persistenceDate': DateTime.fromMillisecondsSinceEpoch(0).toCloud(),
      'deletionDate': null,
      'updateDate': null,
      'pending': false,
    });
  });

  test('TaskEntity fromCloud to Entity', () {
    TaskEntity taskEntity = TaskEntity.fromCloud({
      'description': '',
      'title': '',
      'dueDate': DateTime.fromMillisecondsSinceEpoch(0).toCloud(),
      'onBoard': false,
      'id': '',
      'insertDate': DateTime.fromMillisecondsSinceEpoch(0).toCloud(),
      'persistenceDate': DateTime.fromMillisecondsSinceEpoch(0).toCloud(),
      'deletionDate': null,
      'updateDate': null,
      'pending': false,
    });
    expect(taskEntity.description, '');
    expect(taskEntity.title, '');
    expect(taskEntity.onBoard, false);
    expect(taskEntity.dueDate, 0);
    expect(taskEntity.pending, false);
    expect(taskEntity.id, '');
    expect(taskEntity.created, 0);
    expect(taskEntity.persisted, 0);
    expect(taskEntity.deleted, null);
    expect(taskEntity.updated, null);
  });
}
