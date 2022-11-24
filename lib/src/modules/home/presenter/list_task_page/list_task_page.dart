import 'package:flutter/material.dart';
import '../../shared/list_task_base_page.dart';
import 'list_task_controller.dart';

class ListTaskPage extends ListTaskBasePage {
  const ListTaskPage({Key? key, required ListTaskController controller})
      : super(
          key: key,
          controller: controller,
        );
}
