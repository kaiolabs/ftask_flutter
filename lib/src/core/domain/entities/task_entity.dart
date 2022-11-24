import 'package:task/src/core/infra/extensions/date_time_extensions.dart';

import 'entity_base.dart';

class TaskEntity extends EntityBase {
  String _description;
  String _title;
  bool _onBoard;
  bool _pending;
  int _dueDate;

  String get description => _description;

  void setDescription(String? value) => _description = value ?? '';

  String get title => _title;

  void setTitle(String? value) => _title = value ?? '';

  bool get onBoard => _onBoard;

  void setOnBoard(bool value) => _onBoard = value;

  int get dueDate => _dueDate;

  void setDueDate(int value) => _dueDate;

  bool get pending => _pending;

  void setPending(bool value) => _pending = value;

  TaskEntity({
    required String description,
    required String title,
    required bool onBoard,
    required String id,
    required int created,
    required int persisted,
    required int dueDate,
    required bool pending,
    int? deleted,
    int? updated,
  })  : _description = description,
        _dueDate = dueDate,
        _title = title,
        _onBoard = onBoard,
        _pending = pending,
        super(
          id: id,
          created: created,
          persisted: persisted,
          deleted: deleted,
          updated: updated,
        );

  factory TaskEntity.empty() {
    return TaskEntity(
      description: '',
      title: '',
      dueDate: 0,
      onBoard: false,
      id: '',
      created: 0,
      persisted: 0,
      pending: false,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'title': title,
      'dueDate': dueDate,
      'onBoard': onBoard,
      'id': id,
      'created': created,
      'persisted': persisted,
      'deleted': deleted,
      'updated': updated,
      'pending': pending,
    };
  }

  factory TaskEntity.fromJson(dynamic map) {
    return TaskEntity(
      description: map['description'] as String,
      title: map['title'] as String,
      dueDate: map['dueDate'] as int,
      onBoard: map['onBoard'] as bool,
      id: map['id'] as String,
      created: map['created'] as int,
      persisted: map['persisted'] as int,
      deleted: map['deleted'] as int?,
      updated: map['updated'] as int?,
      pending: map['pending'] as bool,
    );
  }

  factory TaskEntity.fromCloud(dynamic map) {
    return TaskEntity(
      description: map['description'] as String,
      title: map['title'] as String,
      dueDate: DateTime.parse(map['dueDate']).millisecondsSinceEpoch,
      onBoard: map['onBoard'] as bool,
      id: map['id'] as String,
      created: DateTime.parse(map['insertDate']).millisecondsSinceEpoch,
      persisted: DateTime.parse(map['persistenceDate']).millisecondsSinceEpoch,
      deleted: map['deletionDate'] == null ? null : DateTime.tryParse(map['deletionDate'])?.millisecondsSinceEpoch,
      updated: map['updateDate'] == null ? null : DateTime.tryParse(map['updateDate'])?.millisecondsSinceEpoch,
      pending: map['pending'] as bool,
    );
  }

  Map<String, dynamic> toCloud() {
    return {
      'description': description,
      'title': title,
      'dueDate': DateTime.fromMillisecondsSinceEpoch(dueDate).toCloud(),
      'onBoard': onBoard,
      'id': id,
      'insertDate': DateTime.fromMillisecondsSinceEpoch(created).toCloud(),
      'persistenceDate': DateTime.fromMillisecondsSinceEpoch(persisted).toCloud(),
      'deletionDate': deleted == null ? null : DateTime.fromMillisecondsSinceEpoch(deleted!).toCloud(),
      'updateDate': updated == null ? null : DateTime.fromMillisecondsSinceEpoch(updated!).toCloud(),
      'pending': pending,
    };
  }
}
