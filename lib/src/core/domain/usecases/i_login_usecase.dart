import '../../infra/application/login_request.dart';
import '../entities/user_entity.dart';

abstract class ILoginUsecase {
  Future<UserEntity?> call(LoginRequest loginRequest);
}
