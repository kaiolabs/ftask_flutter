import 'package:flutter/material.dart';
import 'package:task/src/core/presenter/theme/font_family_outlet.dart';
import 'package:task/src/core/presenter/theme/responsive_outlet.dart';

import '../theme/color_outlet.dart';

class CommonScaffold extends StatelessWidget {
  final String? title;
  final Widget body;
  final Widget? bottonNavBar;

  ///wraped inside a builder
  ///The Builder is used in this example to ensure that the context refers to that part of the subtree.
  ///That way this code snippet can be used even inside the very code that is creating the
  /// Scaffold (in which case, without the Builder, the context wouldn't be able to see the Scaffold,
  /// since it would refer to an ancestor of that widget).
  final Widget? leading;

  const CommonScaffold({Key? key, this.title, required this.body, this.bottonNavBar, this.leading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorOutlet.primary,
      appBar: title == null
          ? null
          : AppBar(
              leading: leading ??
                  Builder(
                    builder: (BuildContext context) {
                      return leading ?? Container();
                    },
                  ),
              centerTitle: true,
              title: Text(title ?? ''),
              backgroundColor: ColorOutlet.primary,
              iconTheme: const IconThemeData(color: ColorOutlet.secondary),
              titleTextStyle: TextStyle(
                fontFamily: FontFamilyOutlet.sensation,
                color: ColorOutlet.secondary,
                fontSize: ResponsiveOutlet.textHuge(context),
              ),
            ),
      body: body,
      bottomNavigationBar: bottonNavBar,
    );
  }
}
