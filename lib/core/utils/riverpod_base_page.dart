import 'package:deehelp/core/ui/widgets/card/ui_custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class RiverpodBasePage extends ConsumerStatefulWidget {
  const RiverpodBasePage({super.key});
}

abstract class RiverpodBasePageState<T extends RiverpodBasePage>
    extends ConsumerState<T> {
  Widget buildPage(BuildContext context);

  Widget? buildBottomNavigationBar() => null;

  String? pageTitle() => '';

  void listener() {}

  VoidCallback? onBackPress() => null;

  EdgeInsetsGeometry? padding() => null;

  @override
  Widget build(BuildContext context) {
    listener();
    return UICustomScaffold(
      padding: padding(),
      onBackButtonTap: onBackPress(),
      bottomNavigationBar: buildBottomNavigationBar(),
      pageTitle: pageTitle(),
      body: buildPage(context),
    );
  }
}
