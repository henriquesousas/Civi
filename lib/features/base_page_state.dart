import 'package:deehelp/core/widgets/card/ui_custom_scaffold.dart';
import 'package:deehelp/features/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// T = Cubit/Bloc, S = State
// P = A classe de Página concreta que estende BasePageState
abstract class BasePageState<T extends StateStreamable<S>, S,
    P extends BasePage<T, S>> extends State<P> {
  T get cubit => widget.bloc ?? context.read<T>();

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
    return UICustomScaffold(
      // appBar: buildAppBar(context),
      // actionButton: [
      //   AddNewProductWidget(
      //     press: () {},
      //   )
      // ],
      bottomNavigationBar: buildBottomNavigationBar(),
      pageTitle: pageTitle(),
      body: BlocConsumer<T, S>(
        bloc: cubit,
        listener: listener,
        builder: (context, state) {
          return buildPage(context, state);
        },
      ),
    );
  }
}
