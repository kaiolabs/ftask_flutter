abstract class BroadcastMessage {
  static BroadcastMessage fromMessage(dynamic message) {
    if (message[0] == 'uploadAll') return UploadAllTasksBroadcastMessage.fromMessage(message);
    if (message[0] == 'upsertOne') return PutTaskBroadcastMessage.fromMessage(message);
    if (message[0] == 'getById') return GetByIdBroadcastMessage.fromMessage(message);
    if (message[0] == 'getAll') return GetAllTasksBroadcastMessage();
    throw Exception('adapter not found');
  }
}

class GetAllTasksBroadcastMessage extends BroadcastMessage {
  GetAllTasksBroadcastMessage();
}

class PutTaskBroadcastMessage extends BroadcastMessage {
  final String userId;
  final Map entity;
  final String errorMessage;

  PutTaskBroadcastMessage({
    required this.userId,
    required this.entity,
    required this.errorMessage,
  });

  factory PutTaskBroadcastMessage.empty() {
    return PutTaskBroadcastMessage(
      userId: '',
      entity: {},
      errorMessage: '',
    );
  }

  factory PutTaskBroadcastMessage.fromMessage(dynamic message) {
    return PutTaskBroadcastMessage(
      userId: message[1]['userId'],
      entity: message[1]['entity'],
      errorMessage: message[1]['erroMessage'] ?? '',
    );
  }
}

class GetByIdBroadcastMessage extends BroadcastMessage {
  final String id;

  GetByIdBroadcastMessage({required this.id});

  factory GetByIdBroadcastMessage.empty() {
    return GetByIdBroadcastMessage(id: '');
  }

  factory GetByIdBroadcastMessage.fromMessage(dynamic message) {
    return GetByIdBroadcastMessage(id: message[1]);
  }
}

class UploadAllTasksBroadcastMessage extends BroadcastMessage {
  final String userId;
  final String errorMessage;

  UploadAllTasksBroadcastMessage({required this.userId, required this.errorMessage});

  factory UploadAllTasksBroadcastMessage.empty() {
    return UploadAllTasksBroadcastMessage(
      userId: '',
      errorMessage: '',
    );
  }

  factory UploadAllTasksBroadcastMessage.fromMessage(dynamic message) {
    return UploadAllTasksBroadcastMessage(
      userId: message[1]['userId'],
      errorMessage: message[1]['errorMessage'],
    );
  }
}
