import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/main/state/bottom_navigation_bloc.dart';

class BlocAppProvider extends StatelessWidget {
  final Widget child;

  const BlocAppProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavigationBloc>(
          create: (context) => BottomNavigationBloc(),
        ),
      ],
      child: child,
    );
  }
}
