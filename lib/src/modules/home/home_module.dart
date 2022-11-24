import 'package:flutter_modular/flutter_modular.dart';
import 'package:task/src/modules/home/presenter/create_task_page/create_task_controller.dart';
import 'package:task/src/modules/home/presenter/home_page/home_controller.dart';
import 'package:task/src/modules/home/presenter/list_task_done_page/list_task_done_controller.dart';
import 'package:task/src/modules/home/presenter/list_task_page/list_task_controller.dart';
import 'package:task/src/modules/home/usecases/download_tasks_from_cloud_usecase.dart';
import 'package:task/src/modules/home/usecases/get_by_id_from_cloud_usecase.dart';
import 'package:task/src/modules/home/usecases/put_task_from_broadcast_usecase.dart';
import 'package:task/src/modules/home/usecases/set_on_board_status_usecase.dart';
import 'package:task/src/modules/home/usecases/upload_tasks_to_cloud_usecase.dart';

import 'presenter/home_page/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => DownloadTasksFromCloudUsecase(httpService: i(), repositoryFactory: i(), user: i())),
        Bind.factory((i) => UploadTasksToCloudUsecase(repositoryFactory: i(), httpService: i(), user: i())),
        Bind.factory((i) => SetOnBoardStatusUseCase(repositoryFactory: i(), httpService: i(), user: i())),
        Bind.factory((i) => GetByIdFromCloudUsecase(httpService: i(), repositoryFactory: i(), user: i())),
        Bind.factory((i) => PutTaskFromBroadcastUsecase(repositoryFactory: i())),
        Bind.singleton((i) => ListTaskController(
            repositoryFactory: i(),
            setOnBoardStatusUsecase: i(),
            uploadTasksToCloudUsecase: i(),
            downloadTasksFromCloudUsecase: i())),
        Bind.singleton((i) => ListTaskDoneController(
            repositoryFactory: i(),
            setOnBoardStatusUsecase: i(),
            uploadTasksToCloudUsecase: i(),
            downloadTasksFromCloudUsecase: i())),
        Bind.singleton((i) => CreateTaskController(taskRepository: i(), formsValidate: i())),
        Bind.singleton((i) => HomeController(
              hub: i(),
              taskPageController: i(),
              listTaskController: i(),
              listTaskDoneController: i(),
              downloadTasksFromCloudUsecase: i(),
              putTaskFromBroadcastUsecase: i(),
              uploadTasksToCloudUsecase: i(),
              broadcastController: i(),
              loggedUser: i(),
            )),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => HomePage(controller: Modular.get<HomeController>()),
        ),
      ];
}
