import 'package:flutter/cupertino.dart';

import '../../../core/domain/entities/task_entity.dart';
import '../../../core/domain/repositories/i_repository_factory.dart';
import '../../../core/domain/usecases/i_download_tasks_from_cloud_usecase.dart';
import '../../../core/domain/usecases/i_set_on_board_status_usecase.dart';
import '../../../core/domain/usecases/i_upload_tasks_to_cloud_usecase.dart';
import '../../../core/infra/application/common_state.dart';
import '../models/task_tile_model.dart';
import '../models/upsert_one_model.dart';
import '../presenter/list_task_done_page/widgets/task_done_tile.dart';

class ListTaskBaseController extends ValueNotifier<CommonState> {
  final IRepositoryFactory repositoryFactory;
  final List<TaskTileModel> list = [];
  final ISetOnBoardStatusUsecase setOnBoardStatusUsecase;
  final IUploadTasksToCloudUsecase uploadTasksToCloudUsecase;
  final IDownloadTasksFromCloudUsecase downloadTasksFromCloudUsecase;
  final bool _onBoard;

  ListTaskBaseController({
    required this.repositoryFactory,
    required this.setOnBoardStatusUsecase,
    required this.uploadTasksToCloudUsecase,
    required this.downloadTasksFromCloudUsecase,
    required bool onBoard,
  })  : _onBoard = onBoard,
        super(IdleState());

  void setOnBoardStatusUsecaseExecute({required String taskId, required bool onBoard}) async {
    setOnBoardStatusUsecase(taskId, onBoard).then(
      (_) {
        getAllTasksFromLocal();
      },
    ).onError(
      (error, stackTrace) {
        value = ErrorState(
          error.toString(),
        );
      },
    );
  }

  void getAllTasksFromLocal({UpsertOneModel? response}) async {
    value = LoadingState();
    repositoryFactory.get<TaskEntity>().then(
      (taskRepository) async {
        taskRepository.getWhere((t) => t.onBoard == _onBoard).then(
          (v) {
            if (v is Exception) {
              value = ErrorState(v.toString());
            } else {
              list.clear();
              list.addAll(v.map((e) => TaskTileModel.fromEntity(e)));
              if (response != null) {
                list
                    .cast<TaskTileModel?>()
                    .firstWhere((element) => element?.id == response.entity.id, orElse: () => null)
                    ?.errorMessage = response.errorMessage;
              }
              value = SuccessState();
            }
          },
        );
      },
    );
  }

  Future<void> uploadAndGetAllFromCloudExecute() async {
    await uploadTasksToCloudUsecase();
    await downloadTasksFromCloudUsecase();
    getAllTasksFromLocal();
  }

  Widget Function(BuildContext, int) itemBuilder() {
    throw UnimplementedError();
  }
}
