import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'src/core/presenter/theme/color_outlet.dart';
import 'src/core/presenter/theme/font_family_outlet.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
          fontFamily: FontFamilyOutlet.sensation,
          textSelectionTheme: const TextSelectionThemeData(
              selectionColor: ColorOutlet.secondary, selectionHandleColor: ColorOutlet.secondary)),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      debugShowCheckedModeBanner: false,
    );
  }
}
