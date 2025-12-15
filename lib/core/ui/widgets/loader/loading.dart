import 'dart:async';

import 'package:deehelp/core/ui/widgets/loader/loading_controller.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class Loading {
  Loading._sharedInstance();

  LoadingController? _controller;

  factory Loading.instance() => _shared;
  static final Loading _shared = Loading._sharedInstance();
  bool _isShowing = false;

  void hide() {
    // _controller?.close();
    // _controller = null;
    // _isShowing = false;
  }

  //todo: Loading
  void show({
    required BuildContext context,
    required String text,
  }) {
    // if (_controller?.update(text) ?? false) {
    //   return;
    // }
    //
    // if (_isShowing) {
    //   hide();
    // }
    //
    // _controller = _showOverlay(context: context, text: text);
    // _isShowing = true;
  }

  LoadingController _showOverlay(
      {required BuildContext context, required String text}) {
    final newText = StreamController<String>();
    newText.add(text);
    final state = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final overlay = OverlayEntry(
      builder: (context) {
        return Material(
          color: AppColors.darkGreyColor.withValues(alpha: 0.3),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                constraints: BoxConstraints(
                  maxWidth: size.width * 0.5,
                  maxHeight: size.height * 0.8,
                  minWidth: size.width * 0.5,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 20,
                    children: [
                      const CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                      StreamBuilder(
                        stream: newText.stream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              snapshot.data ?? "",
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
    state.insert(overlay);
    return LoadingController(
      close: () {
        newText.close();
        overlay.remove();
        return true;
      },
      update: (text) {
        newText.add(text);
        return true;
      },
    );
  }
}
