abstract class EntityBase {
  String _id;
  int _created;
  int _persisted;
  int? _deleted;
  int? _updated;

  String get id => _id;

  void setId(String value) => _id = value;

  int get created => _created;

  void setCreated(int value) => _created = value;

  int get persisted => _persisted;

  void setPersisted(int value) => _persisted = value;

  int? get deleted => _deleted;

  void setDeleted(int? value) => _deleted = value;

  int? get updated => _updated;

  void setUpdated(int? value) => _updated = value;

  EntityBase({
    required String id,
    required int created,
    required int persisted,
    int? deleted,
    int? updated,
  })  : _id = id,
        _created = created,
        _persisted = persisted,
        _deleted = deleted,
        _updated = updated;

  Map<String, dynamic> toJson();
}
