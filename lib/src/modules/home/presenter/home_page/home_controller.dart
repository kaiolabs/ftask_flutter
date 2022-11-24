import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task/src/core/domain/entities/user_entity.dart';
import 'package:task/src/core/domain/usecases/i_upload_tasks_to_cloud_usecase.dart';
import 'package:task/src/core/infra/application/app_settings.dart';
import 'package:task/src/core/infra/application/logger.dart';

import '../../../../core/domain/entities/task_entity.dart';
import '../../../../core/domain/usecases/i_download_tasks_from_cloud_usecase.dart';
import '../../../../core/domain/usecases/i_put_task_from_broadcast_usecase.dart';
import '../../../../core/infra/services/broadcast_controller.dart';
import '../../../../core/infra/services/signalr_helper.dart';
import '../../models/upsert_one_model.dart';
import '../create_task_page/create_task_controller.dart';
import '../create_task_page/create_task_page.dart';
import '../list_task_done_page/list_task_done_controller.dart';
import '../list_task_done_page/list_task_done_page.dart';
import '../list_task_page/list_task_controller.dart';
import '../list_task_page/list_task_page.dart';

class HomeController extends ChangeNotifier {
  int pageSelectedIndex = AppSettings.initialPageIndex;
  final CreateTaskController taskPageController;
  final ListTaskController listTaskController;
  final ListTaskDoneController listTaskDoneController;
  final IPutTaskFromBroadcastUsecase putTaskFromBroadcastUsecase;
  final IUploadTasksToCloudUsecase uploadTasksToCloudUsecase;
  final IDownloadTasksFromCloudUsecase downloadTasksFromCloudUsecase;
  final BroadcastController broadcastController;
  final ValueNotifier<String> homeStateValueListenable = ValueNotifier('');
  final UserEntity loggedUser;

  final SignalRHelper hub;
  final PageController pageController = PageController(initialPage: AppSettings.initialPageIndex, keepPage: true);
  final List<Widget> pages;

  HomeController({
    required this.hub,
    required this.taskPageController,
    required this.listTaskController,
    required this.listTaskDoneController,
    required this.putTaskFromBroadcastUsecase,
    required this.uploadTasksToCloudUsecase,
    required this.downloadTasksFromCloudUsecase,
    required this.broadcastController,
    required this.loggedUser,
  }) : pages = [
          TaskPage(controller: taskPageController),
          ListTaskPage(controller: listTaskController),
          ListTaskDonePage(controller: listTaskDoneController),
        ] {
    callGetAllTasksControllersFromLocal();
    uploadAndGetAllFromCloudExecute();

    broadcastController.getAllTasksBroadcastValueNotifier.addListener(() async {
      await downloadTasksFromCloudUsecase();
      callGetAllTasksControllersFromLocal();
    });

    broadcastController.putTaskBroadcastValueNotifier.addListener(
      () async {
        TaskEntity taskEntity = TaskEntity.fromCloud(broadcastController.putTaskBroadcastValueNotifier.value.entity);
        String errorMessage = broadcastController.putTaskBroadcastValueNotifier.value.errorMessage;
        await putTaskFromBroadcastUsecase(taskEntity).then(
          (value) {
            UpsertOneModel? response =
                errorMessage.isNotEmpty ? UpsertOneModel.fromMessage(errorMessage, taskEntity) : null;
            callGetAllTasksControllersFromLocal(response: response);
          },
        ).onError(
          (error, stackTrace) {
            fLog.e(error.toString());
          },
        );
      },
    );

    broadcastController.uploadAllTasksBroadcastMessage.addListener(
      () async {
        var v = broadcastController.uploadAllTasksBroadcastMessage.value;
        if (loggedUser.id == v.userId) {
          homeStateValueListenable.value = v.errorMessage;
        }
        callGetAllTasksControllersFromLocal();
      },
    );
  }

  callGetAllTasksControllersFromLocal({UpsertOneModel? response}) async {
    listTaskController.getAllTasksFromLocal();
    listTaskDoneController.getAllTasksFromLocal();
  }

  void uploadAndGetAllFromCloudExecute() async {
    await uploadTasksToCloudUsecase();
    await downloadTasksFromCloudUsecase();
  }

  changePage(int index) {
    pageController.animateToPage(index, duration: const Duration(milliseconds: 700), curve: Curves.easeOutCubic);
    pageSelectedIndex = index;
    notifyListeners();
  }
}
