import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:task/app_module.dart';
import 'package:task/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Modular.to.addListener(() {
    if (kDebugMode) {
      print(Modular.to.path);
    }
  });

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
