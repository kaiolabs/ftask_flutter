import '../../infra/application/create_account_request.dart';

abstract class ICreateAccountUsecase {
  Future<bool> call(CreateAccountRequest newAccount);
}
