import 'package:deehelp/core/ui/widgets/cards/ui_custom_scaffold.dart';
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

  bool hideAppBar() => false;

  Widget? leading() => null;

  List<Widget>? actionButton() => null;

  @override
  Widget build(BuildContext context) {
    listener();
    return UICustomScaffold(
      hideAppBar: hideAppBar(),
      padding: padding(),
      leading: leading(),
      onBackButtonTap: onBackPress(),
      actionButton: actionButton(),
      bottomNavigationBar: buildBottomNavigationBar(),
      pageTitle: pageTitle(),
      body: buildPage(context),
    );
  }
}
