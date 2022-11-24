import 'package:flutter/material.dart';

import '../../../../core/presenter/shared/common_scaffold.dart';
import '../../../../core/presenter/shared/common_snackbar.dart';
import '../../../../core/presenter/theme/color_outlet.dart';
import '../../../../core/presenter/theme/lexicon.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;

  const HomePage({Key? key, required this.controller}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    widget.controller.homeStateValueListenable.addListener(() {
      if (widget.controller.homeStateValueListenable.value != '') {
        ScaffoldMessenger.of(context).showSnackBar(CommonSnackBar(
            content: Text(widget.controller.homeStateValueListenable.value), backgroundColor: ColorOutlet.accent));
        widget.controller.homeStateValueListenable.value = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
        bottonNavBar: AnimatedBuilder(
          animation: widget.controller,
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                backgroundColor: ColorOutlet.primary,
                unselectedItemColor: ColorOutlet.secondary,
                selectedItemColor: ColorOutlet.accent,
                type: BottomNavigationBarType.fixed,
                currentIndex: widget.controller.pageSelectedIndex,
                onTap: (index) {
                  widget.controller.changePage(index);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: widget.controller.pageSelectedIndex == 0
                        ? const Icon(Icons.task)
                        : const Icon(Icons.task_outlined),
                    label: Lexicon.task,
                  ),
                  BottomNavigationBarItem(
                    icon: widget.controller.pageSelectedIndex == 1
                        ? const Icon(Icons.format_list_bulleted)
                        : const Icon(Icons.list_outlined),
                    label: Lexicon.tasks,
                  ),
                  BottomNavigationBarItem(
                    icon: widget.controller.pageSelectedIndex == 2
                        ? const Icon(Icons.fact_check_rounded)
                        : const Icon(Icons.fact_check_outlined),
                    label: Lexicon.tasksDone,
                  ),
                ],
              ),
            );
          },
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: widget.controller.pageController,
          children: widget.controller.pages,
        ));
  }
}
