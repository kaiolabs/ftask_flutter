import 'package:flutter_modular/flutter_modular.dart';
import 'package:task/splash_page.dart';
import 'package:task/src/core/infra/repositories/hive_repository_factory.dart';

import 'src/core/domain/entities/user_entity.dart';
import 'src/core/infra/services/broadcast_controller.dart';
import 'src/core/infra/services/http_service.dart';
import 'src/core/infra/services/object_id.dart';
import 'src/core/infra/services/signalr_helper.dart';
import 'src/core/presenter/pages/wildcard_page.dart';
import 'src/core/presenter/service/forms_validade_impl.dart';
import 'src/modules/auth/auth_module.dart';
import 'src/modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => UserEntity.empty()),
        Bind.lazySingleton((i) => ObjectId()),
        Bind.factory((i) => HiveRepositoryFactory(objectId: i(), path: 'path')),
        Bind.factory((i) => FormsValidate()),
        Bind.lazySingleton((i) => HttpService()),
        Bind.singleton((i) => BroadcastController()),
        Bind.singleton((i) => SignalRHelper(broadcastController: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => SplashPage(
                  signalRHelper: Modular.get<SignalRHelper>(),
                  repositoryFactory: Modular.get<HiveRepositoryFactory>(),
                )),
        ModuleRoute(
          '/src',
          module: AuthModule(),
          transition: TransitionType.size,
        ),
        ModuleRoute(
          '/home',
          module: HomeModule(),
          transition: TransitionType.downToUp,
        ),
        WildcardRoute(
          child: (_, __) => const WildcardPage(),
        ),
      ];
}
