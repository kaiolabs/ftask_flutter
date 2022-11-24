import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/create_account_page/create_account_controller.dart';
import 'presenter/create_account_page/create_account_page.dart';
import 'presenter/login_page/login_controller.dart';
import 'presenter/login_page/login_page.dart';
import 'usecase/create_account_use_case.dart';
import 'usecase/login_usecase_impl.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => CreateAccountUsecase(
              httpService: i(),
            )),
        Bind.lazySingleton((i) => LoginUseCaseImpl(
              httpService: i(),
              repositoryFactory: i(),
              user: i(),
            )),
        Bind.factory((i) => LoginController(
              formsValidate: i(),
              repositoryFactory: i(),
              httpService: i(),
              loginUseCase: i(),
            )),
        Bind.factory((i) => CreateAccountController(
              repositoryFactory: i(),
              formsValidate: i(),
              httpService: i(),
              createAccountUseCase: i(),
            ))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => LoginPage(controller: Modular.get<LoginController>()),
          transition: TransitionType.rightToLeft,
        ),
        ChildRoute(
          '/createaccount',
          child: (context, args) => CreateAccountPage(controller: Modular.get<CreateAccountController>()),
          transition: TransitionType.rightToLeft,
        ),
      ];
}
