import 'package:flutter/material.dart';
import '../../shared/list_task_base_page.dart';
import 'list_task_done_controller.dart';

class ListTaskDonePage extends ListTaskBasePage {
  const ListTaskDonePage({Key? key, required ListTaskDoneController controller})
      : super(
          key: key,
          controller: controller,
        );
}
