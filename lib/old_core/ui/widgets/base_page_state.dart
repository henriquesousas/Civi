import 'package:deehelp/old_core/ui/widgets/card/ui_custom_scaffold.dart';
import 'package:deehelp/old_core/ui/widgets/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// P = Provider
// S = State
abstract class BasePageState<P extends ProviderListenable<S>, S,
    T extends BasePage<P, S>> extends ConsumerState<T> {
  S watch() => ref.watch(widget.provider);

  S read() => ref.read(widget.provider);

  void navigate(String router) {
    context.push(router);
  }

  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  Widget? buildBottomNavigationBar() => null;

  void listener(BuildContext context, S state) {}

  Widget buildPage(BuildContext context, S state);

  String? pageTitle() => '';

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(widget.provider);

    ref.listen<S>(widget.provider, (prev, next) {
      listener(context, next);
    });

    return UICustomScaffold(
      bottomNavigationBar: buildBottomNavigationBar(),
      pageTitle: pageTitle(),
      body: buildPage(context, state),
    );
  }
}
