import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../../core/infra/application/common_state.dart';
import '../../../../core/infra/validators/string_validator.dart';
import '../../../../core/presenter/shared/common_button.dart';
import '../../../../core/presenter/shared/common_loading.dart';
import '../../../../core/presenter/shared/common_scaffold.dart';
import '../../../../core/presenter/shared/common_snackbar.dart';
import '../../../../core/presenter/shared/common_spacing.dart';
import '../../../../core/presenter/shared/common_text_form_field.dart';
import '../../../../core/presenter/theme/lexicon.dart';
import '../../../../core/presenter/theme/responsive_outlet.dart';
import '../../../../core/presenter/theme/size_outlet.dart';
import 'create_task_controller.dart';

class TaskPage extends StatelessWidget {
  final CreateTaskController controller;

  const TaskPage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: controller.form,
        child: ListView(
          padding: EdgeInsets.all(ResponsiveOutlet.paddingExtraLarge(context)),
          children: [
            CommonTextFormField(
              onFieldSubmitted: controller.setDescriptionFocus,
              label: Lexicon.title,
              validator: (v) => StringValidator(v).validate(),
              controller: controller.titleController,
            ),
            CommonSpacing.height(factor: SizeOutlet.spacingFactor3),
            CommonTextFormField(
              onFieldSubmitted: controller.setDueDateFocus,
              focusNode: controller.descriptionFocus,
              label: Lexicon.dueDate,
              validator: (v) => StringValidator(v).validate(),
              controller: controller.dueDateController,
            ),
            CommonSpacing.height(factor: SizeOutlet.spacingFactor3),
            CommonTextFormField(
              focusNode: controller.dueDateFocus,
              label: Lexicon.description,
              validator: (v) => StringValidator(v).validate(),
              controller: controller.descriptionController,
            ),
            CommonSpacing.height(factor: SizeOutlet.spacingFactor3),
            Padding(
              padding: EdgeInsets.symmetric(vertical: ResponsiveOutlet.paddingDefault(context)),
              child: ValueListenableBuilder(
                valueListenable: controller,
                builder: (_, state, child) {
                  if (state is LoadingState) {
                    return const CommonLoading(SizeOutlet.loadingForButtons);
                  } else if (state is SuccessState) {
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        CommonSnackBar.fromSuccess(Lexicon.taskCreated),
                      );
                      controller.value = IdleState();
                    });
                  } else if (state is ErrorState) {
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        CommonSnackBar.fromError(state.message),
                      );
                      controller.value = IdleState();
                    });
                  }
                  return CommonButton(
                    description: Lexicon.createNewTask,
                    onPressed: controller.executeAddNewTask,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
