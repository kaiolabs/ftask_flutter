import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:task/src/core/presenter/theme/color_outlet.dart';
import 'package:task/src/modules/home/shared/list_task_base_controller.dart';

import '../../../core/infra/application/common_state.dart';
import '../../../core/presenter/shared/common_loading.dart';
import '../../../core/presenter/shared/common_scaffold.dart';
import '../../../core/presenter/shared/common_snackbar.dart';
import '../../../core/presenter/theme/lexicon.dart';
import '../../../core/presenter/theme/responsive_outlet.dart';
import '../../../core/presenter/theme/size_outlet.dart';

class ListTaskBasePage extends StatelessWidget {
  final ListTaskBaseController controller;

  const ListTaskBasePage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ValueListenableBuilder(
        valueListenable: controller,
        builder: (_, state, child) {
          if (state is LoadingState) {
            return CommonLoading.responsive(SizeOutlet.loadingForButtons);
          } else if (state is SuccessState) {
            return Padding(
              padding: EdgeInsets.all(ResponsiveOutlet.paddingDefault(context)),
              child: RefreshIndicator(
                backgroundColor: ColorOutlet.primary,
                color: ColorOutlet.accent,
                onRefresh: () => controller.uploadAndGetAllFromCloudExecute(),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: ResponsiveOutlet.cardRatio(context),
                      crossAxisSpacing: ResponsiveOutlet.paddingDefault(context),
                      mainAxisSpacing: ResponsiveOutlet.paddingDefault(context),
                      childAspectRatio: ResponsiveOutlet.cardSliverRatio(context),
                    ),
                    itemCount: controller.list.length,
                    itemBuilder: controller.itemBuilder()),
              ),
            );
          } else if (state is ErrorState) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(CommonSnackBar.fromError(state.message));
              controller.value = IdleState();
            });
          }
          return const SizedBox();
        },
      ),
    );
  }
}
