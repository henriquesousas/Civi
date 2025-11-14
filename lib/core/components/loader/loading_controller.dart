import 'package:flutter/foundation.dart';

typedef CloseLoadingScreen = Function();
typedef UpdateLoadingScreen = Function(String text);

@immutable
class LoadingController {
  final CloseLoadingScreen close;
  final UpdateLoadingScreen update;

  const LoadingController({required this.close, required this.update});
}
