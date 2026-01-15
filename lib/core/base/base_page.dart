import 'package:deehelp/core/ui/widgets/card/ui_custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BasePage extends ConsumerStatefulWidget {
  const BasePage({super.key});
}

abstract class BasePageState<T extends BasePage> extends ConsumerState<T> {
  Widget buildPage(BuildContext context);

  Widget? buildBottomNavigationBar() => null;

  String? pageTitle() => '';

  void listener() {}

  VoidCallback? onBackPress() => null;

  EdgeInsetsGeometry? padding() => null;

  @override
  Widget build(BuildContext context) {
    listener();
    return ScaffoldMessenger(
      child: UICustomScaffold(
        padding: padding(),
        onBackButtonTap: onBackPress(),
        bottomNavigationBar: buildBottomNavigationBar(),
        pageTitle: pageTitle(),
        body: buildPage(context),
      ),
    );
  }
}
