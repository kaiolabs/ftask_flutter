import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/domain/repositories/i_repository_factory.dart';
import '../../../../core/domain/usecases/i_download_tasks_from_cloud_usecase.dart';
import '../../../../core/domain/usecases/i_set_on_board_status_usecase.dart';
import '../../../../core/domain/usecases/i_upload_tasks_to_cloud_usecase.dart';
import '../../../../core/infra/application/app_settings.dart';
import '../../shared/list_task_base_controller.dart';
import 'widgets/task_tile.dart';

class ListTaskController extends ListTaskBaseController {
  final ChangeNotifier timeElapsedChangeNotifier = ChangeNotifier();
  Timer? timer;

  ListTaskController({
    required IRepositoryFactory repositoryFactory,
    required ISetOnBoardStatusUsecase setOnBoardStatusUsecase,
    required IUploadTasksToCloudUsecase uploadTasksToCloudUsecase,
    required IDownloadTasksFromCloudUsecase downloadTasksFromCloudUsecase,
  }) : super(
          repositoryFactory: repositoryFactory,
          setOnBoardStatusUsecase: setOnBoardStatusUsecase,
          uploadTasksToCloudUsecase: uploadTasksToCloudUsecase,
          downloadTasksFromCloudUsecase: downloadTasksFromCloudUsecase,
          onBoard: true,
        ) {
    timer = Timer.periodic(
      const Duration(milliseconds: AppSettings.timerInterval),
      (timer) {
        updateTilesTimeElapsed();
        timeElapsedChangeNotifier.notifyListeners();
      },
    );
  }

  void updateTilesTimeElapsed() {
    for (var element in list) {
      element.refresh();
    }
  }

  @override
  Widget Function(BuildContext, int) itemBuilder() {
    return (BuildContext context, int index) {
      return TaskTile(
        taskItem: list[index],
        controller: timeElapsedChangeNotifier,
        onLongPress: () {
          setOnBoardStatusUsecaseExecute(
            taskId: list[index].id,
            onBoard: false,
          );
        },
      );
    };
  }
}
