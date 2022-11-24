import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:task/src/core/presenter/theme/responsive_outlet.dart';

import '../shared/common_scaffold.dart';
import '../theme/color_outlet.dart';
import '../theme/lexicon.dart';

class WildcardPage extends StatelessWidget {
  const WildcardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Modular.to.navigate('/src/');
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        ),
        title: Lexicon.wildcard,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                Lexicon.fourHundredFour,
                style: TextStyle(
                  color: ColorOutlet.accent,
                  fontSize: ResponsiveOutlet.textHuge(context),
                ),
              ),
            ),
            Center(
              child: Text(
                Lexicon.wildcardMessage,
                style: TextStyle(
                  color: ColorOutlet.secondary,
                  fontSize: ResponsiveOutlet.textDefault(context),
                ),
              ),
            ),
          ],
        ));
  }
}
