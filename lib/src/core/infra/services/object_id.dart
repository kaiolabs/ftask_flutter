import 'package:objectid/objectid.dart' as oi;

import '../../domain/services/i_object_id_service.dart';

class ObjectId implements IObjectIdService {
  @override
  String generate() => oi.ObjectId().hexString;
}
